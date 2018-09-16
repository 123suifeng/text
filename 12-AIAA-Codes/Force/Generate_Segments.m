function [Solution2,Solution] = Generate_Segments(row,column)
%%
n2=(column*row-1)/8; n3=(column*row-1)/4;
Solution=cell((n2+n3),1); Solution2=cell((n3*3/2),1);

position2=zeros(2,2);position3a=zeros(3,2);
position3b=zeros(3,2);position2a=zeros(2,2);

position3a(1,1)=0;
position3a(1,2)=(row-1)/2;
position3a(2,1)=(row-1)/2;
position3a(2,2)=0;
position3a(3,1)=-(row-1)/2;
position3a(3,2)=-(row-1)/2;

position3b(1,1)=0;
position3b(1,2)=-(row-1)/2;
position3b(2,1)=-(row-1)/2;
position3b(2,2)=0;
position3b(3,1)=(row-1)/2;
position3b(3,2)=(row-1)/2;

position2(1,1)=-(row-1)/2;
position2(1,2)=(row-1)/2;
position2(2,1)=(row-1)/2;
position2(2,2)=-(row-1)/2;
   

%%
k=(row-1)/2; p=0;

 for i =1 : n3
    t=mod(p,k);
    if mod(i,2) == 1
         Solution(i,1)={position3a};
         p=p+1;
         if mod(p,k)==0
                k=k-1;
                t=0;
                p=0;
         else
             t=mod(p,k);
         end
        
        position3a(1,1)=0+t;
        position3a(1,2)=k;
        position3a(2,1)=k-t;
        position3a(2,2)=0-t;
        position3a(3,1)=-k;
        position3a(3,2)=-k+t;
        
    else 
        Solution(i,1)={position3b}  ;

        position3b(1,1)=-position3a(1,1);
        position3b(1,2)=-position3a(1,2);
        position3b(2,1)=-position3a(2,1);
        position3b(2,2)=-position3a(2,2);
        position3b(3,1)=-position3a(3,1);
        position3b(3,2)=-position3a(3,2);

    end        
 end

 %%
 q=0; k=(row-1)/2;j=0;
 

 for i =(n3+1) : (n2+n3)
    Solution(i,1)={position2};
    q=q+1;
    t=mod(q,k);
    if t==0
        k=k-1;
        j=j+1;
        q=0;
    end
    position2(1,1)=-(row-1)/2+t;
    position2(1,2)=(row-1)/2-j;
    position2(2,1)=-position2(1,1);
    position2(2,2)=-position2(1,2);
 end


 
 %%
 w=1; yy=1; 

 for i=1:(n3*3/2)
  d=mod(i,3*yy);
  A = Solution{(n3+1-w*2),1};
  if d==0
        w=w+1;            
  end

   switch d
       case 1
           position2a(1,1)= A(3,1);
           position2a(1,2)= A(3,2);
           position2a(2,1)= -A(3,1);
           position2a(2,2)= -A(3,2);
           
           Solution2(i,1)= {position2a};
           
       case 2
           position2a(1,1)= A(2,1);
           position2a(1,2)= A(2,2);
           position2a(2,1)= -A(2,1);
           position2a(2,2)= -A(2,2);
           
           Solution2(i,1)= {position2a};
           
       otherwise
           position2a(1,1)= A(1,1);
           position2a(1,2)= A(1,2);
           position2a(2,1)= -A(1,1);
           position2a(2,2)= -A(1,2);
           
           Solution2(i,1)= {position2a};
   end
     
 end

end

