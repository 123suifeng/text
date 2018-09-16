function [Distance] = Distance(V1,V2)

Distance = sqrt((V1(1,1)-V2(1,1))*(V1(1,1)-V2(1,1))+ (V1(1,2)-V2(1,2))*(V1(1,2)-V2(1,2))+ (V1(1,3)-V2(1,3))*(V1(1,3)-V2(1,3)));

end

