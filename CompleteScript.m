close;
clear;
clc;

droneObj=ryze()
cameraObj = camera(droneObj)
takeoff(droneObj);

data=load("Calibration\Test-6\cameraParams.mat");
intrinsics=data.cameraParams.Intrinsics;
tagSize=0.08;
tagFamily=["tag36h11",];
vid=VideoWriter("Output\Test0");
open(vid);

while true
    I=snapshot(cameraObj);
    writeVideo(vid,I);
    I=undistortImage(I,intrinsics,OutputView="same");
    [id,loc,pose]=readAprilTag(I,tagFamily,intrinsics,tagSize);
    worldPoints=[0 0 0; tagSize/2 0 0; 0 tagSize/2 0; 0 0 tagSize/2];
    for i = 1:length(pose)
        % Get image coordinates for axes.
        imagePoints = world2img(worldPoints,pose(i),intrinsics);

        % Draw colored axes.
        I = insertShape(I,Line=[imagePoints(1,:) imagePoints(2,:); ...
            imagePoints(1,:) imagePoints(3,:); imagePoints(1,:) imagePoints(4,:)], ...
            Color=["red","green","blue"],LineWidth=7);

        I = insertText(I,loc(1,:,i),id(i),BoxOpacity=1,FontSize=25);
        target = pose(i);
        disp("The target (id="+id(i)+ ") is "+pose(i).Translation(3)+" cm away, "+pose(i).Translation(1)+" cm to the left and "+pose(i).Translation(2)+" cm downwards")
    end
    %imshow(I);
    targetPos=[target.Translation(3)-0.10, target.Translation(1), target.Translation(2)];
    targetPos=normalize(targetPos,"range").*0.21;
    if isempty(id) 
        disp("No Tag")
        %land(droneObj);
        close(vid);
        break;
    else
        targetRot=[0 1 0]*target.R;
        %targetRot= rotm2eul(target.R);
        turn(droneObj,targetRot(2)*pi*(-1));
        break;
        moveforward(droneObj,duration=0.2);
        %move(droneObj,targetPos,Speed=0.5,WaitUntilDone=false)
    end

end

