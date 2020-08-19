function [ParentC,ParentM] = MatingSelection(CAp,CAo,DAp,DAo,N)
% The mating selection of Two_Arch2

%--------------------------------------------------------------------------
% The copyright of the PlatEMO belongs to the BIMK Group. You are free to
% use the PlatEMO for research purposes. All publications which use this
% platform or any code in the platform should acknowledge the use of
% "PlatEMO" and reference "Ye Tian, Ran Cheng, Xingyi Zhang, and Yaochu
% Jin, PlatEMO: A MATLAB Platform for Evolutionary Multi-Objective
% Optimization, 2016".
%--------------------------------------------------------------------------

% Copyright (c) 2016-2017 BIMK Group

    CAParent1 = randi(size(CAp,1),ceil(N/2),1);
    CAParent2 = randi(size(CAp,1),ceil(N/2),1);
    Dominate  = any(CAo(CAParent1,:) < CAo(CAParent2,:),2) - any(CAo(CAParent1,:) > CAo(CAParent2,:),2);  
    ParentC   = [CAp([CAParent1(Dominate==1);CAParent2(Dominate~=1)],:);...
                 DAp(randi(size(DAp,1),1,ceil(N/2)),:)];
    ParentM   = CAp(randi(size(CAp,1),N,1),:);
end