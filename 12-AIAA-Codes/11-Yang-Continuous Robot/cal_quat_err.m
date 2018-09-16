function err= cal_quat_err (Q1, Q2)


% calcu rotation 
s_d= Q1(1);
v_d=[ Q1(2) Q1(3) Q1(4)  ]';

s_c= Q2(1);
v_c=[ Q2(2) Q2(3) Q2(4)  ]';

err= s_c* v_d -s_d* v_c -skewSymmetricMatrix (v_d)* v_c;

end


function skewM = skewSymmetricMatrix (vec)
    
    vector=vec';
    skewM(1,1)=0;              skewM(1,2)=-vector(3);     skewM(1,3)=vector(2);
    skewM(2,1)=vector(3);      skewM(2,2)=0;              skewM(2,3)=-vector(1);
    skewM(3,1)=-vector(2);     skewM(3,2)=vector(1);      skewM(3,3)=0;
    
end