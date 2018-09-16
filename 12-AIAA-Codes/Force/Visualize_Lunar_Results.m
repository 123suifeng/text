    
%A1ModJulian	dv1.Element1	dv2.Element  ElapsedDays	Altitude	RadPer	RMAG
tmp =dlmread('E:\Lunar_Label.csv');
tmp = tmp(2:746167,:); % one year data
delta_V_1 = tmp(:,2); delta_V_2 = tmp(:,3);
ElapsedDay = tmp(:,4);
[m,n] = size(tmp);

% Compress_Data
Compressed_Scale = 5000;
Compressed_Tmp = zeros(floor(m/Compressed_Scale),n);
c = 0;
for i = 1:1:m
    if mod(i,Compressed_Scale) == 0
        c = c+1;
    Compressed_Tmp(c,:) = tmp(i,:);
    end
end
RadPer = figure(3);
plot(Compressed_Tmp(:,4),Compressed_Tmp(:,6),'r','linewidth',2);hold on;

      xlabel('Elapsed Days')
      ylabel('RadPer')
      Path = 'E:\\12-AIAA-Codes\\Calculate_General\\';
    saveas(RadPer ,[Path,'RadPer','.jpg'])
  
    
    Altitude = figure(4);
plot(Compressed_Tmp(:,4),Compressed_Tmp(:,5),'b','linewidth',2);hold on;

      xlabel('Elapsed Days')
      ylabel('Altitude')
      Path = 'E:\\12-AIAA-Codes\\Calculate_General\\';
    saveas(Altitude ,[Path,'Altitude','.jpg'])

    load('E:\\12-AIAA-Codes\\Calculate_General\\Thruster_1 .mat','Thruster_1');
    load('E:\\12-AIAA-Codes\\Calculate_General\\Thruster_2 .mat','Thruster_2');
    
    load('E:\\12-AIAA-Codes\\Calculate_General\\Total_Impulse .mat','Total_Impulse');
    load('E:\\12-AIAA-Codes\\Calculate_General\\Total_Impulse2 .mat','Total_Impulse2');
    
    %%
 
    for j = 1:1:2
        if j == 1
         load('E:\\12-AIAA-Codes\\Result1\\Realn2.mat','Realn2');  
         load('E:\\12-AIAA-Codes\\Result1\\Realn3.mat','Realn3');  

         load('E:\\12-AIAA-Codes\\Result1\\Remain_Couples.mat','Remain_Couples');  
         load('E:\\12-AIAA-Codes\\Result1\\Remain_Thrusters.mat','Remain_Thrusters');  

         load('E:\\12-AIAA-Codes\\Result1\\FinalN3.mat','FinalN3');  

         load('E:\\12-AIAA-Codes\\Result1\\Statu','Statu');
         load('E:\\12-AIAA-Codes\\Result1\\Statu2','Statu2');
         
         load('E:\\12-AIAA-Codes\\Result1\\DynamicLineSegment.mat','Data');  
         
         Transfer_Triangle = (Realn3-FinalN3);
         save('E:\\12-AIAA-Codes\\Result1\\Transfer_Triangle.mat','Transfer_Triangle');
         
         Delta1 = figure(j);
         
         plot(Realn2,'m','linewidth',1.5);hold on;
         plot(FinalN3,'r','linewidth',1.5);hold on;
         plot(Remain_Couples,'k','linewidth',2);hold on;
         plot(Data,'--m','linewidth',2);hold on;
         plot(Transfer_Triangle,'--r','linewidth',2);hold on; 
          
         legend('L +','T +','C +','DL +','DT +')
         xlabel('Manoeuvre for delta V1')
         ylabel('Number')
         Path = 'E:\\12-AIAA-Codes\\Calculate_General\\';
         saveas(Delta1 ,[Path,'DeltaSegment',num2str(j),'.jpg'])
         
         [Num,~] = size(Realn2);
         TXT_Path = 'E:\\12-AIAA-Codes\\Calculate_General\\Summary1.txt';
         OutputValue
         
        end
        
        if j == 2
         load('E:\\12-AIAA-Codes\\Result2\\Realn2.mat','Realn2');  
         load('E:\\12-AIAA-Codes\\Result2\\Realn3.mat','Realn3');  

         load('E:\\12-AIAA-Codes\\Result2\\Remain_Couples.mat','Remain_Couples');  
         load('E:\\12-AIAA-Codes\\Result2\\Remain_Thrusters.mat','Remain_Thrusters');  

         load('E:\\12-AIAA-Codes\\Result2\\FinalN3.mat','FinalN3');  
         load('E:\\12-AIAA-Codes\\Result2\\Statu','Statu');
         load('E:\\12-AIAA-Codes\\Result2\\Statu2','Statu2');
         
         load('E:\\12-AIAA-Codes\\Result2\\DynamicLineSegment.mat','Data');  
         
         Transfer_Triangle = (Realn3-FinalN3);
         save('E:\\12-AIAA-Codes\\Result2\\Transfer_Triangle.mat','Transfer_Triangle');
         
         Delta2 = figure(j);
         plot(Realn2,'m','linewidth',1.5);hold on;
         plot(FinalN3,'r','linewidth',1.5);hold on;
         plot(Remain_Couples,'k','linewidth',2);hold on;
         plot(Data,'--m','linewidth',2);hold on;
         plot(Transfer_Triangle,'--r','linewidth',2);hold on; 
          
         
         
        legend('L +','T +','C +','DL +','DT +')
        xlabel('Manoeuvre for delta V2')
        ylabel('Number')
        Path = 'E:\\12-AIAA-Codes\\Calculate_General\\';
        saveas(Delta2 ,[Path,'DeltaSegment',num2str(j),'.jpg'])
    
        TXT_Path = 'E:\\12-AIAA-Codes\\Calculate_General\\Summary2.txt';
        OutputValue
         
        end

  
    end