clear;
clc;

drone=ryze()
cameraObj = camera(drone)
i=1;
r=6;
folderName=sprintf('Test-%d',r);
mkdir(folderName);
while true

    frame=snapshot(cameraObj);
    fileName=sprintf('%s\\Image-%d-%d.jpg',folderName,r,i)
    imwrite(frame,fileName,"jpg");
    i=i+1
    pause(2)

end