function [n] = Plot_Thruster(Fig,A)

[m,n]=size(A);

if m == 3
        figure(Fig) 
        plot(A(1,1),A(1,2),'wo','MarkerFaceColor','w','MarkerSize',3); hold on;
        plot(A(2,1),A(2,2),'wo','MarkerFaceColor','w','MarkerSize',3); hold on;
        plot(A(3,1),A(3,2),'wo','MarkerFaceColor','w','MarkerSize',3); hold on;
end

if m == 2
        figure(Fig) 
        plot(A(1,1),A(1,2),'wo','MarkerFaceColor','w','MarkerSize',3); hold on;
        plot(A(2,1),A(2,2),'wo','MarkerFaceColor','w','MarkerSize',3); hold on;
end

end

