function [flag,e,d] = Determine_Seg(bbb)
flag=0;
        switch bbb
            case 1
                flag=1;
                e=0; d=0;
            case 2
                d=1; e=0;
            case 3
                d=0; e=1;
            case 4
                d=2; e=0;
            case 5
                e=1; d=1;
            otherwise
                d=0; e=0;
        end
end

