



clear;
p = genpath('E:\\6-InputData');
Out_Files = 'E:\\5-OutData';

length_p = size(p,2);
path = {};
temp = [];

Read_Left = 0;Read_Right = 0; Read_Clutch = 0;
Read_dVRK_Master_Left = 0;Read_dVRK_Master_Right = 0;

for i = 1:length_p 
    if p(i) ~= ';'
        temp = [temp p(i)];
    else 
        temp = [temp '\'];
        path = [path ; temp];
        temp = [];
    end
end  
%clear p length_p temp;

dVRK_Slave_Right = "dvrk_Right.txt";
dVRK_Slave_Left = "dvrk_Left.txt";

dVRK_Master_Right = "dvrk_Master_Right.txt";
dVRK_Master_Left = "dvrk_Master_Left.txt";

dVRK_Clutching = "dvrk_Master_Clutching.txt";

Clutch_Num = 0;

file_num = size(path,1);
for i = 1:file_num
    file_path =  path{i}; 
   
    img_path_list = dir(strcat(file_path,'*.txt'));
    img_num = length(img_path_list); 
    
    cd(file_path)
    Output='./Output';
    Out_Put = fullfile(file_path,Output);
    sgc_exist = exist('Output', 'file'); 
    if sgc_exist==0
       mkdir(Output);
    end

    if img_num > 0
        for j = 1:img_num
            image_name = img_path_list(j).name;
           
            if image_name == dVRK_Master_Right
                
                phns_Master_Right=fullfile(file_path,'dvrk_Master_Right.txt');
                
                Read_dVRK_Master_Right = 1;
            end
            
            if image_name == dVRK_Master_Left
                
                phns_Master_Left=fullfile(file_path,'dvrk_Master_Left.txt');
             
                Read_dVRK_Master_Left = 1;
            end
            
                        
            if image_name == dVRK_Clutching
                Read_Clutch = 1;
                f=fullfile(file_path,'dvrk_Master_Clutching.txt');
                
                fid_Clutch = fopen(f,'rt'); 
                Clutch_Num = 0;
                
                while feof(fid_Clutch) ~= 1  
                    DATA = fgetl(fid_Clutch);
                    if DATA == -1
                        break
                    end
                    
                    if DATA == ' '
                        break
                    end
                                        
                    Clutch_Num = Clutch_Num + 1;
                    
                end
                Clutch_Num = Clutch_Num/2;

            end
            
            
            if image_name == dVRK_Slave_Right
                
                phns_Slave_Right=fullfile(file_path,'dvrk_Right.txt');
                Read_Right = 1;
            end
            
            if image_name == dVRK_Slave_Left
                
                phns_Slave_Left=fullfile(file_path,'dvrk_Left.txt');
                Read_Left = 1;
            end
        end
        
        f=fullfile(file_path,Output,'Out.txt');
        fid_Out = fopen(f,'wt'); 
            
        if Read_Right == 1 && Read_Left == 1 && Read_dVRK_Master_Right == 1 && Read_dVRK_Master_Left == 1 && Read_Clutch == 1
            [Total_Slave_Right_Distance,Total_Slave_Left_Distance]=Process_Slave(phns_Slave_Right,Out_Put,phns_Slave_Left,i);                  
     
            fprintf(fid_Out,'Total_Slave_Right_Distance: %f \r\n',Total_Slave_Right_Distance);
            fprintf(fid_Out,'Total_Slave_Left_Distance: %f \r\n',Total_Slave_Left_Distance);
            Total_Slave = (Total_Slave_Right_Distance+Total_Slave_Left_Distance);
            fprintf(fid_Out,'Total_Slave_Total_Distance: %f \r\n',Total_Slave);
            
            [Total_Master_Right_Distance,Total_Master_Left_Distance]=Process_dVRK_Master(phns_Master_Right,Out_Put,phns_Master_Left);
  
            fprintf(fid_Out,'Total_Master_Right_Distance: %f \r\n',Total_Master_Right_Distance);
            fprintf(fid_Out,'Total_Master_Left_Distance: %f \r\n',Total_Master_Left_Distance);
            Total_Master = Total_Master_Right_Distance + Total_Master_Left_Distance;
            fprintf(fid_Out,'Total_Master_Total_Distance: %f \r\n',Total_Master);
            
            fprintf(fid_Out,'Slave_Right_Efficiency: %f \r\n',(Total_Slave_Right_Distance/Total_Master_Right_Distance));
            fprintf(fid_Out,'Slave_Left_Efficiency: %f \r\n',(Total_Slave_Left_Distance/Total_Master_Left_Distance));
            fprintf(fid_Out,'Slave_Total_Efficiency: %f \r\n',(Total_Slave/Total_Master));
            
            fprintf(fid_Out,'Clutching: %d \r\n',Clutch_Num);
            Read_Right = 0; Read_Left = 0;Read_dVRK_Master_Right = 0; Read_dVRK_Master_Left = 0;Read_Clutch = 0;


        end

    end
end