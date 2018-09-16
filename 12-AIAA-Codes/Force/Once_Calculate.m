function [data,statu,statu2,realn2,realn3] = Once_Calculate(data,statu,statu2,F1,Thruster_Number,RF,row,column,Solution2,Solution)
 % F1: force ; RF---Average Force
 
 n2=(column*row-1)/8; n3=(column*row-1)/4;
 realn2 = n2; realn3 = n3;
    Number = round(F1/RF);
    %Thruster_Number = Thruster_Number-Number; % Remain Thruster Number

     bbb = mod(F1,6);
     % Number of Triangle Couple
     Couple_Num = fix(F1/6); 

     % d: single line segment
     % e: single triangle segment

     [flag,e,d] = Determine_Seg(bbb);
    
     if flag==1
       Couple_Num = Couple_Num-1;
       e=e+1;  d=d+2;  flag = 0;
     end
           
     
%%
% Solution: Triange Segment
% Solution2: Line Segment
    if Couple_Num*3<n2
        % Without dynamic transfer
       if Couple_Num>0
          
       [data,statu,statu2,realn2,realn3] = With_Couple(data,statu,statu2,realn2,realn3,Couple_Num,e,d,Solution,Solution2,row,column);
       end
       if Couple_Num == 0
       [data,statu,statu2,realn2,realn3] = Without_Couple(data,statu,statu2,realn2,realn3,e,d,Solution,Solution2,row,column);
       end
    else
        % With dynamic transfer
       [data,statu,statu2,realn2,realn3] = With_DynamicTransfer(data,statu,statu2,realn2,realn3,e,d,Solution,Solution2,row,column,F1,Couple_Num);
    end
end

