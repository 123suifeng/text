function [Thruster_Number] = Cal_One_Axis(Series_Force,row,column,Path_Decision_EPS,Path_Decision_JPG,Path_Status_EPS,Path_Status_JPG)
%UNTITLED20 Summary of this function goes here
%   Detailed explanation goes here

%%
RF=1;  %Average Force
L=1;   %Distance

[m n] = size(Series_Force);

F1 = Series_Force(1); % Initial Force
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

[data,statu,statu2,realn2,realn3] = Once_Calculate(data,statu,statu2,F1,Thruster_Number,RF,row,column,Solution2,Solution);
 


Fig = 3;
None = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
n0 = Plot_Matrix(statu2,Fig);

Fig = 2;
None  = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
n0 = Plot_Matrix(statu,Fig);


Statu_All = figure(3);
%saveas(Statu_All,[Path_Status_EPS,'StatuFig',num2str(0),'.eps'])
saveas(Statu_All,[Path_Status_JPG,'StatuFig',num2str(0),'.jpg'])

Decision = figure(2);
%saveas(Decision ,[Path_Decision_EPS,'DecisionFig',num2str(0),'.eps'])
saveas(Decision ,[Path_Decision_JPG,'DecisionFig',num2str(0),'.jpg'])

for i= 1:1:n
    i
    
    Fig = 3;
    None = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
    n0 = Plot_Matrix(statu2,Fig);

    Fig = 2;
    None  = Draw_Thruster(row,column,Fig); % Initial Thruster Array Figure
    n0 = Plot_Matrix(statu,Fig);


    [data,statu,statu2,realn2,realn3] = NewMulti_Calculate(data,statu,statu2,Series_Force(i),realn2,realn3,row,column,Solution2,Solution);
    %%
    Decision = figure(2);
    %saveas(Decision ,[Path_Decision_EPS,'DecisionFig',num2str(i),'.eps'])
    saveas(Decision ,[Path_Decision_JPG,'DecisionFig',num2str(i),'.jpg'])
    %%
    Statu_All = figure(3);
    %saveas(Statu_All,[Path_Status_EPS,'StatuFig',num2str(i),'.eps'])
    saveas(Statu_All,[Path_Status_JPG,'StatuFig',num2str(i),'.jpg'])
    
end
end

