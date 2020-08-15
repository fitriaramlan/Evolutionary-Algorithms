function MatingPool = MatingSelection(PopObj,div)
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

    %% Calculate the grid location of each solution
    fmax = max(PopObj,[],1);
    fmin = min(PopObj,[],1);
    lb   = fmin-(fmax-fmin)/2/div;%lower bound
    ub   = fmax+(fmax-fmin)/2/div;%upperbound cal
    d    = (ub-lb)/div;%grid cell size
    lb   = repmat(lb,N,1);
    d    = repmat(d,N,1);
    GLoc = floor((PopObj-lb)./d); %grid location calculation
    GLoc(isnan(GLoc)) = 0;
    
    %% Calculate the GD value of each solution
    GD = zeros(N)+inf;
    for i = 1 : N-1
        for j = i+1 : N
            GD(i,j) = sum(abs(GLoc(i,:)-GLoc(j,:)));%comparing sum of difference of grid location of ith solution with,j=i+1:N,i.e. (N-1) solutions for all obj
            GD(j,i) = GD(i,j);
        end
    end
    
    %% Calculate the GCD value of each solution
    GD  = max(size(PopObj,2)-GD,0);%see gcd equaton--> sum (  (no:of obj=M)-GD(x,Y)  )--> here if difference i.e Gd is more than M then that value of GD =0,other wise difference.
    GCD = sum(GD,2);
    
    %% Binary tournament selection
    Parents1   = randi(N,1,N);
    Parents2   = randi(N,1,N);
    Dominate   = any(PopObj(Parents1,:)<PopObj(Parents2,:),2) - any(PopObj(Parents1,:)>PopObj(Parents2,:),2);
    GDominate  = any(GLoc(Parents1,:)<GLoc(Parents2,:),2) - any(GLoc(Parents1,:)>GLoc(Parents2,:),2);
    MatingPool = [Parents1(Dominate==1 | GDominate==1),...
                  Parents2(Dominate==-1 | GDominate==-1),...
                  Parents1(Dominate==0 & GDominate==0 & GCD(Parents1)<=GCD(Parents2)),...
                  Parents2(Dominate==0 & GDominate==0 & GCD(Parents1)>GCD(Parents2))];
end