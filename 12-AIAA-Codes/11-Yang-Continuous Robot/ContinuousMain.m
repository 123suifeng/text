% Modified from MainFunction

%%
% Visualisation Rendering
camlight(40,40)                                % create two lights 
camlight(-20,-10)
lighting gouraud
hold on;

%
set(gcf,'color','w'); 
grid off;hold on;
axis off;hold on;


% the limits of joint value
% trans [-30, 30]
% roll, [-[i/2, [i/2]
% Q1   [-pi/2, pi/2]
% Q3   [-pi/2, pi/2]

%[T, R]=FK(0 ,pi/6 ,pi/7 ,pi/10);

Limitation = zeros(4,2);
Limitation(1,1)=-30; Limitation(1,2)=30;
Limitation(2,1)=-pi/2;Limitation(2,2)=pi/2;
Limitation(3,1)=-pi/2;Limitation(3,2)=pi/2;
Limitation(4,1)=-pi/2;Limitation(4,2)=pi/2;

[QS,Sample_Point] =  Generate_Joints(30,Limitation);

[Dex] = Reach_Analysis(QS,1,0,Sample_Point);



[Dex] = Dex_Analysis(Dex,Sample_Point,QS,Limitation);


