function [Array] = Draw_Thruster(row,column,Fig)

figure(Fig)
Thruster_Number=row*column;
Array= zeros(Thruster_Number,3);

a=-column/2-0.5;
b=row/2+0.5;
c=0;

for i=1:1:row     
        b=b-1;
    for j=1:1:column
              a=a+1;
           if a>column/2
               a=-column/2+0.5;
           end
            c=c+1;
           Array(c,2) = a;
           Array(c,3) = b;

 plot(a,b,'ko','MarkerFaceColor','k','MarkerSize',6);
 grid on;
 hold on;
       
    end
end

xlabel('X');ylabel('Y');
grid off;
set(gcf,'color','w');


end

