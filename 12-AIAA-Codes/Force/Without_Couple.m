function [data,statu,statu2,realn2,realn3] = Without_Couple(data,statu,statu2,realn2,realn3,e,d,Solution,Solution2,row,column)
dd = 0; Couple_Num = 0;
n2=(column*row-1)/8; n3=(column*row-1)/4;
      if e~=0
      
           for i = (n3-realn3+1) : (n3-realn3+e)
                A=Solution{i,1};
                [statu,statu2] = Decide_Statis(statu,statu2,A,row);
                %Fig = 2; [n] = Plot_Thruster(Fig,A);
                %Fig = 3; [n] = Plot_Thruster(Fig,A);
           end
            if d~=0
               for i = (n2-realn2+Couple_Num*3+1) : (n2-realn2+Couple_Num*3+d)
                    A = Solution{(n3+i),1};
                    [m,n]=size(A);
                    [statu,statu2] = Decide_Statis(statu,statu2,A,row);
                    %Fig = 2; [n] = Plot_Thruster(Fig,A);
                    %Fig = 3; [n] = Plot_Thruster(Fig,A);
              end
            end
      else
           if d~=0
               
     
                if d>n2
                    %% Dynamic Transfer
                     for i =1 : n2
                         A=Solution{n3+i,1};                              
                        [statu,statu2] = Decide_Statis(statu,statu2,A,row);
                         %Fig = 2; [n] = Plot_Thruster(Fig,A);
                         %Fig = 3; [n] = Plot_Thruster(Fig,A);
                     end
                         dd=dd+1; dt=mod(dd,3);
                     for i =1 : (d-n2)
                         D = Solution2{data+i,1};
                         [statu,statu2] = Decide_Statis(statu,statu2,D,row);
                         %Fig = 2; [n] = Plot_Thruster(Fig,D);
                         %Fig = 3; [n] = Plot_Thruster(Fig,D);

                     end
                            data=data+d;
                else
                     for i =(n2-realn2+Couple_Num*3+1) : (n2-realn2+Couple_Num*3+d)
                         A=Solution{(n3+Couple_Num*3+i),1};
                         [statu,statu2] = Decide_Statis(statu,statu2,A,row);
                         %Fig = 2; [n] = Plot_Thruster(Fig,A);
                         %Fig = 3; [n] = Plot_Thruster(Fig,A);
                     end                       
                end      
            end
      end
          realn2=realn2-d;
          realn3=n3-e;    
   end       


