close;
clear;
clc;

droneObj=ryze()
cameraObj = camera(droneObj)

data=load("Calibration\Test-6\cameraParams.mat");
intrinsics=data.cameraParams.Intrinsics;
tagSize=0.08;
tagFamily=["tag36h11",];

while true
    I=snapshot(cameraObj);
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
        disp("The target is "+pose(i).Translation(3)+" cm away, "+pose(i).Translation(1)+" cm to the left and "+pose(i).Translation(2)+" cm downwards")
    end
    %imshow(I);
    break;
end

takeoff(droneObj);
move(droneObj,[pose(3)-10, pose(1), pose(2)],Speed=0.5)

