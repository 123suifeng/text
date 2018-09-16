function [data,statu,statu2,realn2,realn3] = With_DynamicTransfer(data,statu,statu2,realn2,realn3,e,d,Solution,Solution2,row,column,F1,Couple_Num)
n2=(column*row-1)/8; n3=(column*row-1)/4;
dd=0;data = 0;


  %% Use up all the line segments
    for i = (n2-realn2+1) : n2
         A=Solution{n3+i,1};
         [statu,statu2] = Decide_Statis(statu,statu2,A,row);
        %Fig = 2; [n] = Plot_Thruster(Fig,A);
        %Fig = 3; [n] = Plot_Thruster(Fig,A);
    end
    
    % Force that require by dynamic transfer
    F1=F1-2*n2;
        
        %% Dynamic Transfer Part
        bbb = mod(F1,6);   Couple_Num = fix(F1/6);
        flag = 0; [flag,e,d] = Determine_Seg(bbb);
        if flag==1
           Couple_Num = Couple_Num-1;  e=e+1;   d=d+2;  flag = 0;
        end
        
   if Couple_Num > 0
       for i =1 : (Couple_Num*2)
         A=Solution{i,1};
         [statu,statu2] = Decide_Statis(statu,statu2,A,row);
        %Fig = 2; [n] = Plot_Thruster(Fig,A);
        %Fig = 3; [n] = Plot_Thruster(Fig,A);
       end
        if e~=0
            for i =1 : e
                A=Solution{(i+Couple_Num*2),1};
                [statu,statu2] = Decide_Statis(statu,statu2,A,row);
                %Fig = 2; [n] = Plot_Thruster(Fig,A);
                %Fig = 3; [n] = Plot_Thruster(Fig,A);
            end
            if d~=0
                dd=dd+1;
                dt=mod(dd,3);
                for i =1 : d
                    D = Solution2{data+i,1};
                    [statu,statu2] = Decide_Statis(statu,statu2,D,row);
                   %Fig = 2; [n] = Plot_Thruster(Fig,D);
                   %Fig = 3; [n] = Plot_Thruster(Fig,D);
                end
                data=data+d;
            end
        else
            if d~=0
                 for i =1 : d
                    D = Solution2{data+i,1};
                   [statu,statu2] = Decide_Statis(statu,statu2,D,row);
                   %Fig = 2; [n] = Plot_Thruster(Fig,D);
                   %Fig = 3; [n] = Plot_Thruster(Fig,D);
                 end
                  data=data+d;
            end
        end
   end
   
   %% Add New
   if Couple_Num == 0
     if e~=0
            for i =1 : e
                A=Solution{(i+Couple_Num*2),1};
                [statu,statu2] = Decide_Statis(statu,statu2,A,row);
                %Fig = 2; [n] = Plot_Thruster(Fig,A);
                %Fig = 3; [n] = Plot_Thruster(Fig,A);
            end
            if d~=0
                dd=dd+1;
                dt=mod(dd,3);
                for i =1 : d
                    D = Solution2{data+i,1};
                    [statu,statu2] = Decide_Statis(statu,statu2,D,row);
                   %Fig = 2; [n] = Plot_Thruster(Fig,D);
                   %Fig = 3; [n] = Plot_Thruster(Fig,D);
                end
                data=data+d;
            end
        else
            if d~=0
                 for i =1 : d
                    D = Solution2{data+i,1};
                   [statu,statu2] = Decide_Statis(statu,statu2,D,row);
                   %Fig = 2; [n] = Plot_Thruster(Fig,D);
                   %Fig = 3; [n] = Plot_Thruster(Fig,D);
                 end
                  
                  data=data+d;
            end
      end
   end
   
        if d==0
            realn2=0; realn3=n3-Couple_Num*2-e;
        else
            realn2=0; realn3=n3-Couple_Num*2-e-2;
        end
            
end

