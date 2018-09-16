function [data,statu,statu2,realn2,realn3] = NewMulti_Calculate(data,statu,statu2,FL,realn2,realn3,row,column,Solution2,Solution)
b = mod(FL,6); Couple_Num = fix(FL/6);

 statu = zeros(row,column);
 dd=0; data2=0; data3=0; 
 
%Fig = 2;[Array] = Draw_Thruster(row,column,Fig);

  n2=(column*row-1)/8; n3=(column*row-1)/4;
  [flag,e,d] = Determine_Seg(b); 
    if flag==1
       Couple_Num=Couple_Num-1; e=e+1;  d=d+2; flag = 0;
    end
        
    %%
if realn2~=0 
   %% Last Time still have some initial line segment
    
    if Couple_Num*3<realn2
      % Without dynamic transfer
       if Couple_Num==0
           %% without couple
       [data,statu,statu2,realn2,realn3] = Without_Couple(data,statu,statu2,realn2,realn3,e,d,Solution,Solution2,row,column);
       else
           %% With Couple
           [data,statu,statu2,realn2,realn3] = Multi_With_Couple(data,statu,statu2,realn2,realn3,Couple_Num,e,d,Solution,Solution2,row,column);
       end
    else
        %% With Dynamic Transfer

        flag = 0; [flag,e,d] = Determine_Seg(b); 
        if flag==1
           Couple_Num = Couple_Num-1; e=e+1; d=d+2; flag = 0;
        end
        %% transfer : 6 + 1 = 4 + 3

        pp=3*Couple_Num-realn2;

        %% Process for Dynamic Transfer
       if pp~=0
           for i =1 : pp
                D = Solution2{data+i,1};
                [statu,statu2] = Decide_Statis(statu,statu2,D,row) ;
                %Fig = 2; [n] = Plot_Thruster(Fig,D);
                %Fig = 3; [n] = Plot_Thruster(Fig,D);
           end     
           data=data+pp;
       end
       %

       %% Use all the remain line segment
       for i = (n2-realn2+1) : n2
           A=Solution{n3+i,1};
           [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
           %Fig = 2; [n] = Plot_Thruster(Fig,A);
           %Fig = 3; [n] = Plot_Thruster(Fig,A);
       end
       %

        if e~=0
            % Triangle Segment
            for i =(n3-realn3+1) : (n3-realn3+e)
                A=Solution{i,1};
                [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
                %Fig = 2; [n] = Plot_Thruster(Fig,A);
                %Fig = 3; [n] = Plot_Thruster(Fig,A);
            end
            if d~=0
                % Line Segment
               data=data+pp;
                if (mod(data,3)+d-3)<0
                    ff=1;
                else
                    ff=0;
                end
                for i =(data+1) : (data+d)
                    D = Solution2{data+i,1};
                    [statu,statu2] = Decide_Statis(statu,statu2,D,row) ;
                    %Fig = 2; [n] = Plot_Thruster(Fig,D);
                    %Fig = 3; [n] = Plot_Thruster(Fig,D);
                end
                    data=data+d ;                                                                
            end
        else
            % Without Triangle Segment
            if d~=0
                % Line Segment
                 if (mod(data,3)+d-3)<0
                    ff=1;
                else
                    ff=0;
                 end

                 for i =(1+data) : (data+d)
                     D = Solution2{data+i,1};
                    [statu,statu2] = Decide_Statis(statu,statu2,D,row) ;
                    %Fig = 2; [n] = Plot_Thruster(Fig,D);
                    %Fig = 3; [n] = Plot_Thruster(Fig,D);
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
                    realn3=realn3-Couple_Num*2-e-ff*2;
                end
     end

else
    %% Laste Time have already use up all the initial line segment
    
    
    dd=0 ; 
 
         %% Add New
   if Couple_Num == 0
     if e~=0
            for i =(n3-realn3+1) : (n3-realn3+e)
                A=Solution{(i+Couple_Num*2),1};
                [statu,statu2] = Decide_Statis(statu,statu2,A,row);
            end
            if d~=0
                dd=dd+1;
                dt=mod(dd,3);
                for i =1 : d
                    D = Solution2{data+i,1};
                    [statu,statu2] = Decide_Statis(statu,statu2,D,row);
                end
                data=data+d;
            end
            
     else
            if d~=0
               
                 for i =(1+data) : (data+d)
                     D = Solution2{data+i,1};
                    [statu,statu2] = Decide_Statis(statu,statu2,D,row) ;
                 end
                data=data+d;                    
            end
     end
       
        
        realn3 = realn3 - e;
   else

          [data,statu,statu2,realn2,realn3] = Multi_With_Couple(data,statu,statu2,realn2,realn3,Couple_Num,e,d,Solution,Solution2,row,column);
   
   end
        %jj=n3-realn3-2*ceil(data/3)+1;
end 



end

