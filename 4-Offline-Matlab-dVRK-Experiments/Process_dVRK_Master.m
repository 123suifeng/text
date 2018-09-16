function [Total_Right_Distance,Total_Left_Distance] = Process_dVRK_Master(phns_Right,Out_Put,phns_Left)
%phns_Slave = ['E:\6-InputData\6_Motion_Scaling_0.6\dvrk_Right.txt'];

fpn_Right = fopen (phns_Right, 'rt'); 
fpn_Left = fopen (phns_Left, 'rt'); 
%%
f=fullfile(Out_Put,'dVRK_Master_Right_Position.txt');
fid_Right_Position = fopen(f,'wt');  

f=fullfile(Out_Put,'dVRK_Master_Right_Orientation.txt');
fid_Right_Orientation = fopen(f,'wt');  

f=fullfile(Out_Put,'dVRK_Master_Right_Jaw.txt');
fid_Right_Jaw = fopen(f,'wt'); 

f=fullfile(Out_Put,'dVRK_Master_Left_Position.txt');
fid_Left_Position = fopen(f,'wt');  

f=fullfile(Out_Put,'dVRK_Master_Left_Orientation.txt');
fid_Left_Orientation = fopen(f,'wt');  

f=fullfile(Out_Put,'dVRK_Master_Left_Jaw.txt');
fid_Left_Jaw = fopen(f,'wt'); 

Flag = 0;
while feof(fpn_Right) ~= 1         
      DATA_Slave = fgetl(fpn_Right);  
      
      if Flag == 0
         Flag = 1;
         continue;
      end
     
        fprintf(fid_Right_Position,'%s ',DATA_Slave(2:9));
        fprintf(fid_Right_Position,'%s ',DATA_Slave(11:18));
        fprintf(fid_Right_Position,'%s ',DATA_Slave(20:27));
        fprintf(fid_Right_Position,'\r\n');
   
        fprintf(fid_Right_Orientation,'%s ',DATA_Slave(29:34));
        fprintf(fid_Right_Orientation,'%s ',DATA_Slave(36:41)); 
        fprintf(fid_Right_Orientation,'%s ',DATA_Slave(43:48));
        fprintf(fid_Right_Orientation,'\r\n');
        
        fprintf(fid_Right_Jaw,'%s ',DATA_Slave(50:55));
        fprintf(fid_Right_Jaw,'\r\n');
end

while feof(fpn_Left) ~= 1         
        DATA_Slave = fgetl(fpn_Left);  

      if Flag == 1
         Flag = 2;
         continue;
      end
        fprintf(fid_Left_Position,'%s ',DATA_Slave(2:9));
        fprintf(fid_Left_Position,'%s ',DATA_Slave(11:18));
        fprintf(fid_Left_Position,'%s ',DATA_Slave(20:27));
        fprintf(fid_Left_Position,'\r\n');
   
        fprintf(fid_Left_Orientation,'%s ',DATA_Slave(29:34));
        fprintf(fid_Left_Orientation,'%s ',DATA_Slave(36:41)); 
        fprintf(fid_Left_Orientation,'%s ',DATA_Slave(43:48));
        fprintf(fid_Left_Orientation,'\r\n');
        
        fprintf(fid_Left_Jaw,'%s ',DATA_Slave(50:55));
        fprintf(fid_Left_Jaw,'\r\n');
end

%%
f=fullfile(Out_Put,'dVRK_Master_Right_Position.txt');
fileID = fopen(f,'r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Right_Position = fscanf(fileID,formatSpec,sizeC);
Right_Position=Right_Position';

Out_File_Name = 'dVRK_Master_Right_Velocity.txt';
Get_Velocity(Right_Position,Out_File_Name,Out_Put);

%%
f=fullfile(Out_Put,'dVRK_Master_Left_Position.txt');
fileID = fopen(f,'r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Left_Position = fscanf(fileID,formatSpec,sizeC);
Left_Position=Left_Position';

Out_File_Name = 'dVRK_Master_Left_Velocity.txt';
Get_Velocity(Left_Position,Out_File_Name,Out_Put);

%%
f=fullfile(Out_Put,'dVRK_Master_Right_Orientation.txt');
fileID = fopen(f,'r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Right_Orientation = fscanf(fileID,formatSpec,sizeC);
Right_Orientation=Right_Orientation';

Out_File_Name = 'Master_Right_Orientation_Velocity.txt';
Get_Velocity(Right_Orientation,Out_File_Name,Out_Put);

%%
f=fullfile(Out_Put,'dVRK_Master_Left_Orientation.txt');
fileID = fopen(f,'r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Left_Orientation = fscanf(fileID,formatSpec,sizeC);
Left_Orientation=Left_Orientation';

Out_File_Name = 'Master_Left_Orientation_Velocity.txt';
Get_Velocity(Left_Orientation,Out_File_Name,Out_Put);

%{
figure(num)
xlabel('X');ylabel('Y');zlabel('Z');
hold on;
title('dVRK Master Trajectory ');
hold on;
plot3(Slave_Right_Position(:,1),Slave_Right_Position(:,2),Slave_Right_Position(:,3),'r');
hold on;
plot3(Slave_Left_Position(:,1),Slave_Left_Position(:,2),Slave_Left_Position(:,3),'b');
hold on;
view(3);

f=fullfile(Out_Put_Left,'dVRK_Master_Trajectory.jpg');
saveas(num,f)
%}


%%
[Num,a] = size(Right_Position);
Total_Right_Distance = 0;
for i = 2:1:Num
    Total_Right_Distance = Total_Right_Distance + Distance(Right_Position(i,:),Right_Position((i-1),:));
end

[Num,a] = size(Left_Position);
Total_Left_Distance = 0;

for i = 2:1:Num
    Total_Left_Distance = Total_Left_Distance + Distance(Left_Position(i,:),Left_Position((i-1),:));
end

fclose(fid_Right_Position);fclose(fid_Left_Position);
fclose(fid_Right_Orientation);fclose(fid_Left_Orientation);
fclose(fid_Right_Jaw);fclose(fid_Left_Jaw);
end


