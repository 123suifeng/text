function [statu,statu2,realn2,realn3] = Multi_Calculate(statu,statu2,FL,realn2,realn3,row,column,Solution2,Solution)
 b = mod(FL,6);c = fix(FL/6);
 statu = zeros(row,column);
 dd=0; data2=0; data3=0; 
Fig = 2;[Array] = Draw_Thruster(row,column,Fig);

  n2=(column*row-1)/8; n3=(column*row-1)/4;
  [flag,e,d] = Determine_Seg(b); 
    if flag==1
       c=c-1; e=e+1;  d=d+2; flag = 0;
    end
                 
if realn2~=0 
  %realn2
      
if c*3<realn2
  % Without dynamic transfer
   if c==0
      if e~=0
          for i = (n3-realn3+1) : (n3-realn3+e)
            A=Solution{i,1};
            [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;                    
            Fig = 2; [n] = Plot_Thruster(Fig,A);
            Fig = 3; [n] = Plot_Thruster(Fig,A);
           end
              if d~=0
                  for i = (n2-realn2+c*3+1) : (n2-realn2+c*3+d)
                      A = Solution{(n3+i),1};
                      [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
                      Fig = 2; [n] = Plot_Thruster(Fig,A);
                      Fig = 3; [n] = Plot_Thruster(Fig,A);
                  end
              end
      else
        if d~=0
          realn2=realn2-1;
             for i =(n2-realn2+c*3+1) : (n2-realn2+c*3+d)
                A=Solution{(n3+i),1};
               [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
                Fig = 2; [n] = Plot_Thruster(Fig,A);
                Fig = 3; [n] = Plot_Thruster(Fig,A);
             end
        end
      end 
   else
        for i =(n2-realn2+1) : (n2-realn2+c*3)
             A=Solution{n3+i,1};
            [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
            Fig = 2; [n] = Plot_Thruster(Fig,A);
            Fig = 3; [n] = Plot_Thruster(Fig,A);
        end
             if e~=0
                for i = (n3-realn3+1) : (n3-realn3+e)
                      A=Solution{i,1};
                     [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
                      Fig = 2; [n] = Plot_Thruster(Fig,A);
                      Fig = 3; [n] = Plot_Thruster(Fig,A);
                end
                 if d~=0
                     for i = (n2-realn2+c*3+1) : (n2-realn2+c*3+d)
                         A = Solution{(n3+i),1};
                        [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
                        Fig = 2; [n] = Plot_Thruster(Fig,A);
                        Fig = 3; [n] = Plot_Thruster(Fig,A);
                      end
                 end
             else
                if d~=0
                    for i =(n2-realn2+c*3+1) : (n2-realn2+c*3+d)
                         A=Solution{(n3+i),1};
                        [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
                         Fig = 2; [n] = Plot_Thruster(Fig,A);
                         Fig = 3; [n] = Plot_Thruster(Fig,A);
                    end
                end
             end
                realn2=realn2-c*3-d; realn3=realn3-e;
   end
else
    b = mod(FL,6);c = fix(FL/6);
    flag = 0; [flag,e,d] = Determine_Seg(b); 
    if flag==1
       c=c-1; e=e+1; d=d+2; flag = 0;
    end
    pp=3*c-realn2;
   if pp~=0
       for i =1 : pp
            D = Solution2{data+i,1};
            [statu,statu2] = Decide_Statis(statu,statu2,D,row) ;
            Fig = 2; [n] = Plot_Thruster(Fig,D);
            Fig = 3; [n] = Plot_Thruster(Fig,D);
       end     
       data=data+pp;
   end
   for i = (n2-realn2+1) : n2
       A=Solution{n3+i,1};
       [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
       Fig = 2; [n] = Plot_Thruster(Fig,A);
       Fig = 3; [n] = Plot_Thruster(Fig,A);
   end
    if e~=0
        for i =(n3-realn3+1) : (n3-realn3+e)
            A=Solution{i,1};
            [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
            Fig = 2; [n] = Plot_Thruster(Fig,A);
            Fig = 3; [n] = Plot_Thruster(Fig,A);
        end
        if d~=0
           data=data+pp;
            if (mod(data,3)+d-3)<0
                ff=1;
            else
                ff=0;
            end
            for i =(data+1) : (data+d)
                D = Solution2{data+i,1};
                [statu,statu2] = Decide_Statis(statu,statu2,D,row) ;
                Fig = 2; [n] = Plot_Thruster(Fig,D);
                Fig = 3; [n] = Plot_Thruster(Fig,D);
            end
                data=data+d ;                                                                
                end
    else
        if d~=0
             if (mod(data,3)+d-3)<0
                ff=1;
            else
                ff=0;
             end
             for i =(1+data) : (data+d)
                 D = Solution2{data+i,1};
                [statu,statu2] = Decide_Statis(statu,statu2,D,row) ;
                Fig = 2; [n] = Plot_Thruster(Fig,D);
                Fig = 3; [n] = Plot_Thruster(Fig,D);
             end
                data=data+d;
        end
    end
        flag0 = 1;
            if d==0
                realn2=0;
                realn3=realn3-e;
            else
                realn2=0;
                realn3=realn3-ccc*2-e-ff*2;
            end
end

else  
        dd=0;  data2=0;  data3=0;  flag = 0;
        [flag,e,d] = Determine_Seg(b); 
        if flag==1
           c=c-1; e=e+1; d=d+2; flag = 0;
        end
        data
        jj=n3-realn3-2*ceil(data/3)+1;
end  
end