;; Auto-generated. Do not edit!


(when (boundp 'weed_killing::SetServoDamping)
  (if (not (find-package "WEED_KILLING"))
    (make-package "WEED_KILLING"))
  (shadow 'SetServoDamping (find-package "WEED_KILLING")))
(unless (find-package "WEED_KILLING::SETSERVODAMPING")
  (make-package "WEED_KILLING::SETSERVODAMPING"))

(in-package "ROS")
;;//! \htmlinclude SetServoDamping.msg.html


(defclass weed_killing::SetServoDamping
  :super ros::object
  :slots (_id _power ))

(defmethod weed_killing::SetServoDamping
  (:init
   (&key
    ((:id __id) 0)
    ((:power __power) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _power (round __power))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:power
   (&optional __power)
   (if __power (setq _power __power)) _power)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; uint16 _power
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; uint16 _power
       (write-word _power s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _power
     (setq _power (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get weed_killing::SetServoDamping :md5sum-) "a5f9d7f2f2291fcc1ddba2b1e73469a0")
(setf (get weed_killing::SetServoDamping :datatype-) "weed_killing/SetServoDamping")
(setf (get weed_killing::SetServoDamping :definition-)
      "uint8 id
uint16 power
")



(provide :weed_killing/SetServoDamping "a5f9d7f2f2291fcc1ddba2b1e73469a0")


