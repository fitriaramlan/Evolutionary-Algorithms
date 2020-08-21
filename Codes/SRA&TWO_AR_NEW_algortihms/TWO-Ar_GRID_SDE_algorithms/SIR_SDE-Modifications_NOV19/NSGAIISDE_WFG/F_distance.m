function DistanceValue = F_distance(FunctionValue,FrontValue)
% Function <F_distance> calculates the crowding-distance of the solutions
% in each front
% Copyright 2014 BCMA Group in Anhui University
% Written by Ye Tian

    N = size(FunctionValue,1);
    
    Fmax     = max(FunctionValue,[],1);     
    Fmin     = min(FunctionValue,[],1);    
    
    FunctionValue = (FunctionValue - repmat(Fmin,N,1))./repmat(Fmax-Fmin,N,1);
    
    DistanceValue = zeros(1,N);                             % the crowding-distance of each solution
    front         = setdiff(unique(FrontValue),inf);        % the possible front numbers 
    for f = front
        NowFront = find(FrontValue==f);                     % all the solutions in front 'f'
        [~,maxind]     = max(FunctionValue(NowFront,:),[],1);     
        [~,minind]     = min(FunctionValue(NowFront,:),[],1);
        NN = length(NowFront);
        Distance = inf(NN);
        for i = 1 : NN
            SFunctionValue = max(FunctionValue(NowFront,:),repmat(FunctionValue(NowFront(i),:),NN,1));
            for j = [1:i-1,i+1:NN]
             Distance(i,j) = norm(FunctionValue(NowFront(i),:)-SFunctionValue(j,:));
            end
        end
        Distance = sort(Distance,2);
        DistanceValue(NowFront) = Distance(:,floor(sqrt(NN)));
        DistanceValue(NowFront(maxind)) = 1;
        DistanceValue(NowFront(minind)) = 1;
        
    end
  
