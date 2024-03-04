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
#pragma once
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <vector>
#include <cstdlib>
#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <image_transport/image_transport.h>
#include <realtime_tools/realtime_buffer.h>
#include <iostream>
// 自定义服务
#include <weed_killing/QueryServoAngle.h>
// 自定义消息
#include <weed_killing/SetServoAngle.h>
class WeedKilling
{
public:
  WeedKilling();
  ~WeedKilling() = default;
  void weedDetection(); //模拟前向推理得到四个坐标
  void drawRedRectangle();
  void calculate3DPoints();
  void solvePitchandYaw();
  void QueryAngle();
  void run();

private:
  ros::NodeHandle nh_;
  cv::Mat rgb_image;
  realtime_tools::RealtimeBuffer<cv::Mat> depth_image_buffer;
  std::vector<cv::Point> coordinates_2d{6, cv::Point(0, 0)};//6个2d像素坐标
  std::vector<cv::Point3f> coordinates_3d;//6个3d坐标
  static const int image_width = 640;
  static const int image_height = 480;
  static const int rect_width = 60;
  static const int rect_height = 60;
  cv::Mat camera_matrix; //内参矩阵
  cv::Mat distCoeffs;
  ros::Publisher pub_angle_0; //发表舵机角度
  ros::Publisher pub_angle_1; //发表舵机角度
  ros::Subscriber depth_sub; //获取深度信息
  ros::Subscriber image_sub; //RGB图
  ros::ServiceClient query_angle_client;
  void depthCallback(const sensor_msgs::Image::ConstPtr& msg);
  void imageCallback(const sensor_msgs::Image::ConstPtr& msg);
  bool topic_update_ = false;
  weed_killing::QueryServoAngle query_angle_srv0;
  weed_killing::QueryServoAngle query_angle_srv1;
  float angle_0 = 0.0;
  float angle_1 = 0.0;
};
