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
// Created by Mingkai on 2024/03/12.
//

#include <weed_killing/pid.h>

#define I_SEP		0							//积分分离
#define I_MAX		6000						//积分限幅
#define OUT_MAX	    24000						//输出限幅

#define LimitMax(input, max)    \
{                               \
    if (input > max)            \
    {                           \
        input = max;            \
    }                           \
    else if (input < -max)      \
    {                           \
        input = -max;           \
    }                           \
}


pid_cplus::pid_cplus()
{
   yaw_motor.kp = 0.08;
   yaw_motor.ki = 0.0;
   yaw_motor.kd = -0.01;
   yaw_motor.lastmeasure = 0.0;
   yaw_motor.error = 0.0;
   yaw_motor.iout = 0.0;
   yaw_motor.pout = 0.0;
   yaw_motor.dout = 0.0;

   pitch_motor.kp = 0.08;
   pitch_motor.ki = 0.0;
   pitch_motor.kd = -0.01;
   pitch_motor.lastmeasure = 0.0;
   pitch_motor.error = 0.0;
   pitch_motor.iout = 0.0;
   pitch_motor.pout = 0.0;
   pitch_motor.dout = 0.0;
   std::cout << "初始化成功！"<<std::endl;
} 

float pid_cplus::PID_Control_Yaw(float measure,float target)
{
	yaw_motor.error = target - measure;
	
	yaw_motor.pout = yaw_motor.error * yaw_motor.kp;
	if((yaw_motor.error > I_SEP) || (yaw_motor.error < -I_SEP))
		yaw_motor.iout += yaw_motor.error * yaw_motor.ki;
	yaw_motor.dout = (measure - yaw_motor.lastmeasure) * yaw_motor.kd;
	yaw_motor.out = yaw_motor.pout + yaw_motor.iout + yaw_motor.dout;
	
	LimitMax(yaw_motor.iout, I_MAX);		//积分限幅
	LimitMax(yaw_motor.out, OUT_MAX);		//输出限幅
	
	yaw_motor.lastmeasure = measure;				//更新上次测量值
    return yaw_motor.out;
}

float pid_cplus::PID_Control_Pitch(float measure,float target)
{
	pitch_motor.error = target - measure;
	pitch_motor.pout = pitch_motor.error * pitch_motor.kp;
	if((pitch_motor.error > I_SEP) || (pitch_motor.error < -I_SEP))
		pitch_motor.iout += pitch_motor.error * pitch_motor.ki;

    // std::cout << "Pitch: " << pitch_motor.iout<< std::endl;

	pitch_motor.dout = (measure - pitch_motor.lastmeasure) * pitch_motor.kd;
	pitch_motor.out = pitch_motor.pout + pitch_motor.iout + pitch_motor.dout;
	
	LimitMax(pitch_motor.iout, I_MAX);		//积分限幅
	LimitMax(pitch_motor.out, OUT_MAX);		//输出限幅
	
	pitch_motor.lastmeasure = measure;				//更新上次测量值
    return pitch_motor.out;
}