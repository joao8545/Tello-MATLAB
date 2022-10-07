clear drone
clc

drone=ryze()
cameraObj = camera(drone)
preview(cameraObj)
%moveup(drone,'Distance',0.4,'WaitUntilDone',true)
takeoff(drone)
%movedown(drone,'Distance',0.2,'WaitUntilDone',true)
moveup(drone,'Distance',1,'WaitUntilDone',true)
%moveforward(drone,'Distance',1,'WaitUntilDone',true)
flip(drone,'forward');
land(drone)