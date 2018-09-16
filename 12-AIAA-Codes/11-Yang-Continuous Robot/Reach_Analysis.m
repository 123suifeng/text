function [Dex] = Reach_Analysis(QS,Visual_RW,Visual_LW,N)

% global LeftMaster;
% 3D Position --- Dexterity 

Nq = 4;
Dex = zeros(N,5);

for i = 1:1:N
     %Y = jacob0(RightMaster,QS(i,:));
     [T, R]= FK(QS(i,1),QS(i,2),QS(i,3),QS(i,4));
     %qPtr=libpointer('doublePtr',QS(i,:));
     
    Dex(i,1) = T(1);
    Dex(i,2) = T(2);
    Dex(i,3) = T(3);
      
end

%%

if Visual_RW == 1   
    plot3(Dex(:,1),Dex(:,2),Dex(:,3),'*y');
    hold on;
end

if Visual_LW == 1
    plot3((Dex(:,1)-20),(Dex(:,2)),Dex(:,3),'*g');  
    hold on;
end

view(3)
end

