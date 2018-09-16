clear;


%phns_Slave = ['E:\6-InputData\5_Motion_Scaling_0.2\dvrk_Right.txt'];
%phns_Master = ['E:\6-InputData\5_Motion_Scaling_0.2\dvrk_Master_Right.txt'];

%phns_Slave = ['E:\6-InputData\5_Motion_Scaling_0.2\dvrk_Left.txt'];
%phns_Master = ['E:\6-InputData\5_Motion_Scaling_0.2\dvrk_Master_Left.txt'];


%phns_Slave = ['E:\6-InputData\3_Motion_Scaling_0.4\dvrk_Right.txt'];
%phns_Master = ['E:\6-InputData\3_Motion_Scaling_0.4\dvrk_Master_Right.txt'];

%phns_Slave_Left = ['E:\6-InputData\3_Motion_Scaling_0.4\dvrk_Left.txt'];
%phns_Master_Left = ['E:\6-InputData\3_Motion_Scaling_0.4\dvrk_Master_Left.txt'];


phns_Slave = ['E:\6-InputData\6_Motion_Scaling_0.6\dvrk_Right.txt'];
phns_Master = ['E:\6-InputData\6_Motion_Scaling_0.6\dvrk_Master_Right.txt'];

phns_Slave_Left = ['E:\6-InputData\6_Motion_Scaling_0.6\dvrk_Left.txt'];
phns_Master_Left = ['E:\6-InputData\6_Motion_Scaling_0.6\dvrk_Master_Left.txt'];


fpn_Slave = fopen (phns_Slave, 'rt'); 
fid_Slave_Position = fopen('E:\5-OutData\Slave_Position.txt','wt');  
fid_Slave_Orientation = fopen('E:\5-OutData\Slave_Orientation.txt','wt');    
fid_Slave_Jaw = fopen('E:\5-OutData\Slave_Jaw.txt','wt');  

fpn_Master = fopen (phns_Master, 'rt'); 
fid_Master_Position = fopen('E:\5-OutData\Master_Position.txt','wt');  
fid_Master_Orientation = fopen('E:\5-OutData\Master_Orientation.txt','wt');    
fid_Master_Jaw = fopen('E:\5-OutData\Master_Jaw.txt','wt');  



fpn_Slave_Left = fopen (phns_Slave_Left, 'rt'); 
fid_Slave_Left_Position = fopen('E:\5-OutData\Slave_Left_Position.txt','wt');  
fid_Slave_Left_Orientation = fopen('E:\5-OutData\Slave_Left_Orientation.txt','wt');    
fid_Slave_Left_Jaw = fopen('E:\5-OutData\Slave_Left_Jaw.txt','wt');  

fpn_Master_Left = fopen (phns_Master_Left, 'rt'); 
fid_Master_Left_Position = fopen('E:\5-OutData\Master_Left_Position.txt','wt');  
fid_Master_Left_Orientation = fopen('E:\5-OutData\Master_Left_Orientation.txt','wt');    
fid_Master_Left_Jaw = fopen('E:\5-OutData\Master_Left_Jaw.txt','wt');  

while feof(fpn_Slave) ~= 1         
      DATA_Slave = fgetl(fpn_Slave);            

        fprintf(fid_Slave_Position,'%s ',DATA_Slave(2:9));
        fprintf(fid_Slave_Position,'%s ',DATA_Slave(11:18));
        fprintf(fid_Slave_Position,'%s ',DATA_Slave(20:27));
        fprintf(fid_Slave_Position,'\r\n');
   
        fprintf(fid_Slave_Orientation,'%s ',DATA_Slave(29:34));
        fprintf(fid_Slave_Orientation,'%s ',DATA_Slave(36:41)); 
        fprintf(fid_Slave_Orientation,'%s ',DATA_Slave(43:48));
        fprintf(fid_Slave_Orientation,'\r\n');
        
        fprintf(fid_Slave_Jaw,'%s ',DATA_Slave(50:55));
        fprintf(fid_Slave_Jaw,'\r\n');
end

while feof(fpn_Master) ~= 1         
      DATA_Master = fgetl(fpn_Master);            

        fprintf(fid_Master_Position,'%s ',DATA_Master(2:9));
        fprintf(fid_Master_Position,'%s ',DATA_Master(11:18));
        fprintf(fid_Master_Position,'%s ',DATA_Master(20:27));
        fprintf(fid_Master_Position,'\r\n');
   
        fprintf(fid_Master_Orientation,'%s ',DATA_Master(29:34));
        fprintf(fid_Master_Orientation,'%s ',DATA_Master(36:41)); 
        fprintf(fid_Master_Orientation,'%s ',DATA_Master(43:48));
        fprintf(fid_Master_Orientation,'\r\n');
        
        fprintf(fid_Master_Jaw,'%s ',DATA_Master(50:55));
        fprintf(fid_Master_Jaw,'\r\n');
end


while feof(fpn_Slave_Left) ~= 1         
      DATA_Left_Slave = fgetl(fpn_Slave_Left);            

        fprintf(fid_Slave_Left_Position,'%s ',DATA_Left_Slave(2:9));
        fprintf(fid_Slave_Left_Position,'%s ',DATA_Left_Slave(11:18));
        fprintf(fid_Slave_Left_Position,'%s ',DATA_Left_Slave(20:27));
        fprintf(fid_Slave_Left_Position,'\r\n');
   
        fprintf(fid_Slave_Left_Orientation,'%s ',DATA_Left_Slave(29:34));
        fprintf(fid_Slave_Left_Orientation,'%s ',DATA_Left_Slave(36:41)); 
        fprintf(fid_Slave_Left_Orientation,'%s ',DATA_Left_Slave(43:48));
        fprintf(fid_Slave_Left_Orientation,'\r\n');
        
        fprintf(fid_Slave_Left_Jaw,'%s ',DATA_Left_Slave(50:55));
        fprintf(fid_Slave_Left_Jaw,'\r\n');
end

while feof(fpn_Master_Left) ~= 1         
      DATA_Master_Left = fgetl(fpn_Master_Left);            

        fprintf(fid_Master_Left_Position,'%s ',DATA_Master_Left(2:9));
        fprintf(fid_Master_Left_Position,'%s ',DATA_Master_Left(11:18));
        fprintf(fid_Master_Left_Position,'%s ',DATA_Master_Left(20:27));
        fprintf(fid_Master_Left_Position,'\r\n');
   
        fprintf(fid_Master_Left_Orientation,'%s ',DATA_Master_Left(29:34));
        fprintf(fid_Master_Left_Orientation,'%s ',DATA_Master_Left(36:41)); 
        fprintf(fid_Master_Left_Orientation,'%s ',DATA_Master_Left(43:48));
        fprintf(fid_Master_Left_Orientation,'\r\n');
        
        fprintf(fid_Master_Left_Jaw,'%s ',DATA_Master_Left(50:55));
        fprintf(fid_Master_Left_Jaw,'\r\n');
end


fileID = fopen('E:\5-OutData\Slave_Position.txt','r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Slave_Position = fscanf(fileID,formatSpec,sizeC);
Slave_Position=Slave_Position';

fileID = fopen('E:\5-OutData\Master_Position.txt','r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Master_Position = fscanf(fileID,formatSpec,sizeC);
Master_Position=Master_Position';


fileID = fopen('E:\5-OutData\Slave_Left_Position.txt','r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Slave_Left_Position = fscanf(fileID,formatSpec,sizeC);
Slave_Left_Position=Slave_Left_Position';

fileID = fopen('E:\5-OutData\Master_Left_Position.txt','r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Master_Left_Position = fscanf(fileID,formatSpec,sizeC);
Master_Left_Position=Master_Left_Position';




%%
% Figure

% Trajectory 3D visualisation

figure(1)
plot3(Slave_Position(:,1),Slave_Position(:,2),Slave_Position(:,3),'r');
hold on;
plot3(Slave_Left_Position(:,1),Slave_Left_Position(:,2),Slave_Left_Position(:,3),'b');
hold on;

xlabel('X');ylabel('Y');zlabel('Z');
hold on;
title('Motion Scaling = 0.4');







%%
% Calculate Distance, Efficiency

[Num,a] = size(Slave_Position);
Total_Slave_Distance = 0;
for i = 2:1:Num
    Total_Slave_Distance = Total_Slave_Distance + Distance(Slave_Position(i,:),Slave_Position((i-1),:));
end

[Num,a] = size(Master_Position);
Total_Master_Distance = 0;
for i = 2:1:Num
    Total_Master_Distance = Total_Master_Distance + Distance(Master_Position(i,:),Master_Position((i-1),:));
end

Efficiency = Total_Slave_Distance/Total_Master_Distance;



[Num,a] = size(Slave_Left_Position);
Total_Slave_Left_Distance = 0;
for i = 2:1:Num
    Total_Slave_Left_Distance = Total_Slave_Left_Distance + Distance(Slave_Left_Position(i,:),Slave_Left_Position((i-1),:));
end

[Num,a] = size(Master_Left_Position);
Total_Master_Left_Distance = 0;
for i = 2:1:Num
    Total_Master_Left_Distance = Total_Master_Left_Distance + Distance(Master_Left_Position(i,:),Master_Left_Position((i-1),:));
end

Left_Efficiency = Total_Slave_Left_Distance/Total_Master_Left_Distance;