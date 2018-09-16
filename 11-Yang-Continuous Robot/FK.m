% forward kinematics
% the kinematic is build in the same coordinates with phantom omni device
% input : joint values
% output : the end-effector transfromation in base frame
function [T, R]=FK(trans, roll, Q1, Q3 )

%link parameter 
L1=-9.5;
L2=-3;
L3=-9.5;
Le=-22.5;

% end effector
T_E= [ Le;  0;  0];

% seg3 :rotate around y axis
T3 = [ sinXdX(Q3)*(L3);  0;  min_cosXdX(Q3) *L3;];
R3 = [ cos(Q3)  0      sin(Q3)
       0        1        0 ;
       -sin(Q3)  0    cos(Q3)  ];
            
% seg2
T2 = [ L2;  0;  0];
R2 = [ 1 0 0  ;
       0 1 0  ;
       0 0 1  ];
   
% seg1  :rotate around z axis

T1 = [ sinXdX(Q1)*(L1);   min_cosXdX(Q1) *L1;  0];
R1 = [ cos(Q1) -sin(Q1) 0  ;
       sin(Q1)  cos(Q1) 0  ;
            0       0  1  ];
      
% roll 
T_r = [ 0;   0;  0];
R_r = [ 1  0          0          ;
        0  cos(roll) -sin(roll)  ;
        0  sin(roll)  cos(roll)  ];  


% trans
T_t = [ trans;   0;  0];


% build FK     
T = R_r * (R1*( R2* (R3* T_E+ T3) +  T2 ) +   T1 ) + T_t;
R = R_r *  R1* R2* R3;

end

