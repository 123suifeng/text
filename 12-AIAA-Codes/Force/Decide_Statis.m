function [statu,statu2] = Decide_Statis(statu,statu2,A,row)
   
   [m,n]=size(A);
   if m == 2
       r=A(1,1)+(row+1)/2;   u=-A(1,2)+(row+1)/2;
       statu(u,r)=1;        statu2(u,r)=1;

       r=A(2,1)+(row+1)/2;   u=-A(2,2)+(row+1)/2;
       statu(u,r)=1;        statu2(u,r)=1;
   end
   
   if m == 3
       r=A(1,1)+(row+1)/2;   u=-A(1,2)+(row+1)/2;
       statu(u,r)=1;        statu2(u,r)=1;

       r=A(2,1)+(row+1)/2;   u=-A(2,2)+(row+1)/2;
       statu(u,r)=1;        statu2(u,r)=1;       
       
       r=A(3,1)+(row+1)/2;   u=-A(3,2)+(row+1)/2;
       statu(u,r)=1;        statu2(u,r)=1;    
   end
   
end

