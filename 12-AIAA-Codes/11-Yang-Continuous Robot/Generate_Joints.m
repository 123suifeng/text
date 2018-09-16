function [QS,Count] = Generate_Joints(N,Limitation)
Nq = 4;

QUp = Limitation(:,2);
QDown = Limitation(:,1);

%% Reachable Workspace Visualisation
% MentoCarlo

%Joint Angles Matrix
QS = zeros(N,Nq);

QLength = zeros(1,Nq);

for i = 1:1:Nq
    QLength(1,i) = (QUp(i)-QDown(i))/N;
end

% QS(:,1) = (QDown(1) + (QUp(1)-QDown(1)) * rand(1,N));

Count = 0;


for i = QDown(1): QLength(1,1): QUp(1)
    for j = QDown(2): QLength(1,2): QUp(2)
        for k = QDown(3): QLength(1,3): QUp(3)
            for M = QDown(4): QLength(1,4): QUp(4)
                Count = Count + 1;
                QS(Count,1) = i;
                QS(Count,2) = j;
                QS(Count,3) = k;
                QS(Count,4) = M;
            end
        end
    end
end



end

