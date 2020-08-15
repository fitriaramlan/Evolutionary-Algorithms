function DistanceValue = F_distance(FunctionValue)
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
    fpr    = mean(PopObj,2);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    DistanceValue = zeros(1,N);                             % the crowding-distance of each solution
   
    [~,Fmini] = min(PopObj,[],1);
    [~,Fmaxi] = max(PopObj,[],1);
    for j = 1:N
      pt = find(fpr < fpr(j))';
      NN = length(pt);
      SFunctionValue = max(PopObj(pt,:),repmat(PopObj(j,:),NN,1));
      if NN == 0
        DistanceValue(j) = 1;
      else
        Distance = inf(1,NN);
        for i = 1 : NN
          Distance(i) = norm(PopObj(j,:)-SFunctionValue(i,:));
        end
          Distance = sort(Distance,2);
          if NN < M
             DistanceValue(j) = mean(Distance);
          else
             DistanceValue(j) = mean(Distance(1:M));
          end
       end
           
    end
      DistanceValue(Fmini) = 1;
      DistanceValue(Fmaxi) = 1;


