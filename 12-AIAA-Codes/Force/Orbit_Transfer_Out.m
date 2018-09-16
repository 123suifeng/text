

row = 9;column = 9;% For square
Thruster_Number = row * column;
RF=1;  %Average Force
L=1;   %Distance

Series_Force = [2 2 3 9 11];
       
    F1 = 23;
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
    
    
    
       
Fig = 3;
None = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
n0 = Plot_Matrix(statu2,Fig);

Fig = 2;
None  = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
n0 = Plot_Matrix(statu,Fig);

Statu_All = figure(3);
saveas(Statu_All,['E:\12-AIAA-Codes\ToyResults\','StatuFig',num2str(0),'.eps'])
saveas(Statu_All,['E:\12-AIAA-Codes\ToyResults\','StatuFig',num2str(0),'.jpg'])

Decision = figure(2);
saveas(Decision ,['E:\12-AIAA-Codes\ToyResults\','DecisionFig',num2str(0),'.eps'])
saveas(Decision ,['E:\12-AIAA-Codes\ToyResults\','DecisionFig',num2str(0),'.jpg'])



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
        
        

    
     Fig = 3;
    none = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
    n0 = Plot_Matrix(statu2,Fig);

     Fig = 2;
     none = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
     n0 = Plot_Matrix(statu,Fig);
     
    Decision = figure(2);
    saveas(Decision ,['E:\12-AIAA-Codes\ToyResults\','DecisionFig',num2str(i-1),'.jpg'])
    %%
    Statu_All = figure(3);
    saveas(Statu_All,['E:\12-AIAA-Codes\ToyResults\','StatuFig',num2str(i-1),'.jpg'])
    

    end
    
         save('E:\\12-AIAA-Codes\\ToyResults\\Realn2.mat','Realn2');  
         save('E:\\12-AIAA-Codes\\ToyResults\\Realn3.mat','Realn3');  
         
         save('E:\\12-AIAA-Codes\\ToyResults\\Remain_Couples.mat','Remain_Couples');  
         save('E:\\12-AIAA-Codes\\ToyResults\\Remain_Thrusters.mat','Remain_Thrusters');  
         
         save('E:\\12-AIAA-Codes\\ToyResults\\FinalN3.mat','FinalN3');  
         
         save('E:\\12-AIAA-Codes\\ToyResults\\Statu','Statu');
         save('E:\\12-AIAA-Codes\\ToyResults\\Statu2','Statu2');
         
         save('E:\\12-AIAA-Codes\\ToyResults\\DynamicLineSegment','Data');
         
         
         
         load('E:\\12-AIAA-Codes\\ToyResults\\Realn2.mat','Realn2');  
         load('E:\\12-AIAA-Codes\\ToyResults\\Realn3.mat','Realn3');  

         load('E:\\12-AIAA-Codes\\ToyResults\\Remain_Couples.mat','Remain_Couples');  
         load('E:\\12-AIAA-Codes\\ToyResults\\Remain_Thrusters.mat','Remain_Thrusters');  

         load('E:\\12-AIAA-Codes\\ToyResults\\FinalN3.mat','FinalN3');  

         load('E:\\12-AIAA-Codes\\ToyResults\\Statu','Statu');
         load('E:\\12-AIAA-Codes\\ToyResults\\Statu2','Statu2');
         
         load('E:\\12-AIAA-Codes\\ToyResults\\DynamicLineSegment.mat','Data');  
         
         Transfer_Triangle = (Realn3-FinalN3);
         save('E:\\12-AIAA-Codes\\ToyResults\\Transfer_Triangle.mat','Transfer_Triangle');
         
         Delta1 = figure(1);
         
         plot(Realn2,'m','linewidth',1.5);hold on;
         plot(FinalN3,'r','linewidth',1.5);hold on;
         plot(Remain_Couples,'k','linewidth',2);hold on;
         plot(Data,'--m','linewidth',2);hold on;
         plot(Transfer_Triangle,'--r','linewidth',2);hold on; 
          
         legend('L +','T +','C +','DL +','DT +')
         xlabel('Time Step')
         ylabel('Number')
         Path = 'E:\\12-AIAA-Codes\\ToyResults\\';
         saveas(Delta1 ,[Path,'ConceptResult',num2str(j),'.jpg'])
         
         [Num,~] = size(Realn2);
         TXT_Path = 'E:\\12-AIAA-Codes\\ToyResults\\Summary1.txt';
         OutputValue
         
         