function MatingPool = MatingSelection(PopObj,DistanceValue,M)
% The mating selection of GrEA

%--------------------------------------------------------------------------
% The copyright of the PlatEMO belongs to the BIMK Group. You are free to
% use the PlatEMO for research purposes. All publications which use this
% platform or any code in the platform should acknowledge the use of
% "PlatEMO" and reference "Ye Tian, Ran Cheng, Xingyi Zhang, and Yaochu
% Jin, PlatEMO: A MATLAB Platform for Evolutionary Multi-Objective
% Optimization, 2016".
%--------------------------------------------------------------------------

% Copyright (c) 2016-2017 BIMK Group

    N = size(PopObj,1);

    %% Binary tournament selection
    Parent1   = randi(N,1,N);
    Parent2   = randi(N,1,N);
    MatingPool = zeros(1,N);
   
    for i = 1:N
       if DistanceValue(Parent1(i)) < DistanceValue(Parent2(i))
           MatingPool(i) = Parent1(i);
       elseif DistanceValue(Parent1(i)) > DistanceValue(Parent2(i))
           MatingPool(i) = Parent2(i);
       else
           if rand< 0.5
                MatingPool(i) = Parent1(i);
           else
                MatingPool(i) = Parent2(i);
           end
       end
    end
  