/*******************************************************************************

    BSD 3-Clause License
    Copyright (c) 2024, Mingkai
    All rights reserved.
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
        Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.
        Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.
        Neither the name of the copyright holder nor the names of its
    contributors may be used to endorse or promote products derived from
    this software without specific prior written permission.
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
    ARE
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
    FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
    DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
    SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    *******************************************************************************/

//
// Created by Mingkai on 2024/03/01.
//
#include <weed_killing/weed_killing.h>

#define HALF_LENGTH 6.5 //单位毫米
#define SERVO_ID_0 0 				        // 舵机ID号
#define SERVO_ID_1 1 				        // 舵机ID号

int main(int argc, char** argv)
{
  ros::init(argc, argv, "weed_killing");  
  WeedKilling weed_killing;
  ros::Rate loop_rate(0.2);
  ros::AsyncSpinner spinner(1);  //多线程处理回调函数
  spinner.start();
  while (ros::ok())
  {
    weed_killing.run();
    // ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}


/*
初始化，世界坐标系以杂草中心点为坐标原点，具体的尺寸要给出，回调函数即私有成员函数，封装好
 */
WeedKilling::WeedKilling()
{
//   depth_sub = nh_.subscribe<sensor_msgs::Image>("/camera/aligned_depth_to_color/image_raw",1,&WeedKilling::depthCallback,this); //需要用的时候再进行初始化
  image_sub   = nh_.subscribe<sensor_msgs::Image>("/camera/color/image_raw", 1, &WeedKilling::imageCallback,this);   // 订阅 RGB 图像话题
  pub_angle_0 = nh_.advertise<weed_killing::SetServoAngle>("set_servo_angle_0", 2);
  pub_angle_1 = nh_.advertise<weed_killing::SetServoAngle>("set_servo_angle_1", 2);
  query_angle_client = nh_.serviceClient<weed_killing::QueryServoAngle>("query_servo_angle");
  camera_matrix = (cv::Mat_<double>(3, 3) << 614.3084106445312, 0.0, 319.85577392578125, 0.0, 613.1393432617188, 236.71205139160156, 0.0, 0.0, 1.0);
  distCoeffs = cv::Mat::zeros(5, 1, CV_64F);
  coordinates_3d = std::vector<cv::Point3f>{
    cv::Point3f(-HALF_LENGTH, -HALF_LENGTH, 0),	// 左上角
    cv::Point3f(HALF_LENGTH, -HALF_LENGTH, 0),	// 右上角
    cv::Point3f(HALF_LENGTH, HALF_LENGTH, 0),	// 右下角
    cv::Point3f(-HALF_LENGTH, HALF_LENGTH, 0),	// 左下角
    cv::Point3f(0, -HALF_LENGTH, 0),            //正上方
    cv::Point3f(0, HALF_LENGTH, 0)              //正下方
};
  query_angle_client.waitForExistence();// 等待角度查询服务开启

}

/*
生成矩形框四个顶点坐标的函数，实际的需要推理后得到目标检测的框才能得到坐标
 */
void WeedKilling::weedDetection() {
    // 随机生成矩形框左上角的坐标
    int x = rand() % (image_width - rect_width);
    int y = rand() % (image_height - rect_height);   // 计算矩形框的右下角坐标
    int x2 = x + rect_width;
    int y2 = y + rect_height;
    coordinates_2d[0] = cv::Point(x, y);             // 左上角
    coordinates_2d[1] = cv::Point(x2, y);            // 右上角
    coordinates_2d[2] = cv::Point(x2, y2);           // 右下角
    coordinates_2d[3] = cv::Point(x, y2);            // 左下角
    coordinates_2d[4] = cv::Point((x+x2)/2, y);      //正上方
    coordinates_2d[5] = cv::Point((x+x2)/2, y2);     //正下方
}


/*
假装框出来
 */
void WeedKilling::drawRedRectangle()
{
  cv::Mat image = cv::Mat::zeros(image_height, image_width, CV_8UC3);
  cv::Scalar redColor(0, 0, 255); // Red color in BGR format
  cv::rectangle(image, coordinates_2d[0], coordinates_2d[2], redColor,2);
      // Show the image with the red rectangle
  cv::imshow("Red Rectangle", image);
  cv::waitKey(60); // Wait for a key press
}

/*
这个没用，是shit
 */
void WeedKilling::calculate3DPoints()
{
   if (topic_update_)
  {
    cv::Mat* depth_image = depth_image_buffer.readFromRT();
    //清除之前的3D点
    coordinates_3d.clear();
    // 遍历每个坐标点
    for (const auto& coord : coordinates_2d) {
        int x = coord.x;
        int y = coord.y;

        // 从深度图像中获取深度值
        ushort depth_value = depth_image->at<ushort>(y, x);
        
        // 将像素坐标转换为相机坐标系下的归一化坐标
        cv::Point2f norm_point((x - camera_matrix.at<double>(0, 2)) / camera_matrix.at<double>(0, 0),
                                (y - camera_matrix.at<double>(1, 2)) / camera_matrix.at<double>(1, 1));

        // 根据深度值计算每个点的实际世界坐标
        float depth = static_cast<float>(depth_value)/1000.f; // 单位为mm
        // std::cout<<"深度为："<<depth_value<<std::endl;
        cv::Point3f world_point(depth * norm_point.x, depth * norm_point.y, depth); // 假设Z轴为深度

        // 将点添加到3D点数组中
        coordinates_3d.push_back(world_point);
    }
  }
    // // 打印3D点的坐标
    // std::cout << "3D相机坐标系坐标：" << std::endl;
    // for (const auto& point : coordinates_3d) {
    //     std::cout << "(" << point.x << ", " << point.y << ", " << point.z << ")" << std::endl;
    // }
    //     // 打印2D点的坐标
    // std::cout << "2D相机坐标系坐标：" << std::endl;
    // for (const auto& point : coordinates_2d) {
    //     std::cout << "(" << point.x << ", " << point.y << ")" << std::endl;
    // }
}


/*
pnp解算出yaw和pitch偏角，yaw往右是正，pitch往上是正
 */
void WeedKilling::solvePitchandYaw()
{
    // 将 coordinates_2d 转换为 cv::Point2f 类型的 vector
    std::vector<cv::Point2f> coordinates_2d_float;
    for (const auto& point : coordinates_2d) {
        coordinates_2d_float.push_back(cv::Point2f(static_cast<float>(point.x), static_cast<float>(point.y)));
    }
    cv::Mat rvec, tvec;
        // 使用solvePnP求解旋转和平移向量
    cv::solvePnP(coordinates_3d, coordinates_2d_float, camera_matrix, distCoeffs, rvec, tvec);
    std::cout << "Vector (tvec): " << tvec << std::endl;
    double tx = tvec.at<double>(0); // 获取 tvec 的第一个元素
    double ty = tvec.at<double>(1); // 获取 tvec 的第二个元素
    double tz = tvec.at<double>(2); // 获取 tvec 的第三个元素

    // 计算Yaw偏角
    double yaw = std::atan2(tx, tz);

    // 计算Pitch偏角
    double pitch = std::atan2(ty, std::sqrt(tx*tx+ tz*tz));

    // 将弧度转换为角度
    yaw = yaw * 180 / CV_PI;
    pitch = pitch * 180 / CV_PI;
    QueryAngle();
    // std::cout << "Yaw (left/right rotation): " << yaw << " degrees" << std::endl;
    // std::cout << "Pitch (up/down rotation): " << pitch << " degrees" << std::endl;
    weed_killing::SetServoAngle msg_0;
    weed_killing::SetServoAngle msg_1;
    msg_0.id = SERVO_ID_0;
    msg_1.id = SERVO_ID_1;
    msg_0.angle = angle_0+yaw;
    msg_1.angle = angle_1+pitch;
        // 发布消息
    pub_angle_0.publish(msg_0);
    pub_angle_1.publish(msg_1);
}


/*
获取深度图像流，如果要读写深度信息，需要用buffer和realtimetool，防止多线程对同一个内存进行读写
 */
void WeedKilling::depthCallback(const sensor_msgs::Image::ConstPtr&msg)
{
    cv_bridge::CvImagePtr Dest;
    Dest = cv_bridge::toCvCopy(msg,sensor_msgs::image_encodings::TYPE_16UC1);
    depth_image_buffer.writeFromNonRT(Dest->image.clone());
    topic_update_ = true;
}


/*
获取rgb图像流，在回调函数里imshow可视化
 */
void WeedKilling::imageCallback(const sensor_msgs::Image::ConstPtr& msg)
{
    // 将 ROS 消息转换为 OpenCV 格式
    cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
        // 显示图像
    rgb_image = cv_ptr->image;

    // 显示图像
    cv::imshow("RGB Image", rgb_image);
    cv::waitKey(60); // 等待按键事件
}

void WeedKilling::QueryAngle()
{
        // 构造服务请求头
        query_angle_srv0.request.id = SERVO_ID_0;
        // 发送服务请求
        if(query_angle_client.call(query_angle_srv0)){
            // 服务成功
            angle_0 = query_angle_srv0.response.angle;
        }else{
            // 发送失败
            ROS_INFO("[Send]Query Servo %d Angle Failed", SERVO_ID_0);
        }
        query_angle_srv1.request.id = SERVO_ID_1;
        // 发送服务请求
        if(query_angle_client.call(query_angle_srv1)){
            // 服务成功
            angle_1 = query_angle_srv1.response.angle;
        }else{
            // 发送失败
            ROS_INFO("[Send]Query Servo %d Angle Failed", SERVO_ID_1);
        }
    // std::cout << "angle_0: " << angle_0 << std::endl;
    // std::cout << "angle_1: " << angle_1 << std::endl;
}

void WeedKilling::run(){
    
  weedDetection();
  drawRedRectangle();
//   calculate3DPoints();
  solvePitchandYaw();
}