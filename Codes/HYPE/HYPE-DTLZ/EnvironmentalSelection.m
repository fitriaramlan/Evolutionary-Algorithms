function [Population,FunctionValue] = EnvironmentalSelection(Population,FunctionValue,N,RefPoint,nSample)
% The environmental selection of HypE

%--------------------------------------------------------------------------
% The copyright of the PlatEMO belongs to the BIMK Group. You are free to
% use the PlatEMO for research purposes. All publications which use this
% platform or any code in the platform should acknowledge the use of
% "PlatEMO" and reference "Ye Tian, Ran Cheng, Xingyi Zhang, and Yaochu
% Jin, PlatEMO: A MATLAB Platform for Evolutionary Multi-Objective
% Optimization, 2016".
%--------------------------------------------------------------------------

% Copyright (c) 2016-2017 BIMK Group

    %% Non-dominated sorting
    [FrontNo,MaxFNo] = NDSort(FunctionValue,N);
    Next = false(1,length(FrontNo));
    Next(FrontNo<MaxFNo) = true;

    %% Select the solutions in the last front
    Last   = find(FrontNo==MaxFNo);
    Choose = true(1,length(Last));
    while sum(Choose) > N-sum(Next)
        drawnow();
        Remain  = find(Choose);
        F       = CalHV(FunctionValue(Last(Remain),:),RefPoint,sum(Choose)-N+sum(Next),nSample);
        [~,del] = min(F);
        Choose(Remain(del)) = false;
    end
    Next(Last(Choose)) = true;
    % Population for next generation
    Population = Population(Next,:);
    FunctionValue = FunctionValue(Next,:);
end