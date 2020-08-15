function [Population,FunctionValue] = EnvironmentalSelection(Population,FunctionValue,ArchivePop,ArchiveVal,N)
% The environmental selection of AGE-II

%--------------------------------------------------------------------------
% The copyright of the PlatEMO belongs to the BIMK Group. You are free to
% use the PlatEMO for research purposes. All publications which use this
% platform or any code in the platform should acknowledge the use of
% "PlatEMO" and reference "Ye Tian, Ran Cheng, Xingyi Zhang, and Yaochu
% Jin, PlatEMO: A MATLAB Platform for Evolutionary Multi-Objective
% Optimization, 2016".
%--------------------------------------------------------------------------

% Copyright (c) 2016-2017 BIMK Group

    NP = length(Population);
    NA = size(ArchivePop,1);
    
    %% Discard the offsprings dominated by the increment of archive
    discard = false(1,NP);
    for i = N+1 : NP
        discard(i) = any(all(repmat(FunctionValue(i),NA,1)>= ArchiveVal+1,2));
    end
    Population(discard,:)    = [];
    FunctionValue(discard,:) = [];
    
    NP = length(Population);
    
    %% Remove solutions by fast approximation
    alpha = zeros(NP,NA);
    for i = 1 : NA
        alpha(:,i) = max(FunctionValue-repmat(ArchiveVal(i,:),NP,1),[],2);
    end
    [rho,rank] = sort(alpha,1);
    % Delete the solution one by one
    Remain = 1 : NP;
    while length(Remain) > N
        % Calculate the approximations when each solution is eliminated
        % from the population
        S = zeros(length(Remain),NA);
        for i = 1 : length(Remain)
            temp = rank(1,:) == Remain(i);
            S(i,~temp) = rho(1,~temp);
            S(i,temp)  = rho(2,temp);
        end
        % Delete the worst solution in the population and update the
        % variables
        [~,worst] = sortrows(sort(S,2,'descend'));
        remain = rank ~= Remain(worst(1));
        rho    = reshape(rho(remain),length(Remain)-1,NA);
        rank   = reshape(rank(remain),length(Remain)-1,NA);
        Remain(worst(1)) = [];
    end
    % Population for next generation
    Population = Population(Remain,:);
    FunctionValue = FunctionValue(Remain,:);
end