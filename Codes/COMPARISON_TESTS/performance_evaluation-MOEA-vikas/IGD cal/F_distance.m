function DistanceValue = F_distance(FunctionValue,FrontValue)
% Function <F_distance> calculates the crowding-distance of the solutions
% in each front
% Copyright 2014 BCMA Group in Anhui University
% Written by Ye Tian

    [N,M] = size(FunctionValue);
    
    DistanceValue = zeros(1,N);                             % the crowding-distance of each solution
    front         = setdiff(unique(FrontValue),inf);        % the possible front numbers 
    for f = front
        NowFront = find(FrontValue==f);                     % all the solutions in front 'f'
        Fmax     = max(FunctionValue(NowFront,:),[],1);     % the maximum values of each objective of the solutions in 'f'
        Fmin     = min(FunctionValue(NowFront,:),[],1);     % the mininum values of each objective of the solutions in 'f'
        for i = 1 : M
            [~,rank] = sortrows(FunctionValue(NowFront,i)); % sort the solutions in 'f' in ascending order according to the i-th objective value
            % calculate the crowding-distance value of each solution in
            % 'f' on the i-th objective
            DistanceValue(NowFront(rank(1)))   = inf;
            DistanceValue(NowFront(rank(end))) = inf;
            for j = 2 : length(NowFront)-1
                DistanceValue(NowFront(rank(j)))=DistanceValue(NowFront(rank(j))) + (FunctionValue(NowFront(rank(j+1)),i)-FunctionValue(NowFront(rank(j-1)),i))/(Fmax(i)-Fmin(i));
            end
        end
    end
end

