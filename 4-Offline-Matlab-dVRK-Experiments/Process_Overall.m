function [Total_Slave_Right_Distance,Total_Slave_Left_Distance,Total_Master_Right_Distance,Total_Master_Left_Distance] = Process_Overall(phns_Slave_Right,phns_Slave_Left,phns_Master_Right,phns_Master_Left,Out_Put,num,Flag_DanMaster)

fpn_Slave_Right = fopen (phns_Slave_Right, 'rt'); 
fpn_Slave_Left = fopen (phns_Slave_Left, 'rt'); 

fpn_Master_Right = fopen (phns_Master_Right, 'rt'); 
fpn_Master_Left = fopen (phns_Master_Left, 'rt'); 
%%
f=fullfile(Out_Put,'dVRK_Position.txt');
fid_Out_Overall = fopen(f,'wt');  


Flag = 0;
while feof(fpn_Slave_Right) ~= 1   && feof(fpn_Slave_Left) ~= 1  && feof(fpn_Master_Right) ~= 1   && feof(fpn_Master_Left) ~= 1 
      DATA_Slave_Right = fgetl(fpn_Slave_Right) ;
      DATA_Slave_Left = fgetl(fpn_Slave_Left);
      
      DATA_Master_Right = fgetl(fpn_Master_Right) ; 
      DATA_Master_Left = fgetl(fpn_Master_Left) ;
      
      if Flag == 0
         Flag = 1;
         continue;
      end
     
     % Position
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Right(2:9));
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Right(11:18));
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Right(20:27));
     % Orientation
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Right(29:34));
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Right(36:41)); 
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Right(43:48));    
        
     % Girpper Angle

        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Right(50:55));
     
         % Position
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Left(2:9));
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Left(11:18));
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Left(20:27));
   % Orientation
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Left(29:34));
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Left(36:41)); 
        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Left(43:48));
        % Girpper Angle

        fprintf(fid_Out_Overall,'%s ',DATA_Slave_Left(50:55));

             % Position
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Right(2:9));
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Right(11:18));
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Right(20:27));
     % Orientation
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Right(29:34));
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Right(36:41)); 
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Right(43:48));    
        
     % Girpper Angle
     if Flag_DanMaster == 0
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Right(50:55));
                else
             fprintf(fid_Out_Overall,'%s ',DATA_Master_Left(50:50));
             
     end
     
         % Position
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Left(2:9));
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Left(11:18));
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Left(20:27));
   % Orientation
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Left(29:34));
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Left(36:41)); 
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Left(43:48));
        % Girpper Angle
        if Flag_DanMaster == 0
        fprintf(fid_Out_Overall,'%s ',DATA_Master_Left(50:55));
        else
             fprintf(fid_Out_Overall,'%s ',DATA_Master_Left(50:50));
        end
        fprintf(fid_Out_Overall,'\n');
end


%%


f=fullfile(Out_Put,'dVRK_Position.txt');
fileID = fopen(f,'r');
sizeC = [28 Inf];
format = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f';
Orientation_Position = fscanf(fileID,format,sizeC);
Orientation_Position=Orientation_Position';

Out_File_Name = 'dVRK_Velocity.txt';
Velocity = Out_Velocity(Orientation_Position,Out_File_Name,Out_Put);


%%
figure(num)
xlabel('X');ylabel('Y');zlabel('Z');
hold on;
title('Motion Scaling = ');
hold on;
plot3(Orientation_Position(:,1),Orientation_Position(:,2),Orientation_Position(:,3),'r');
hold on;
plot3(Orientation_Position(:,8),Orientation_Position(:,9),Orientation_Position(:,10),'b');
hold on;
view(3);

f=fullfile(Out_Put,'Motion.jpg');
saveas(num,f)

%%
% Calculate Distance, Efficiency
[Num,a] = size(Orientation_Position);
Total_Slave_Right_Distance = 0;
for i = 2:1:Num
    Total_Slave_Right_Distance = Total_Slave_Right_Distance + Distance(Orientation_Position(i,1:3),Orientation_Position((i-1),1:3));
end

Total_Slave_Left_Distance = 0;
for i = 2:1:Num
    Total_Slave_Left_Distance = Total_Slave_Left_Distance + Distance(Orientation_Position(i,8:10),Orientation_Position((i-1),8:10));
end

Total_Master_Right_Distance = 0;
for i = 2:1:Num
    Total_Master_Right_Distance = Total_Master_Right_Distance + Distance(Orientation_Position(i,15:17),Orientation_Position((i-1),15:17));
end

Total_Master_Left_Distance = 0;
for i = 2:1:Num
    Total_Master_Left_Distance = Total_Master_Left_Distance + Distance(Orientation_Position(i,22:24),Orientation_Position((i-1),22:24));
end

end

