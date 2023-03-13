# AprilTag Markers and Tello drone in MATLAB
There are many possibilities for using artificial markers in mobile robotics, like localization and mapping [1] and augmented reality (AR) applications [2]. One of the most popular AR tags is AprilTag due to its efficiency and robustness [3].
AprilTag is based on the ARTag framework but offers several enhancements. Initially, a graph-based image segmentation method analyzing gradient patterns in the picture to correctly estimate lines were introduced. Second, a quad extraction approach is implemented to identify potential possibilities among edges that do not intersect. Thirdly, a new coding system is established to overcome problems caused by the 2D barcode system. These concerns include rotational incompatibility and false positives in outdoor circumstances. As a result, AprilTag is more resilient to occlusions and warping and has a lower rate of false positives. The creators continue to maintain it with regular updates. The primary source of mistakes in AprilTag posture estimation is the camera’s angular rotation. A trigonometric correction method and a pose-indexed probabilistic sensor error model for filtering the tracking data are presented to realign the frame to address the difficulties posed by unaligned yaw.
MATLAB provides the readAprilTag function to detect and estimate the pose of tags [4]. It also has a toolbox to connect the Ryze Tello drone [5] to the system, called the MATLAB Support Package for Ryze Tello Drones [6] 
The task is to detect the tag (or tags) in the Tello video stream and move the drone in front of the marker until it has a specific pose (in a range) in the image.
Hints:
•	There is a GitHub repository for AprilTags with pre-generated sets [7].
•	You have to calibrate the drone’s camera [8].
•	Start with only one direction to control the drone and use PID controller [9] if it is feasible.
References
[1]	“Landmark SLAM Using AprilTag Markers - MATLAB & Simulink.” [Online]. Available: https://www.mathworks.com/help/nav/ug/landmark-slam-using-apriltag-markers.html. [Accessed: Oct. 04, 2022]
[2]	S. Siltanen, “Theory and applications of marker-based augmented reality.” 
[3]	“Comparison of Fiducial Markers - Robotics Knowledgebase.” [Online]. Available: https://roboticsknowledgebase.com/wiki/sensing/fiducial-markers/#apriltag. [Accessed: Oct. 04, 2022]
[4]	“Detect and estimate pose for AprilTag in image - MATLAB readAprilTag.” [Online]. Available: https://www.mathworks.com/help/vision/ref/readapriltag.html. [Accessed: Oct. 04, 2022]
[5]	“Tello Official Website-Shenzhen Ryze Technology Co.,Ltd.” [Online]. Available: https://www.ryzerobotics.com/tello-edu. [Accessed: Sep. 08, 2020]
[6]	“MATLAB Support Package for Ryze Tello Drones Documentation.” [Online]. Available: https://www.mathworks.com/help/supportpkg/ryzeio/index.html?s_tid=CRUX_lftnav. [Accessed: Oct. 04, 2022]
[7]	“GitHub - AprilRobotics/apriltag-imgs: Pre-generated AprilTag images.” [Online]. Available: https://github.com/AprilRobotics/apriltag-imgs. [Accessed: Oct. 04, 2022]
[8]	“Camera Calibration - MATLAB & Simulink.” [Online]. Available: https://www.mathworks.com/help/vision/camera-calibration.html. [Accessed: Oct. 04, 2022]
[9]	“PID controller in parallel form - MATLAB.” [Online]. Available: https://www.mathworks.com/help/control/ref/pid.html. [Accessed: Oct. 04, 2022]
 
