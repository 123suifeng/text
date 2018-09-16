function [Dex] = Dex_Analysis(Dex,N,QS,Limitation)


 QUpL = Limitation(:,2);
 QDownL = Limitation(:,1);

 qUp = libpointer('doublePtr',QUpL);
 qDown = libpointer('doublePtr',QDownL);
 %%
ND = N;
R = zeros(ND,1);

for i = 1:1:ND
     Y = calcu_jacobian(QS(i,:));
     qPtr=libpointer('doublePtr',QS(i,:));
     [U S V] = svd(Y);
     q = S(1,1)*S(2,2)*S(3,3)*S(4,4);
    
    %R(i,1) = Joint_Limitation(qPtr,qUp,qDown,Nq);
    Dex(i,4) = q;
    %Value = q * R(i,1);
    %Dex(i,5) = Value;  
end

%%
% Norminization
Max = max(Dex(:,4));
Dex(:,4) = Dex(:,4)/Max;
%Max1 = max(Dex(:,5));
%Dex(:,5) = Dex(:,5)/Max1;




figure(2)
colormap(jet);
colorbar;
caxis([0 1]);

set(gcf,'color','w'); 
grid off;hold on;
axis off;hold on;
scatter3(Dex(1:N,1),Dex(1:N,2),Dex(1:N,3),5,Dex(1:N,4));
hold on

camlight('headlight','infinite')
view(3)

end


