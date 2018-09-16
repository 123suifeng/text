

phns = ['E:\6-InputData\Calibrate_5_Peg\dvrk_Ground_Right.txt'];
phns_IMU = ['E:\6-InputData\Calibrate_5_Peg\dvrk_IMU_Right.txt'];

phns = ['E:\6-InputData\Calibrate_4_Range\dvrk_Ground_Right.txt'];
phns_IMU = ['E:\6-InputData\Calibrate_4_Range\dvrk_IMU_Right.txt'];
phns_Slave = ['E:\6-InputData\Calibrate_4_Range\dvrk_Right.txt'];

fpn = fopen (phns, 'rt');           
fpn_IMU = fopen (phns_IMU, 'rt');          
fpn_Slave = fopen (phns_Slave, 'rt');           

fid_dVRK_Position = fopen('E:\5-OutData\dVRK_Position.txt','wt');        %????txt?? 
fid_dVRK_Orientation = fopen('E:\5-OutData\dVRK_Orientation.txt','wt');    
fid_dVRK_Jaw = fopen('E:\5-OutData\dVRK_Jaw.txt','wt');    

fid_Slave_Position = fopen('E:\5-OutData\Slave_Position.txt','wt');        %????txt?? 
fid_Slave_Orientation = fopen('E:\5-OutData\Slave_Orientation.txt','wt');    
fid_Slave_Jaw = fopen('E:\5-OutData\Slave_Jaw.txt','wt');   

fid_IMU_Orientation = fopen('E:\5-OutData\IMU_Orientation.txt','wt'); 
fid_dVRK_Clutch = fopen('E:\5-OutData\dVRK_Clutch.txt','wt');    %????txt??  

while feof(fpn) ~= 1                %????????p???????????????????????1?????0  
      DATA = fgetl(fpn);            %??????? 
     %%%%%%%%%%%%%%%%%%%%%%%%%%%   Yaw   %%%%%%%%%%%%%%%%%%%%%%%%%%%
        fprintf(fid_dVRK_Position,'%s ',DATA(2:9));%???????????txt??? 
        fprintf(fid_dVRK_Position,'%s ',DATA(11:18));%???????????txt??? 
        fprintf(fid_dVRK_Position,'%s ',DATA(20:27));%???????????txt??? 
        fprintf(fid_dVRK_Position,'\r\n');%???????????txt??? 
   
        fprintf(fid_dVRK_Orientation,'%s ',DATA(29:34));%???????????txt??? 
        fprintf(fid_dVRK_Orientation,'%s ',DATA(36:41));%???????????txt??? 
        fprintf(fid_dVRK_Orientation,'%s ',DATA(43:48));%???????????txt??? 
        fprintf(fid_dVRK_Orientation,'\r\n');
        
        fprintf(fid_dVRK_Jaw,'%s ',DATA(50:55));
        fprintf(fid_dVRK_Jaw,'\r\n');
end

while feof(fpn_Slave) ~= 1                %????????p???????????????????????1?????0  
      DATA_Slave = fgetl(fpn_Slave);            %??????? 
     %%%%%%%%%%%%%%%%%%%%%%%%%%%   Yaw   %%%%%%%%%%%%%%%%%%%%%%%%%%%
        fprintf(fid_Slave_Position,'%s ',DATA_Slave(2:9));%???????????txt??? 
        fprintf(fid_Slave_Position,'%s ',DATA_Slave(11:18));
        fprintf(fid_Slave_Position,'%s ',DATA_Slave(20:27));
        fprintf(fid_Slave_Position,'\r\n');
   
        fprintf(fid_Slave_Orientation,'%s ',DATA_Slave(29:34));%???????????txt??? 
        fprintf(fid_Slave_Orientation,'%s ',DATA_Slave(36:41));%???????????txt??? 
        fprintf(fid_Slave_Orientation,'%s ',DATA_Slave(43:48));%???????????txt??? 
        fprintf(fid_Slave_Orientation,'\r\n');
        
        fprintf(fid_Slave_Jaw,'%s ',DATA(50:55));
        fprintf(fid_Slave_Jaw,'\r\n');
end


while feof(fpn_IMU) ~= 1                %????????p???????????????????????1?????0  
      DATA_IMU = fgetl(fpn_IMU);            %??????? 
     %%%%%%%%%%%%%%%%%%%%%%%%%%%   Yaw   %%%%%%%%%%%%%%%%%%%%%%%%%%%
   
        fprintf(fid_IMU_Orientation,'%s ',DATA_IMU(2:7)); 
        fprintf(fid_IMU_Orientation,'%s ',DATA_IMU(9:14));
        fprintf(fid_IMU_Orientation,'%s ',DATA_IMU(16:21));
        fprintf(fid_IMU_Orientation,'\r\n');
        
        fprintf(fid_dVRK_Clutch,'%s ',DATA_IMU(23));
        fprintf(fid_dVRK_Clutch,'\r\n');
end

%%
fileID = fopen('E:\5-OutData\dVRK_Position.txt','r');
formatSpec = '%f%f%f';
sizeA = [3 Inf];
Position = fscanf(fileID,formatSpec,sizeA);
Position=Position';

figure(1)
box on;
set(gcf,'color','white');
ylabel('Position');

name0={'X','Y','Z'};
subplot(3,1,1)
plot(Position(:,1),'r');
title(name0(1));
%ylim([-2e4 2e4]);
ylabel('Position');
hold on;

subplot(3,1,2)
plot(Position(:,2),'b');
title(name0(2));
ylabel('Position');
hold on;

subplot(3,1,3)
plot(Position(:,3),'k');
title(name0(3));
ylabel('Position');
hold on;

%%
fileID = fopen('E:\5-OutData\dVRK_Orientation.txt','r');
formatSpec = '%f%f%f';
sizeA = [3 Inf];
Orientation = fscanf(fileID,formatSpec,sizeA);
Orientation=Orientation';


fileID = fopen('E:\5-OutData\IMU_Orientation.txt','r');
formatSpec = '%f%f%f';
sizeB = [3 Inf];
IMU_Orientation = fscanf(fileID,formatSpec,sizeB);
IMU_Orientation=IMU_Orientation';

fileID = fopen('E:\5-OutData\Slave_Orientation.txt','r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Slave_Orientation = fscanf(fileID,formatSpec,sizeC);
Slave_Orientation=Slave_Orientation';


figure(2)
box on;
set(gcf,'color','white');
ylabel('Orientation');

name0={'Roll','Pitch','Yaw'};
subplot(3,1,1)
plot(Orientation(:,1),'b');
hold on;
plot(IMU_Orientation(:,1),'r');
hold on;
plot(Slave_Orientation(:,1),'k');
hold on;

title(name0(1));
%ylim([-2e4 2e4]);
ylabel('Orientation');
hold on;

subplot(3,1,2)
plot(Orientation(:,2),'b');
hold on;
plot(IMU_Orientation(:,2),'r');
hold on;
plot(Slave_Orientation(:,2),'k');
hold on;

title(name0(2));
ylabel('Orientation');
hold on;

subplot(3,1,3)
plot(Orientation(:,3),'b');
hold on;
plot(IMU_Orientation(:,3),'r');
hold on;
plot(Slave_Orientation(:,3),'k');
hold on;

title(name0(3));
ylabel('Orientation');
hold on;

%%
% Trajectory 3D visualisation
figure(3)
plot3(Position(:,1),Position(:,2),Position(:,3),'b');

%%


