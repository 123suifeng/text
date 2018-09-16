function [J_row]=numertic_diff_Jcobian_col(T1, Q1, T2, Q2, dT, dO )

%calcu translation 
J_trans= (T1- T2)/ dT;

%calcu orientation  
err_O= cal_quat_err (Q1, Q2);
J_rot =  err_O/ dO;


J_row= [J_trans'  J_rot']';
end







