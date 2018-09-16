function [Flag] = Get_Velocity(Orientation,Out_File_Name,Out_Put)

[Num,a] = size(Orientation);
Orientation_Velocity = zeros(Num,3);
f=fullfile(Out_Put,Out_File_Name);    
fid_Velocity = fopen(f,'wt');
    for i = 2:1:Num
        Orientation_Velocity(i,:) = Orientation(i,:)-Orientation((i-1),:);
        fprintf(fid_Velocity,'%6f %6f %6f\r\n',Orientation_Velocity(i,:));
    end
    
Flag=fclose(fid_Velocity);


end

