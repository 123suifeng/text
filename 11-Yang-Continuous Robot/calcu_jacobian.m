function J =calcu_jacobian( q )

trans= q(1);
roll=  q(2);
Q1 =   q(3);
Q3 =   q(4);

% numerical differential to obain Jacobian 
dT=0.1;
dO=0.02;

trans_P= trans+ dT;
trans_N= trans- dT;

roll_P= roll+ dO;
roll_N= roll- dO;

Q1_P= Q1+ dO;
Q1_N= Q1- dO;

Q3_P= Q3+ dO;
Q3_N= Q3- dO;

[T_1P, R_1P]=FK(trans_P, roll, Q1, Q3 );
[T_1N, R_1N]=FK(trans_N, roll, Q1, Q3 );
[J_col1]=numertic_diff_Jcobian_col(T_1P, R_1P, T_1N, R_1N, dT, dO );

[T_2P, R_2P]=FK(trans, roll_P, Q1, Q3 );
[T_2N, R_2N]=FK(trans, roll_N, Q1, Q3 );
[J_col2]=numertic_diff_Jcobian_col(T_2P, R_2P, T_2N, R_2N, dT, dO );

[T_3P, R_3P]=FK(trans, roll, Q1_P, Q3 );
[T_3N, R_3N]=FK(trans, roll, Q1_N, Q3 );
[J_col3]=numertic_diff_Jcobian_col(T_3P, R_3P, T_3N, R_3N, dT, dO );

[T_4P, R_4P]=FK(trans, roll, Q1, Q3_P );
[T_4N, R_4N]=FK(trans, roll, Q1, Q3_N );
[J_col4]=numertic_diff_Jcobian_col(T_4P, R_4P, T_4N, R_4N, dT, dO );

J= [J_col1   J_col2  J_col3  J_col4];

end
