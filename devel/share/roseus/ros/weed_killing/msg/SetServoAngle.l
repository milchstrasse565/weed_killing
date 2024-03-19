;; Auto-generated. Do not edit!


(when (boundp 'weed_killing::SetServoAngle)
  (if (not (find-package "WEED_KILLING"))
    (make-package "WEED_KILLING"))
  (shadow 'SetServoAngle (find-package "WEED_KILLING")))
(unless (find-package "WEED_KILLING::SETSERVOANGLE")
  (make-package "WEED_KILLING::SETSERVOANGLE"))

(in-package "ROS")
;;//! \htmlinclude SetServoAngle.msg.html


(defclass weed_killing::SetServoAngle
  :super ros::object
  :slots (_id _angle ))

(defmethod weed_killing::SetServoAngle
  (:init
   (&key
    ((:id __id) 0)
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _angle (float __angle))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get weed_killing::SetServoAngle :md5sum-) "39fc2bc02ee4598568e833e115b496ba")
(setf (get weed_killing::SetServoAngle :datatype-) "weed_killing/SetServoAngle")
(setf (get weed_killing::SetServoAngle :definition-)
      "uint8 id
float32 angle
")



(provide :weed_killing/SetServoAngle "39fc2bc02ee4598568e833e115b496ba")


