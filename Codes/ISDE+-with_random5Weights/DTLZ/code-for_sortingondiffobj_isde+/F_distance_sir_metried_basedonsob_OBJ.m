function DistanceValue = F_distance(FunctionValue,M)
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
       
    % assigning Rank for SOB and after sorting on each objective i.e. N*M+1 % rank matrix
    rank          = zeros(N,M+1);
    fpr           = mean(PopObj,2);
    [~,rank(:,1)] = sort(fpr);% equal weight vector pop,sob
    for m=1:M
        [~,rank(:,m+1)] = sortrows(PopObj,m);
    end
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %DistanceValue = zeros(1,N); 
   
   isde=zeros(1,N);
%% org ISDE+ calculation
for R=1:M+1
    DistanceValue = zeros(1,N); 
    for j = 2 : N
        
        % SFunctionValue = max(PopObj(rank(1:j-1),:),repmat(PopObj(rank(j),:),(j-1),1));
        SFunctionValue = max(PopObj(rank(1:j-1,R),:),repmat(PopObj(rank(j,R),:),(j-1),1));
        Distance = inf(1,j-1);
        
        for i = 1 : (j-1)
            Distance(i) = norm(SFunctionValue(i,:)-PopObj(rank(j,R),:))/M;
        end
        
        Distance = min(Distance);
        DistanceValue(rank(j,R)) = exp(-Distance);
      
    end
    isde= isde+DistanceValue;  
end
DistanceValue = isde./(M+1);

    
     
     %all_Isde = DistanceValue+DistanceValue1+DistanceValue2+DistanceValue3+DistanceValue4;
    % DistanceValue = all_Isde./5;
  

