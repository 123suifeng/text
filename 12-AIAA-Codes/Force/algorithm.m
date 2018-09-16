clear;
column=1023;
row=column;
statu=zeros(row,column);
statu2=zeros(row,column);

 data=0;
 ff=0;
 
position2=zeros(2,2);
position3a=zeros(3,2);
position3b=zeros(3,2);
position2a=zeros(2,2);

n2=(column*row-1)/8;
n3=(column*row-1)/4;

realn2=(column*row-1)/8;
realn3=(column*row-1)/4;

sn2=realn2+realn3*3;
sn3=realn3*2;

Solution=cell((n2+n3),1);
Solution2=cell((n3*3/2),1);

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

k=(row-1)/2;
p=0;

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


j=0;
q=0;
k=(row-1)/2;

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

w=1;
yy=1;
u=0;
r=0;
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
for i=1:(n2+n3)
celldisp(Solution(i,1))
end
%}


RN=round(rand(1,1)*row);
B=round(rand(1,RN)*(row*column/4)+2);
L=length(B);

number=zeros(1,L);
number2=zeros(1,L);
StatuN=cell(L,1);
StatuN2=cell(L,1);
%statu=zeros(row,column);

%{
  a=zeros(L);
for i=1:L
    c=['D:\a',num2str(i),'.txt'];%位置在D盘文件名为a1.txt,a2.txt...
    d=['a(',num2str(i),',:)'];
    save(c,'d','-ascii')
end
%}

flag0=0;

while L>0
     F=B;

 
  % F(1)=19;
  % F(2)=25/24;

if flag0 == 0
                b = mod(F(L),6);
                c = fix(F(L)/6);        
                
                if realn3<0
                    ppp=1;
                    break
                end

                dd=0;
               
                data2=0;
                data3=0;

                flag = 0;
                switch b
                    case 1
                        flag=1;
                        e=0;
                        d=0;
                    case 2
                        d=1;
                        e=0;
                    case 3
                        d=0;
                        e=1;
                    case 4
                        d=2;
                        e=0;
                    case 5
                        e=1;
                        d=1;
                    otherwise
                        d=0;
                        e=0;
                end

                if flag==1
                   c=c-1;
                   e=e+1;
                   d=d+2;
                   flag = 0;
                end

                fp = fopen('D:\result.txt','wt');

                if c*3<n2

                for i =1 : (c*3)
                    fprintf(fp, '%d', i);
                    fprintf(fp, '\n');

                   % celldisp(Solution(i,1));
                                     A=Solution{n3+i,1};
                                    [m,n]=size(A);
                                    

                                    r=A(1,1)+(row+1)/2;
                                    u=-A(1,2)+(row+1)/2;
                                  
                                    statu(u,r)=1;
                                    statu2(u,r)=1;

                                    r=A(2,1)+(row+1)/2;
                                    u=-A(2,2)+(row+1)/2;
                                    statu(u,r)=1;
                                    statu2(u,r)=1;

                                     for y=1:1:m
                                        for x=1:1:n
                                           if x==n
                                             fprintf(fp,'%g\n',A(y,x));
                                          else
                                            fprintf(fp,'%g\t',A(y,x));
                                           end
                                        end
                                    end

                    fprintf(fp, '\n');
                    fprintf(fp, '\n');

                end

                              if e~=0

                                for i =1 : e
                                    fprintf(fp, '%d', (c*3+i));
                                    fprintf(fp, '\n');

                                   % celldisp(Solution(i,1));
                                                     A=Solution{i,1};
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                  r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                               statu(u,r)=1;
                                               statu2(u,r)=1;

                                                  r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;


                                                for y=1:1:m
                                                        for x=1:1:n
                                                           if x==n
                                                             fprintf(fp,'%g\n',A(y,x));
                                                          else
                                                            fprintf(fp,'%g\t',A(y,x));
                                                           end
                                                        end
                                                    end

                                    fprintf(fp, '\n');
                                    fprintf(fp, '\n');

                                end

                                        if d~=0

                                        for i =1 : d
                                            fprintf(fp, '%d', (c*3+e+i));
                                            fprintf(fp, '\n');

                                           % celldisp(Solution(i,1));
                                                A = Solution{(n3+c*3+i),1};
                                                [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                               statu(u,r)=1;
                                               statu2(u,r)=1;



                                                             for y=1:1:m
                                                                for x=1:1:n
                                                                   if x==n
                                                                     fprintf(fp,'%g\n',A(y,x));
                                                                  else
                                                                    fprintf(fp,'%g\t',A(y,x));
                                                                   end
                                                                end
                                                            end

                                            fprintf(fp, '\n');
                                            fprintf(fp, '\n');

                                        end

                                        end

                              else

                                        if d~=0

                                                    for i =1 : d
                                                        fprintf(fp, '%d', (c*3+i));
                                                        fprintf(fp, '\n');

                                                       % celldisp(Solution(i,1));
                                                                         A=Solution{(n3+c*3+i),1};
                                                                        [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                               statu(u,r)=1;
                                               statu2(u,r)=1;


                                                                         for y=1:1:m
                                                                            for x=1:1:n
                                                                               if x==n
                                                                                 fprintf(fp,'%g\n',A(y,x));
                                                                              else
                                                                                fprintf(fp,'%g\t',A(y,x));
                                                                               end
                                                                            end
                                                                        end

                                                        fprintf(fp, '\n');
                                                        fprintf(fp, '\n');

                                                    end
                                        end
                              end

                              realn2=n2-c*3-d;
                              realn3=n3-e;
                else

                                for i =1 : n2
                                fprintf(fp, '%d', i);
                                fprintf(fp, '\n');

                               % celldisp(Solution(i,1));
                                                 A=Solution{n3+i,1};
                                                [m,n]=size(A);


                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                 for y=1:1:m
                                                    for x=1:1:n
                                                       if x==n
                                                         fprintf(fp,'%g\n',A(y,x));
                                                      else
                                                        fprintf(fp,'%g\t',A(y,x));
                                                       end
                                                    end
                                                end

                                fprintf(fp, '\n');
                                fprintf(fp, '\n');

                                end

                            F(L)=F(L)-2*n2;
                            b = mod(F(L),6);
                            c = fix(F(L)/6);

                            flag = 0;
                            switch b
                                case 1
                                    flag=1;
                                    e=0;
                                    d=0;
                                case 2
                                    d=1;
                                    e=0;
                                case 3
                                    d=0;
                                    e=1;
                                case 4
                                    d=2;
                                    e=0;
                                case 5
                                    e=1;
                                    d=1;
                                otherwise
                                    d=0;
                                    e=0;
                            end

                            if flag==1
                               c=c-1;
                               e=e+1;
                               d=d+2;
                               flag = 0;
                            end


                            for i =1 : (c*2)
                                fprintf(fp, '%d', (i+n2));
                                fprintf(fp, '\n');

                               % celldisp(Solution(i,1));
                                                 A=Solution{i,1};
                                                [m,n]=size(A);


                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                 for y=1:1:m
                                                    for x=1:1:n
                                                       if x==n
                                                         fprintf(fp,'%g\n',A(y,x));
                                                      else
                                                        fprintf(fp,'%g\t',A(y,x));
                                                       end
                                                    end
                                                end

                                fprintf(fp, '\n');
                                fprintf(fp, '\n');

                            end


                            if e~=0

                                for i =1 : e
                                    fprintf(fp, '%d', (n2+c*2+i));
                                    fprintf(fp, '\n');

                                   % celldisp(Solution(i,1));
                                                     A=Solution{(i+c*2),1};
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;


                                                for y=1:1:m
                                                        for x=1:1:n
                                                           if x==n
                                                             fprintf(fp,'%g\n',A(y,x));
                                                          else
                                                            fprintf(fp,'%g\t',A(y,x));
                                                           end
                                                        end
                                                    end

                                    fprintf(fp, '\n');
                                    fprintf(fp, '\n');

                                end

                                        if d~=0

                                            dd=dd+1;
                                            dt=mod(dd,3);

                                            for i =1 : d
                                            fprintf(fp, '%d', (c*2+e+i));
                                            fprintf(fp, '\n');

                                           % celldisp(Solution(i,1));

                                                D = Solution2{data+i,1};


                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                fprintf(fp,'%d',D(1,1));
                                                fprintf(fp,'\t');
                                                fprintf(fp,'%d',D(1,2));
                                                fprintf(fp, '\n');

                                                r=-D(1,1)+(row+1)/2;
                                                u=D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                fprintf(fp,'%d',-D(1,1));
                                                fprintf(fp,'\t');
                                                fprintf(fp,'%d',-D(1,2));
                                                fprintf(fp, '\n');



                                            fprintf(fp, '\n');
                                            fprintf(fp, '\n');

                                            end

                                            data=data+d;

                                        end

                            else

                                        if d~=0

                                                    for i =1 : d
                                                        fprintf(fp, '%d', (c*2+i));
                                                        fprintf(fp, '\n');

                                                          D = Solution2{data+i,1};
                                                       %celldisp(Solution(i,1));

                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=D(2,1)+(row+1)/2;
                                                u=-D(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                     for y=1:1:m
                                                        for x=1:1:n
                                                           if x==n
                                                             fprintf(fp,'%g\n',A(y,x));
                                                          else
                                                            fprintf(fp,'%g\t',A(y,x));
                                                           end
                                                        end
                                                    end

                                                        fprintf(fp, '\n');
                                                        fprintf(fp, '\n');

                                                    end
                                        end
                            end

                            if d==0
                                realn2=0;
                                realn3=n3-c*2-e;
                            else
                               
                                realn2=0;
                                realn3=n3-c*2-e-2;
                            end
                   end

                fclose(fp);
 flag0 = 1; 
 

      
      for i=1:row
         for j=1:column
             if statu(i,j)~=0
                 number(L)=number(L)+1;
             end
             
                  
             if statu2(i,j)~=0
                 number2(L)=number2(L)+1;
             end
                 
             
         end
     end
     number(L);
     
     StatuN(L,1)={statu};
     
     statu=zeros(row,column);
     StatuN2(L,1)={statu2};
      
      L=L-1;
else
                b = mod(F(L),6);
                c = fix(F(L)/6);
 
         if realn2~=0 
                  
                dd=0;
                data2=0;
                data3=0;

                flag = 0;
                switch b
                    case 1
                        flag=1;
                        e=0;
                        d=0;
                    case 2
                        d=1;
                        e=0;
                    case 3
                        d=0;
                        e=1;
                    case 4
                        d=2;
                        e=0;
                    case 5
                        e=1;
                        d=1;
                    otherwise
                        d=0;
                        e=0;
                end

                if flag==1
                   c=c-1;
                   e=e+1;
                   d=d+2;
                   flag = 0;
                end

                fp = fopen('D:\result.txt','wt');

                if c*3<realn2

                for i =(n2-realn2+1) : (n2-realn2+c*3)
                    fprintf(fp, '%d', i);
                    fprintf(fp, '\n');

                   % celldisp(Solution(i,1));
                                    A=Solution{n3+i,1};
                                    [m,n]=size(A);

                                    r=A(1,1)+(row+1)/2;
                                    u=-A(1,2)+(row+1)/2;
                                    statu(u,r)=1;
                                    statu2(u,r)=1;

                                    r=A(2,1)+(row+1)/2;
                                    u=-A(2,2)+(row+1)/2;
                                    statu(u,r)=1;
                                    statu2(u,r)=1;

                                     for y=1:1:m
                                        for x=1:1:n
                                           if x==n
                                             fprintf(fp,'%g\n',A(y,x));
                                          else
                                            fprintf(fp,'%g\t',A(y,x));
                                           end
                                        end
                                    end

                    fprintf(fp, '\n');
                    fprintf(fp, '\n');

                end

                              if e~=0

                                for i = (n3-realn3+1) : (n3-realn3+e)
                                    fprintf(fp, '%d', (c*3+i));
                                    fprintf(fp, '\n');

                                   % celldisp(Solution(i,1));
                                                     A=Solution{i,1};
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                  r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                for y=1:1:m
                                                        for x=1:1:n
                                                           if x==n
                                                             fprintf(fp,'%g\n',A(y,x));
                                                          else
                                                            fprintf(fp,'%g\t',A(y,x));
                                                           end
                                                        end
                                                    end

                                    fprintf(fp, '\n');
                                    fprintf(fp, '\n');

                                end

                                        if d~=0

                                        for i = (n2-realn2+c*3+1) : (n2-realn2+c*3+d)
                                           
                                            fprintf(fp, '%d', (c*3+e+i));
                                            fprintf(fp, '\n');

                                           % celldisp(Solution(i,1));
                                                            A = Solution{(n3+i),1};
                                                            [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                               statu(u,r)=1;
                                               statu2(u,r)=1;

                                                             for y=1:1:m
                                                                for x=1:1:n
                                                                   if x==n
                                                                     fprintf(fp,'%g\n',A(y,x));
                                                                  else
                                                                    fprintf(fp,'%g\t',A(y,x));
                                                                   end
                                                                end
                                                            end

                                            fprintf(fp, '\n');
                                            fprintf(fp, '\n');

                                        end

                                        end

                              else

                                        if d~=0

                                                    for i =(n2-realn2+c*3+1) : (n2-realn2+c*3+d)
                                                        fprintf(fp, '%d', (c*3+i));
                                                        fprintf(fp, '\n');

                                                       % celldisp(Solution(i,1));
                                                                         A=Solution{(n3+i),1};
                                                                        [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                
                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;


                                                                         for y=1:1:m
                                                                            for x=1:1:n
                                                                               if x==n
                                                                                 fprintf(fp,'%g\n',A(y,x));
                                                                              else
                                                                                fprintf(fp,'%g\t',A(y,x));
                                                                               end
                                                                            end
                                                                        end

                                                        fprintf(fp, '\n');
                                                        fprintf(fp, '\n');

                                                    end
                                        end
                              end

                              realn2=realn2-c*3-d;
                              realn3=realn3-e;
                else
              
                   b = mod(F(L),6);
                   c = fix(F(L)/6);
   %%%%%%%%
   
                            flag = 0;
                            switch b
                                case 1
                                    flag=1;
                                    e=0;
                                    d=0;
                                case 2
                                    d=1;
                                    e=0;
                                case 3
                                    d=0;
                                    e=1;
                                case 4
                                    d=2;
                                    e=0;
                                case 5
                                    e=1;
                                    d=1;
                                otherwise
                                    d=0;
                                    e=0;
                            end

                            if flag==1
                               c=c-1;
                               e=e+1;
                               d=d+2;
                               flag = 0;
                            end
                            
                            
                    pp=3*c-realn2;
                    
                                             if pp~=0
                                                            
                                                          for i =1 : pp

                                                            fprintf(fp, '%d', (c*2+e+i));
                                                            fprintf(fp, '\n');

                                                           % celldisp(Solution(i,1));

                                                                D = Solution2{data+i,1};


                                                                r=D(1,1)+(row+1)/2;
                                                                u=-D(1,2)+(row+1)/2;
                                                                statu(u,r)=1;
                                                                statu2(u,r)=1;
                                                                
                                                                fprintf(fp,'%d',D(1,1));
                                                                fprintf(fp,'\t');
                                                                fprintf(fp,'%d',D(1,2));

                                                                fprintf(fp, '\n');

                                                                r=-D(1,1)+(row+1)/2;
                                                                u=D(1,2)+(row+1)/2;
                                                                statu(u,r)=1;
                                                                statu2(u,r)=1;
                                                                
                                                                fprintf(fp,'%d',-D(1,1));
                                                                fprintf(fp,'\t');
                                                                fprintf(fp,'%d',-D(1,2));
                                                                fprintf(fp, '\n');

                                                            fprintf(fp, '\n');
                                                            fprintf(fp, '\n');

                                                          end   
                                                           
                                             end
                                                        
                                          
                                for i = (n2-realn2+1) : n2
                                    
                                fprintf(fp, '%d', i);
                                
                                fprintf(fp, '\n');

                               % celldisp(Solution(i,1));
                                                 A=Solution{n3+i,1};
                                                [m,n]=size(A);


                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                 for y=1:1:m
                                                    for x=1:1:n
                                                       if x==n
                                                         fprintf(fp,'%g\n',A(y,x));
                                                      else
                                                        fprintf(fp,'%g\t',A(y,x));
                                                       end
                                                    end
                                                end

                                fprintf(fp, '\n');
                                fprintf(fp, '\n');

                                end

                          
%{
                            for i =(n3-realn3+1) : (n3-realn3+c*2)
                                fprintf(fp, '%d', (i+n2));
                                fprintf(fp, '\n');

                               % celldisp(Solution(i,1));
                                                A=Solution{i,1};
                                                [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;

                                                 for y=1:1:m
                                                    for x=1:1:n
                                                       if x==n
                                                         fprintf(fp,'%g\n',A(y,x));
                                                      else
                                                        fprintf(fp,'%g\t',A(y,x));
                                                       end
                                                    end
                                                end

                                fprintf(fp, '\n');
                                fprintf(fp, '\n');

                            end
%}
                                             
                            if e~=0

                                for i =(n3-realn3+1) : (n3-realn3+e)
                                    fprintf(fp, '%d', (n2+c*2+i));
                                    fprintf(fp, '\n');

                                  %  celldisp(Solution(+c*2,1));
                                                     A=Solution{i,1};
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;


                                                for y=1:1:m
                                                        for x=1:1:n
                                                           if x==n
                                                             fprintf(fp,'%g\n',A(y,x));
                                                          else
                                                            fprintf(fp,'%g\t',A(y,x));
                                                           end
                                                        end
                                                    end

                                    fprintf(fp, '\n');
                                    fprintf(fp, '\n');

                                end

                                        if d~=0
%lala
data=data+pp;
                                            %dd=dd+1;
                                            %dt=mod(dd,3);
                                            
                                            if (mod(data,3)+d-3)<0
                                                ff=1;
                                            else
                                                ff=0;
                                            end
                                            

                                            for i =(data+1) : (data+d)
                                                
                                            fprintf(fp, '%d', (c*2+e+i));
                                            fprintf(fp, '\n');

                                           % celldisp(Solution(i,1));

                                                D = Solution2{data+i,1};


                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                
                                                fprintf(fp,'%d',D(1,1));
                                                fprintf(fp,'\t');
                                                fprintf(fp,'%d',D(1,2));
                                                
                                                fprintf(fp, '\n');

                                                r=-D(1,1)+(row+1)/2;
                                                u=D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                
                                                fprintf(fp,'%d',-D(1,1));
                                                fprintf(fp,'\t');
                                                fprintf(fp,'%d',-D(1,2));
                                                fprintf(fp, '\n');

                                            fprintf(fp, '\n');
                                            fprintf(fp, '\n');

                                            end

                                            data=data+d;
                                                                                                                           
                                        end
                                        
                                        %{
                                        if pp~=0
                                          for i =1 : pp
                                                
                                            fprintf(fp, '%d', (c*2+e+i));
                                            fprintf(fp, '\n');

                                           % celldisp(Solution(i,1));

                                                D = Solution2{data+i,1};


                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                fprintf(fp,'%d',D(1,1));
                                                fprintf(fp,'\t');
                                                fprintf(fp,'%d',D(1,2));
                                                
                                                fprintf(fp, '\n');

                                                r=-D(1,1)+(row+1)/2;
                                                u=D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                fprintf(fp,'%d',-D(1,1));
                                                fprintf(fp,'\t');
                                                fprintf(fp,'%d',-D(1,2));
                                                fprintf(fp, '\n');

                                            fprintf(fp, '\n');
                                            fprintf(fp, '\n');

                                            end   
                                        end
                                   
%}
                            else
                                                            
                                        if d~=0

                                             if (mod(data,3)+d-3)<0
                                                ff=1;
                                            else
                                                ff=0;
                                             end
                                            
                                                    for i =(1+data) : (data+d)
                                                      
                                                        fprintf(fp, '%d', (c*2+i));
                                                        fprintf(fp, '\n');

                                                          D = Solution2{data+i,1};
                                                       %celldisp(Solution(i,1));

                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=D(2,1)+(row+1)/2;
                                                u=-D(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                     for y=1:1:m
                                                        for x=1:1:n
                                                           if x==n
                                                             fprintf(fp,'%g\n',A(y,x));
                                                          else
                                                            fprintf(fp,'%g\t',A(y,x));
                                                           end
                                                        end
                                                    end

                                                        fprintf(fp, '\n');
                                                        fprintf(fp, '\n');

                                                    end
                                        end
                            end

                        flag0 = 1;

                            if d==0
                                realn2=0;
                                realn3=realn3-e;
                            else
                                realn2=0;
                                realn3=realn3-c*2-e-ff*2;%
                            end

                   end

                fclose(fp);
        
         else
        
             
              
                  b = mod(F(L),6);
                  c = fix(F(L)/6);     
                  
                dd=0;
               
                data2=0;
                data3=0;

                flag = 0;
                switch b
                    case 1
                        flag=1;
                        e=0;
                        d=0;
                    case 2
                        d=1;
                        e=0;
                    case 3
                        d=0;
                        e=1;
                    case 4
                        d=2;
                        e=0;
                    case 5
                        e=1;
                        d=1;
                    otherwise
                        d=0;
                        e=0;
                end

                if flag==1
                   c=c-1;
                   e=e+1;
                   d=d+2;
                   flag = 0;
                end

                fp = fopen('D:\result.txt','wt');

jj=n3-realn3+2*ceil(data/3)+1;

                            for i =(n3-realn3-2*ceil(data/3)+1) : (n3-realn3-2*ceil(data/3)+c*2)
                                fprintf(fp, '%d', (i+n2));
                                fprintf(fp, '\n');

                               % celldisp(Solution(i,1));
                                                A=Solution{i,1};
                                                [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                 for y=1:1:m
                                                    for x=1:1:n
                                                       if x==n
                                                         fprintf(fp,'%g\n',A(y,x));
                                                      else
                                                        fprintf(fp,'%g\t',A(y,x));
                                                       end
                                                    end
                                                end

                                fprintf(fp, '\n');
                                fprintf(fp, '\n');

                            end

                            if e~=0

                                for i =(n3-realn3-2*ceil(data/3)+1) : (n3-realn3-2*ceil(data/3)+e)
                                    fprintf(fp, '%d', (n2+c*2+i));
                                    fprintf(fp, '\n');

                                   % celldisp(Solution((i+c*2),1))
                                  
                                                     A=Solution{(i+c*2),1};
                                                     
                                                    
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;


                                                for y=1:1:m
                                                        for x=1:1:n
                                                           if x==n
                                                             fprintf(fp,'%g\n',A(y,x));
                                                          else
                                                            fprintf(fp,'%g\t',A(y,x));
                                                           end
                                                        end
                                                    end

                                    fprintf(fp, '\n');
                                    fprintf(fp, '\n');

                                end

                                        if d~=0
%lala

                                            %dd=dd+1;
                                            %dt=mod(dd,3);
                                            
                                            if (mod(data,3)+d-3)<0
                                                ff=1;
                                            else
                                                ff=0;
                                            end
                                            

                                            for i =1 : d
                                                
                                            fprintf(fp, '%d', (c*2+e+i));
                                            fprintf(fp, '\n');

                                           % celldisp(Solution(i,1));

                                                D = Solution2{data+i,1};


                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                
                                                fprintf(fp,'%d',D(1,1));
                                                fprintf(fp,'\t');
                                                fprintf(fp,'%d',D(1,2));
                                                
                                                fprintf(fp, '\n');

                                                r=-D(1,1)+(row+1)/2;
                                                u=D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                
                                                fprintf(fp,'%d',-D(1,1));
                                                fprintf(fp,'\t');
                                                fprintf(fp,'%d',-D(1,2));
                                                fprintf(fp, '\n');

                                            fprintf(fp, '\n');
                                            fprintf(fp, '\n');

                                            end

                                            data=data+d;
                                                                                                                           
                                        end
                                        
                                        

                            else
                                 
                                
                                        if d~=0
                                            
                                            if (mod(data,3)+d-3)<0
                                                ff=1;
                                            else
                                                ff=0;
                                            end
%ttt=1
                                                    for i =(data+1) : (data+d)
                                                        fprintf(fp, '%d', (c*2+i));
                                                        fprintf(fp, '\n');

                                                          D = Solution2{data+i,1};
                                                       %celldisp(Solution(i,1));

                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                r=D(2,1)+(row+1)/2;
                                                u=-D(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;

                                                     for y=1:1:m
                                                        for x=1:1:n
                                                           if x==n
                                                             fprintf(fp,'%g\n',A(y,x));
                                                          else
                                                            fprintf(fp,'%g\t',A(y,x));
                                                           end
                                                        end
                                                    end

                                                        fprintf(fp, '\n');
                                                        fprintf(fp, '\n');

                                                    end
                                        end
                            end

                        flag0 = 1;

                            if d==0
                                realn2=0;
                                realn3=realn3-c*2-e;
                            else
                                realn2=0;
                                realn3=realn3-c*2-e-ff*2;%
                            end

                 

                fclose(fp);
         end
         

      
     for i=1:row
         for j=1:column
             if statu(i,j)~=0
                 number(L)=number(L)+1;
  
             end
         end
     end
     
           
     for i=1:row
         for j=1:column
             if statu2(i,j)~=0
                 number2(L)=number2(L)+1;
             end
         end
     end
          
     StatuN(L,1)={statu};
     
     statu=zeros(row,column);
     StatuN2(L,1)={statu2};
     
     L=L-1;
       
end
   
end

for i=1:L
celldisp(StatuN(i,1));
end




                               
