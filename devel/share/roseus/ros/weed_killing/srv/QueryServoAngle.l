;; Auto-generated. Do not edit!


(when (boundp 'weed_killing::QueryServoAngle)
  (if (not (find-package "WEED_KILLING"))
    (make-package "WEED_KILLING"))
  (shadow 'QueryServoAngle (find-package "WEED_KILLING")))
(unless (find-package "WEED_KILLING::QUERYSERVOANGLE")
  (make-package "WEED_KILLING::QUERYSERVOANGLE"))
(unless (find-package "WEED_KILLING::QUERYSERVOANGLEREQUEST")
  (make-package "WEED_KILLING::QUERYSERVOANGLEREQUEST"))
(unless (find-package "WEED_KILLING::QUERYSERVOANGLERESPONSE")
  (make-package "WEED_KILLING::QUERYSERVOANGLERESPONSE"))

(in-package "ROS")





(defclass weed_killing::QueryServoAngleRequest
  :super ros::object
  :slots (_id ))

(defmethod weed_killing::QueryServoAngleRequest
  (:init
   (&key
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass weed_killing::QueryServoAngleResponse
  :super ros::object
  :slots (_angle ))

(defmethod weed_killing::QueryServoAngleResponse
  (:init
   (&key
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _angle (float __angle))
   self)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass weed_killing::QueryServoAngle
  :super ros::object
  :slots ())

(setf (get weed_killing::QueryServoAngle :md5sum-) "3fa0610a2c670f4fbf342f6899c09e8c")
(setf (get weed_killing::QueryServoAngle :datatype-) "weed_killing/QueryServoAngle")
(setf (get weed_killing::QueryServoAngle :request) weed_killing::QueryServoAngleRequest)
(setf (get weed_killing::QueryServoAngle :response) weed_killing::QueryServoAngleResponse)

(defmethod weed_killing::QueryServoAngleRequest
  (:response () (instance weed_killing::QueryServoAngleResponse :init)))

(setf (get weed_killing::QueryServoAngleRequest :md5sum-) "3fa0610a2c670f4fbf342f6899c09e8c")
(setf (get weed_killing::QueryServoAngleRequest :datatype-) "weed_killing/QueryServoAngleRequest")
(setf (get weed_killing::QueryServoAngleRequest :definition-)
      "uint8 id
---
float32 angle
")

(setf (get weed_killing::QueryServoAngleResponse :md5sum-) "3fa0610a2c670f4fbf342f6899c09e8c")
(setf (get weed_killing::QueryServoAngleResponse :datatype-) "weed_killing/QueryServoAngleResponse")
(setf (get weed_killing::QueryServoAngleResponse :definition-)
      "uint8 id
---
float32 angle
")



(provide :weed_killing/QueryServoAngle "3fa0610a2c670f4fbf342f6899c09e8c")


