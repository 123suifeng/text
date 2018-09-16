function [n] = Plot_Matrix(Status,Fig)

[m,n] = size(Status);
row = m; column = n;
a=-column/2-0.5;
b=row/2+0.5;
c=0;

figure(Fig)
for i=1:1:row     
        b=b-1;
    for j=1:1:column
              a=a+1;
           if a>column/2
               a=-column/2+0.5;
           end
            c=c+1;

if Status(i,j) == 1
  plot(a,b,'wo','MarkerFaceColor','w','MarkerSize',3); hold on;

 grid on;

end
       
    end

end

end


    
   



