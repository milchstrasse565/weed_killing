// Generated by gencpp from file weed_killing/QueryServoAngle.msg
// DO NOT EDIT!


#ifndef WEED_KILLING_MESSAGE_QUERYSERVOANGLE_H
#define WEED_KILLING_MESSAGE_QUERYSERVOANGLE_H

#include <ros/service_traits.h>


#include <weed_killing/QueryServoAngleRequest.h>
#include <weed_killing/QueryServoAngleResponse.h>


namespace weed_killing
{

struct QueryServoAngle
{

typedef QueryServoAngleRequest Request;
typedef QueryServoAngleResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct QueryServoAngle
} // namespace weed_killing


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::weed_killing::QueryServoAngle > {
  static const char* value()
  {
    return "3fa0610a2c670f4fbf342f6899c09e8c";
  }

  static const char* value(const ::weed_killing::QueryServoAngle&) { return value(); }
};

template<>
struct DataType< ::weed_killing::QueryServoAngle > {
  static const char* value()
  {
    return "weed_killing/QueryServoAngle";
  }

  static const char* value(const ::weed_killing::QueryServoAngle&) { return value(); }
};


// service_traits::MD5Sum< ::weed_killing::QueryServoAngleRequest> should match
// service_traits::MD5Sum< ::weed_killing::QueryServoAngle >
template<>
struct MD5Sum< ::weed_killing::QueryServoAngleRequest>
{
  static const char* value()
  {
    return MD5Sum< ::weed_killing::QueryServoAngle >::value();
  }
  static const char* value(const ::weed_killing::QueryServoAngleRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::weed_killing::QueryServoAngleRequest> should match
// service_traits::DataType< ::weed_killing::QueryServoAngle >
template<>
struct DataType< ::weed_killing::QueryServoAngleRequest>
{
  static const char* value()
  {
    return DataType< ::weed_killing::QueryServoAngle >::value();
  }
  static const char* value(const ::weed_killing::QueryServoAngleRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::weed_killing::QueryServoAngleResponse> should match
// service_traits::MD5Sum< ::weed_killing::QueryServoAngle >
template<>
struct MD5Sum< ::weed_killing::QueryServoAngleResponse>
{
  static const char* value()
  {
    return MD5Sum< ::weed_killing::QueryServoAngle >::value();
  }
  static const char* value(const ::weed_killing::QueryServoAngleResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::weed_killing::QueryServoAngleResponse> should match
// service_traits::DataType< ::weed_killing::QueryServoAngle >
template<>
struct DataType< ::weed_killing::QueryServoAngleResponse>
{
  static const char* value()
  {
    return DataType< ::weed_killing::QueryServoAngle >::value();
  }
  static const char* value(const ::weed_killing::QueryServoAngleResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // WEED_KILLING_MESSAGE_QUERYSERVOANGLE_H
