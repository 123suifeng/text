
tmp =dlmread('E:\results.txt');
Satellite_Mass = 10;
Unit_F=5;
F = tmp * Satellite_Mass * 1000;

Thruster_Num = round(F/Unit_F);

[m,n] = size(Thruster_Num);

Count = 0;

for i = 1:1:m
    if(Thruster_Num(i,1) ~= 0 || Thruster_Num(i,2) ~= 0 ||  Thruster_Num(i,3) ~= 0)
        continue
    end
    Count = Count + 1;
end
    
Total_Number = (m-Count);
Thruster_Array = zeros(Total_Number,6); 


for i = 1:1:Total_Number
   
    if(Thruster_Num(i,1) <0)
        Thruster_Array(i,2) = abs(Thruster_Num(i,1));
    else
        Thruster_Array(i,1) = abs(Thruster_Num(i,1));
    end
    
    if(Thruster_Num(i,2) <0)
        Thruster_Array(i,4) = abs(Thruster_Num(i,2));
    else
        Thruster_Array(i,3) = abs(Thruster_Num(i,2));
    end
        
    if(Thruster_Num(i,1) <0)
        Thruster_Array(i,6) = abs(Thruster_Num(i,3));
    else
        Thruster_Array(i,5) = abs(Thruster_Num(i,3));
    end
    
     for j = 1:1:6
        if(Thruster_Array(i,j)) == 1
            Thruster_Array(i,j) = 3;
            if(j == 1 || j == 3 || j == 5 )
                Thruster_Array(i,(j+1)) = Thruster_Array(i,(j+1)) + 2;
            else
                Thruster_Array(i,(j-1)) = Thruster_Array(i,(j-1)) + 2;
            end
        end
    end
end


Sum_Array = zeros(6,1);
for i = 1:1:6
    Sum_Array(i,1) = sum(Thruster_Array(:,i));
end





%{
Path_Decision_EPS ='E:\12-AIAA-Codes\Force\Orbit_Transfer\X_P\Decision_EPS\';
Path_Decision_JPG = 'E:\12-AIAA-Codes\Force\Orbit_Transfer\X_P\Decision_JPG\';

Path_Status_EPS ='E:\12-AIAA-Codes\Force\Orbit_Transfer\X_P\Status_EPS\';
Path_Status_JPG = 'E:\12-AIAA-Codes\Force\Orbit_Transfer\X_P\Status_JPG\';
%}
Path_Decision_EPS ='E:\12-AIAA-Codes\Force\Orbit_Transfer\X_P\Decision_EPS\';
Path_Status_EPS ='E:\12-AIAA-Codes\Force\Orbit_Transfer\X_P\Status_EPS\';

row = 21;
column = 21;

    
for i=2:1:2
Series_Force =  Thruster_Array(:,i)';
[Path_Decision_JPG,Path_Status_JPG] =Decide_Path(i);
[Thruster_Number] = Cal_One_Axis(Series_Force,row,column,Path_Decision_EPS,Path_Decision_JPG,Path_Status_EPS,Path_Status_JPG);
end


