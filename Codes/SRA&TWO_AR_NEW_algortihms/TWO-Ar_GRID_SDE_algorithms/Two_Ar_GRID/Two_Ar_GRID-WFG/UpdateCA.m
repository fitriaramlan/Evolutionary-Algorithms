function [CAp,CAo] = UpdateCA(CAp,CAo,Newp,Newo,MaxSize)
% Update CA

%--------------------------------------------------------------------------
% The copyright of the PlatEMO belongs to the BIMK Group. You are free to
% use the PlatEMO for research purposes. All publications which use this
% platform or any code in the platform should acknowledge the use of
% "PlatEMO" and reference "Ye Tian, Ran Cheng, Xingyi Zhang, and Yaochu
% Jin, PlatEMO: A MATLAB Platform for Evolutionary Multi-Objective
% Optimization, 2016".
%--------------------------------------------------------------------------

% Copyright (c) 2016-2017 BIMK Group

    CAp = [CAp;Newp];
    CAo = [CAo;Newo];
    N  = size(CAp,1);
    if N <= MaxSize
        return;
    end
    
    %% Calculate the fitness of each solution
    CAo = (CAo-repmat(min(CAo,[],1),N,1))./(repmat(max(CAo,[],1)-min(CAo,[],1),N,1));
    I = zeros(N);
    for i = 1 : N
        for j = 1 : N
            I(i,j) = max(CAo(i,:)-CAo(j,:));
        end
    end
    C = max(abs(I));
    F = sum(-exp(-I./repmat(C,N,1)/0.05)) + 1;
    
    %% Delete part of the solutions by their fitnesses
    Choose = 1 : N;
    while length(Choose) > MaxSize
        [~,x] = min(F(Choose));
        F = F + exp(-I(Choose(x),:)/C(Choose(x))/0.05);
        Choose(x) = [];
    end
    CAp = CAp(Choose,:);
    CAo = CAo(Choose,:);
 
end