function [data,statu,statu2,realn2,realn3] = Multi_With_Couple(data,statu,statu2,realn2,realn3,Couple_Num,e,d,Solution,Solution2,row,column)
  n2=(column*row-1)/8; n3=(column*row-1)/4;

  if realn2 ~= 0
        for i =(n2-realn2+1) : (n2-realn2+Couple_Num*3)
             A=Solution{n3-realn3+i,1};
            [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
        end
        realn2=realn2-Couple_Num*3-d;
        realn3=realn3-e;
        
  else 
       
            for i = (n3-realn3+1) : (n3-realn3+Couple_Num*2)
                      A=Solution{i,1};
                     [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
            end
            
            realn3 = realn3 - Couple_Num*2;
            
             if e~=0
                for i = (n3-realn3+1) : (n3-realn3+e)
                      A=Solution{i,1};
                     [statu,statu2] = Decide_Statis(statu,statu2,A,row) ;
                end
                  if d~=0
                    for i =(1+data) : (d+data)                       
                        D = Solution2{data+i,1};
                        [statu,statu2] = Decide_Statis(statu,statu2,D,row);
                    end
                    data=data+d;
                   end
             else
               if d~=0                  
                %dd=dd+1;
                %dt=mod(dd,3);
                for i =(1+data) : (d+data)  
                    D = Solution2{data+i,1};
                    [statu,statu2] = Decide_Statis(statu,statu2,D,row);
                end
                data=data+d;
               end
            
                            
             end
             
  end
             
             realn3=realn3-e;
end

