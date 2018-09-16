%% use this function to prevent sin(x)/x singularity at x=0
function res=sinXdX(x)


%
res= 1-x*x/(3*2*1)+x*x*x*x/(5*4*3*2*1) - x*x*x*x*x*x/(7*6*5*4*3*2*1);
%
% res=sin(x)/x;

end