clear
%%
RF=1;  %Average Force
L=1;   %Distance
F1 = 23; % Initial Force
row = 9;column = 9;% For square
Thruster_Number = row * column;
data = 0; % dynamic transfer number for line segment
Fig = 3;
[Array] = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
Fig = 2;
[Array] = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure

statu=zeros(row,column); % Decision Matrix
statu2=zeros(row,column); % Status Matrix

% Generate Initial Triangle Segments and Line Segments
[Solution2,Solution] = Generate_Segments(row,column);
% Solution: Initial Line Segment and Triangle Segment Distribution
% Solution2: Inital Triangle Segment Dynamically Transfer to Line Segment


%%
Series_Force = [2,2,3,9,11];
[m n] = size(Series_Force);

[data,statu,statu2,realn2,realn3] = Once_Calculate(data,statu,statu2,F1,Thruster_Number,RF,row,column,Solution2,Solution);
   
Fig = 3;
None = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
n0 = Plot_Matrix(statu2,Fig);

Fig = 2;
None  = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
n0 = Plot_Matrix(statu,Fig);

Statu_All = figure(3);
saveas(Statu_All,['E:\12-AIAA-Codes\Force\Thruster_Figure\Status_EPS\','StatuFig',num2str(0),'.eps'])
saveas(Statu_All,['E:\12-AIAA-Codes\Force\Thruster_Figure\Status_JPG\','StatuFig',num2str(0),'.jpg'])

Decision = figure(2);
saveas(Decision ,['E:\12-AIAA-Codes\Force\Thruster_Figure\Decision_EPS\','DecisionFig',num2str(0),'.eps'])
saveas(Decision ,['E:\12-AIAA-Codes\Force\Thruster_Figure\Decision_JPG\','DecisionFig',num2str(0),'.jpg'])

for i= 1:1:n
    [data,statu,statu2,realn2,realn3] = NewMulti_Calculate(data,statu,statu2,Series_Force(i),realn2,realn3,row,column,Solution2,Solution);
    %%
    Fig = 3;
    none = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
    n0 = Plot_Matrix(statu2,Fig);

     Fig = 2;
     none = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
     n0 = Plot_Matrix(statu,Fig);

    Decision = figure(2);
    saveas(Decision ,['E:\12-AIAA-Codes\Force\Thruster_Figure\Decision_EPS\','DecisionFig',num2str(i),'.eps'])
    saveas(Decision ,['E:\12-AIAA-Codes\Force\Thruster_Figure\Decision_JPG\','DecisionFig',num2str(i),'.jpg'])
    %%
    Statu_All = figure(3);
    saveas(Statu_All,['E:\12-AIAA-Codes\Force\Thruster_Figure\Status_EPS\','StatuFig',num2str(i),'.eps'])
    saveas(Statu_All,['E:\12-AIAA-Codes\Force\Thruster_Figure\Status_JPG\','StatuFig',num2str(i),'.jpg'])
    
    
end

%%





