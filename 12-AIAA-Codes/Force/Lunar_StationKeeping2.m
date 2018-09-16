%A1ModJulian	dv1.Element1	dv2.Element  ElapsedDays	Altitude	RadPer	RMAG

tmp =dlmread('E:\Lunar_Label.csv');

tmp = tmp(2:746167,:);

delta_V_1 = tmp(:,2); delta_V_2 = tmp(:,3);


Impulse_Unit = 0.381;   % mN*s
Satellite_Mass = 4;     % kg
Total_Impulse = delta_V_1 * Satellite_Mass ;
Thruster_Num = round(Total_Impulse / Impulse_Unit * 1000);


tmp(:,8) = Thruster_Num;

Total_Impulse2 = delta_V_2 * Satellite_Mass ;
Thruster_Num = round(Total_Impulse2 / Impulse_Unit * 1000);
tmp(:,9) = Thruster_Num;

[m,n] = size(tmp);
Num_Delta = 0;

for i = 2:1:m

  if(delta_V_1(i)-delta_V_1(i-1)) ~=0
      Num_Delta = Num_Delta + 1;
  end
end

Tran_Frame = zeros(Num_Delta ,10); 
Num_Delta = 0;
for i = 2:1:m
     if(delta_V_1(i)-delta_V_1(i-1)) ~=0
          Num_Delta = Num_Delta + 1;
          Tran_Frame(Num_Delta,1:9) = tmp(i,1:9);
          Tran_Frame(Num_Delta,10)=i;
     end
end


row = 81;column = 81;% For square
Thruster_Number = row * column;
RF=1;  %Average Force
L=1;   %Distance
Thruster_1 = abs(Tran_Frame(:,8)); Thruster_2 = Tran_Frame(:,9);
Series_Force = Thruster_2(2:Num_Delta)';
       
F1 = Thruster_2(1);
    [m n] = size(Series_Force);

    statu=zeros(row,column); % Decision Matrix
    statu2=zeros(row,column); % Status Matrix
    data = 0; % dynamic transfer number for line segment

    Statu=zeros(row,column,(n+1)); % Decision Matrix
    Statu2=zeros(row,column,(n+1)); % Status Matrix
    Data = zeros((n+2),1);% dynamic transfer number for line segment
    Realn2 = zeros((n+2),1); % line segment
    Realn3 = zeros((n+2),1); % triangle segment

    Remain_Couples = zeros((n+2),1); % Remaining Couples

    Remain_Thrusters = zeros((n+2),1);
    Remain_Thrusters(1,1) = Thruster_Number;
    Remain_Thrusters(2,1) = Thruster_Number-F1;
    % Generate Initial Triangle Segments and Line Segments
    [Solution2,Solution] = Generate_Segments(row,column);
    % Solution: Initial Line Segment and Triangle Segment Distribution
    % Solution2: Inital Triangle Segment Dynamically Transfer to Line Segment

    %%
    n2=(column*row-1)/8; n3=(column*row-1)/4;
    realn2 = n2; realn3 = n3;


    Flag_Odd = 0; Temp_b = 0;

    Statu(:,:,1) = statu; Statu2(:,:,1) = statu2;
    Realn2(1,1) = realn2; Realn3(1,1) = realn3; 
    Data(1) =  data;

    [data,statu,statu2,realn2,realn3] = Once_Calculate(data,statu,statu2,F1,Thruster_Number,RF,row,column,Solution2,Solution);

    Realn2(2,1) = realn2;Realn3(2,1) = realn3;
    Remain_Couples(1,1) = n3/2;
    Remain_Couples(2,1) = n3/2-ceil(n3-realn3);
    Temp_Transfer_Couple_Num=0;

    FinalN3 = Realn3;
    FinalN2 = Realn2;

      
    save('E:\\12-AIAA-Codes\\Calculate_General\\Thruster_1 .mat','Thruster_1');
    save('E:\\12-AIAA-Codes\\Calculate_General\\Thruster_2 .mat','Thruster_2');
    
    save('E:\\12-AIAA-Codes\\Calculate_General\\Total_Impulse .mat','Total_Impulse');
    save('E:\\12-AIAA-Codes\\Calculate_General\\Total_Impulse2 .mat','Total_Impulse2');
    
    
    
    
    for i= 2:1:(n+1)
        [data,statu,statu2,realn2,realn3] = NewMulti_Calculate(data,statu,statu2,Series_Force(i-1),realn2,realn3,row,column,Solution2,Solution);
        Remain_Thrusters((i+1),1)= Remain_Thrusters(i,1)-Series_Force(i-1);
        Statu(:,:,(i+1)) = statu; Statu2(:,:,(i+1)) = statu2;
        Realn2(i+1) = realn2; 
         Data((i+1),1) =  data; 

        b = mod(data,3); Transfer_Couple_Num = fix(data/3);
        if b~= 0 
             Transfer_Couple_Num = Transfer_Couple_Num + 1;
        end

        Realn3(i+1) = realn3;
        Use_Triangle = Realn3(i)-Realn3(i+1);
        if Use_Triangle ~= 0 
            Remain_Couples((i+1),1) = Remain_Couples(i,1)- ceil((Use_Triangle-Flag_Odd)/2)-(Transfer_Couple_Num-Temp_Transfer_Couple_Num);
        else
            Remain_Couples((i+1),1) = Remain_Couples(i,1)-(Transfer_Couple_Num-Temp_Transfer_Couple_Num);
        end
        Flag_Odd = mod(Use_Triangle,2);
        %Realn3(i+1) = Realn3(i) - 2 * Couple_Num;
        %Sum_Data = Sum_Data - 3 * Couple_Num;
        FinalN3(i+1) = FinalN3(i) - Use_Triangle-2 *(Transfer_Couple_Num-Temp_Transfer_Couple_Num);

        Temp_Transfer_Couple_Num = Transfer_Couple_Num;
        
         save('E:\\12-AIAA-Codes\\Result2\\Realn2.mat','Realn2');  
         save('E:\\12-AIAA-Codes\\Result2\\Realn3.mat','Realn3');  
         
         save('E:\\12-AIAA-Codes\\Result2\\Remain_Couples.mat','Remain_Couples');  
         save('E:\\12-AIAA-Codes\\Result2\\Remain_Thrusters.mat','Remain_Thrusters');  
         
         save('E:\\12-AIAA-Codes\\Result2\\FinalN3.mat','FinalN3');  
         
         save('E:\\12-AIAA-Codes\\Result2\\Statu','Statu');
         save('E:\\12-AIAA-Codes\\Result2\\Statu2','Statu2');
         
         i

    end
    
    
     save('E:\\12-AIAA-Codes\\Result2\\DynamicLineSegment','Data');
    
    %load('E:\12-AIAA-Codes\Realn2.mat')