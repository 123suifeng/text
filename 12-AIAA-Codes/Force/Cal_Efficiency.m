
f = zeros(18,1);
i=0
for n = 1:2:35
    i = i+1;
[f(i,1)] = Finding_Efficiency(n);
end