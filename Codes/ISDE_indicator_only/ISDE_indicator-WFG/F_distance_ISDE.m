function DistanceValue = F_distance_ISDE(FunctionValue,M)
% Function <F_distance> calculates the crowding-distance of the solutions
% in each front
% Copyright 2014 BCMA Group in Anhui University
% Written by Ye Tian

    [N,M] = size(FunctionValue);
    PopObj = FunctionValue;
%%  sumof OBJECTIVE
 
    fmax   = repmat(max(PopObj,[],1),N,1);
    fmin   = repmat(min(PopObj,[],1),N,1);
    PopObj = (PopObj-fmin)./(fmax-fmin);
%     fpr    = mean(PopObj,2);
%     [~,rank] = sort(fpr);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
%%% SRA ISDE indicator %%%
   %% Compute indicator values of I2 (SDE)
    Distance = inf(N);
    for i = 1 : N
        SPopObj = max(PopObj,repmat(PopObj(i,:),N,1));
        for j = 1 : i-1
            Distance(i,j) = (norm(PopObj(i,:)-SPopObj(j,:)))/M;
        end
    end
    %I2 = min(Distance,[],2);
    DistanceValue = min(Distance,[],2);
