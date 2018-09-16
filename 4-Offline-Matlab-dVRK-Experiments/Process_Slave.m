function [Total_Slave_Right_Distance,Total_Slave_Left_Distance] = Process_Slave(phns_Slave_Right,Out_Put,phns_Slave_Left,num)
%phns_Slave = ['E:\6-InputData\6_Motion_Scaling_0.6\dvrk_Right.txt'];

fpn_Slave_Right = fopen (phns_Slave_Right, 'rt'); 
fpn_Slave_Left = fopen (phns_Slave_Left, 'rt'); 
%%
f=fullfile(Out_Put,'Slave_Right_Position.txt');
fid_Slave_Right_Position = fopen(f,'wt');  

f=fullfile(Out_Put,'Slave_Right_Orientation.txt');
fid_Slave_Right_Orientation = fopen(f,'wt');  

f=fullfile(Out_Put,'Slave_Right_Jaw.txt');
fid_Slave_Right_Jaw = fopen(f,'wt'); 

f=fullfile(Out_Put,'Slave_Left_Position.txt');
fid_Slave_Left_Position = fopen(f,'wt');  

f=fullfile(Out_Put,'Slave_Left_Orientation.txt');
fid_Slave_Left_Orientation = fopen(f,'wt');  

f=fullfile(Out_Put,'Slave_Left_Jaw.txt');
fid_Slave_Left_Jaw = fopen(f,'wt'); 

Flag = 0;
while feof(fpn_Slave_Right) ~= 1         
      DATA_Slave = fgetl(fpn_Slave_Right);  
      
      if Flag == 0
         Flag = 1;
         continue;
      end
      

        fprintf(fid_Slave_Right_Position,'%s ',DATA_Slave(2:9));
        fprintf(fid_Slave_Right_Position,'%s ',DATA_Slave(11:18));
        fprintf(fid_Slave_Right_Position,'%s ',DATA_Slave(20:27));
        fprintf(fid_Slave_Right_Position,'\r\n');
   
        fprintf(fid_Slave_Right_Orientation,'%s ',DATA_Slave(29:34));
        fprintf(fid_Slave_Right_Orientation,'%s ',DATA_Slave(36:41)); 
        fprintf(fid_Slave_Right_Orientation,'%s ',DATA_Slave(43:48));
        fprintf(fid_Slave_Right_Orientation,'\r\n');
        
        fprintf(fid_Slave_Right_Jaw,'%s ',DATA_Slave(50:55));
        fprintf(fid_Slave_Right_Jaw,'\r\n');
end


while feof(fpn_Slave_Left) ~= 1         
        DATA_Slave = fgetl(fpn_Slave_Left);  
        if Flag == 1
             Flag = 2;
             continue;
        end
      
        fprintf(fid_Slave_Left_Position,'%s ',DATA_Slave(2:9));
        fprintf(fid_Slave_Left_Position,'%s ',DATA_Slave(11:18));
        fprintf(fid_Slave_Left_Position,'%s ',DATA_Slave(20:27));
        fprintf(fid_Slave_Left_Position,'\r\n');
   
        fprintf(fid_Slave_Left_Orientation,'%s ',DATA_Slave(29:34));
        fprintf(fid_Slave_Left_Orientation,'%s ',DATA_Slave(36:41)); 
        fprintf(fid_Slave_Left_Orientation,'%s ',DATA_Slave(43:48));
        fprintf(fid_Slave_Left_Orientation,'\r\n');
        
        fprintf(fid_Slave_Left_Jaw,'%s ',DATA_Slave(50:55));
        fprintf(fid_Slave_Left_Jaw,'\r\n');
end

%%
f=fullfile(Out_Put,'Slave_Right_Position.txt');
fileID = fopen(f,'r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Slave_Right_Position = fscanf(fileID,formatSpec,sizeC);
Slave_Right_Position=Slave_Right_Position';


Out_File_Name = 'Slave_Right_Velocity.txt';
Get_Velocity(Slave_Right_Position,Out_File_Name,Out_Put);


%%
f=fullfile(Out_Put,'Slave_Left_Position.txt');
fileID = fopen(f,'r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Slave_Left_Position = fscanf(fileID,formatSpec,sizeC);
Slave_Left_Position=Slave_Left_Position';


Out_File_Name = 'Slave_Left_Velocity.txt';
Get_Velocity(Slave_Left_Position,Out_File_Name,Out_Put);

%%

f=fullfile(Out_Put,'Slave_Right_Orientation.txt');
fileID = fopen(f,'r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Slave_Right_Orientation = fscanf(fileID,formatSpec,sizeC);
Slave_Right_Orientation=Slave_Right_Orientation';

Out_File_Name = 'Slave_Right_Orientation_Velocity.txt';
Get_Velocity(Slave_Right_Orientation,Out_File_Name,Out_Put);


f=fullfile(Out_Put,'Slave_Left_Orientation.txt');
fileID = fopen(f,'r');
formatSpec = '%f%f%f';
sizeC = [3 Inf];
Slave_Left_Orientation = fscanf(fileID,formatSpec,sizeC);
Slave_Left_Orientation=Slave_Left_Orientation';

Out_File_Name = 'Slave_Left_Orientation_Velocity.txt';
Get_Velocity(Slave_Left_Orientation,Out_File_Name,Out_Put);

%%

figure(num)
xlabel('X');ylabel('Y');zlabel('Z');
hold on;
title('Motion Scaling = ');
hold on;
plot3(Slave_Right_Position(:,1),Slave_Right_Position(:,2),Slave_Right_Position(:,3),'r');
hold on;
plot3(Slave_Left_Position(:,1),Slave_Left_Position(:,2),Slave_Left_Position(:,3),'b');
hold on;
view(3);

f=fullfile(Out_Put,'Motion.jpg');
saveas(num,f)



%%
% Calculate Distance, Efficiency

[Num,a] = size(Slave_Right_Position);
Total_Slave_Right_Distance = 0;
for i = 2:1:Num
    Total_Slave_Right_Distance = Total_Slave_Right_Distance + Distance(Slave_Right_Position(i,:),Slave_Right_Position((i-1),:));
end

[Num,a] = size(Slave_Left_Position);
Total_Slave_Left_Distance = 0;
for i = 2:1:Num
    Total_Slave_Left_Distance = Total_Slave_Left_Distance + Distance(Slave_Left_Position(i,:),Slave_Left_Position((i-1),:));
end


end

