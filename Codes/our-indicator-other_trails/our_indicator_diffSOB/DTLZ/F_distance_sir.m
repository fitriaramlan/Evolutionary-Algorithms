function DistanceValue = F_distance(FunctionValue,M,w)
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
 
    fpr    = w*PopObj';
    fpr    = sum(fpr',2);
    %fpr    = mean(PopObj,2);
   [~,rank] = sort(fpr);
  
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    DistanceValue = zeros(1,N);                             % the crowding-distance of each solution


    for j = 2 : N

        SFunctionValue = max(PopObj(rank(1:j-1),:),repmat(PopObj(rank(j),:),(j-1),1));
        
        Distance = inf(1,j-1);
            
        for i = 1 : (j-1)
            Distance(i) = norm(SFunctionValue(i,:)-PopObj(rank(j),:))/M;
        end
           
        Distance = min(Distance);
        
        DistanceValue(rank(j)) = exp(-Distance);

         
    end


