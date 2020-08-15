function [FrontValue,DistanceValue,NoF] = SORNS (Population)
% Efficient non-dominated sort on sequential search strategy
% Copyright 2014 BCMA Group in Anhui University
% Written by Ye Tian
%
% Input: 
%        Population: a N-by-M matrix, which stands for the population on
%                    objective space, each row of Y stands for one solution, 
%                    and each column stands for one dimension
%        operation:  if operation = 'half', sorts only just more than a half
%                    solutions which have smaller front numbers than the other
%                    half. The solutions which have not been sorted have the
%                    same front number of Inf
%
% Output:         
%        FrontValue: the front number of each solution, frontvalue(i)=j means
%                    that solution i belongs to front j
%               NoF: number of total fronts
    
    [N,M] = size(Population);   % N = population size, M = number of objectives
    F = cell(N,1);              % the set of fronts
    NoF = 0;                    % Number of fronts
    % sort the population in ascending order according to the first
    % objective value, if two solutions have the same value on the first
    % objective value, sort them according to the second objective value
    [~, result] = sort(Population);
    
    DistanceValue = zeros(N,1);
    for i = 1 : M
        DistanceValue(result(1,i)) = inf;
    end
   
    [~, AA] = sort(result, 1);
    [~,rank] = sort(sum(AA,2));
    
    Front = zeros(N,1);
    I = find(Front == 0);
    NoF = NoF + 1;
    
    while ~isempty(I)
        
      Front(I(1)) = 1;
      F{NoF} = rank(I(1));
       
      for i = 2:length(I) 
            % compare Population(rank(i)) with the solutions in F{k}
            % starting from the last one and ending with the first one
            for j = 1 : size(F{NoF},2) 
                % do non-dominated comparison
                % x = 0 means the two solutions are non-dominated
                % x = 1 means the former one dominating the latter one (but this won't happen)
                % x = 2 means the latter one dominating the former one
                x = 2;
          
                for j2 = 1 : M
                     if Population(rank(I(i)),j2) < Population(F{NoF}(j),j2)
                        x = 0;
                        break;
                    end
                end
                if x == 2 
                    break;
                end
            end
            if x ~= 2   % if F{k} has no solution dominating Population(rank(i))
                Front(I(i)) = 1;	% move Population(rank(i)) to F{k}
                F{NoF} = [F{NoF},rank(I(i))];
            end        % if F{k} has at least one soultion dominating Population(rank(i))
     end
      
    I = find(Front == 0);
    NoF = NoF + 1;   

    end
    
    flag = 0;
    FrontValue = zeros(1,N) + inf;
    for i = 1 : NoF
      	FrontValue(F{i}) = i;
    %    FrontValue(F{i}) = i + 0.5* (sum(AA(F{i}),2)./max(sum(AA(F{i}),2),[],1))' + 0.5*(1 - (std(AA(F{i}),0,2)./max(std(AA(F{i}),0,2),[],1)))';
         if sum(FrontValue ~= inf) > N/2 && flag == 0
                NoF = i;
                flag = 1;
         end
    end
    
   %FrontValue = FrontValue + 0.1* (sum(AA,2)./max(sum(AA,2),[],1))' + 0.1*(1 - (std(AA,0,2)./max(std(AA,0,2),[],1)))';
   %FrontValue = FrontValue + (1./sum(AA,2))';  
        
   [N,D] = size(Population);
    
    %-----------------------------------------------------------------------------------------     
    % Calculate the weighted distance of each solution
    % the neighbor size
    k = 10;
    % the distance between each two solutions
    Distance = zeros(N)+inf;
    for i = 1 : N-1
        for j = i+1 : N
            Distance(i,j) = norm(AA(i,:)-AA(j,:));
            Distance(j,i) = Distance(i,j); 
        end
    end
    
    for i = 1 : N
        [~,II] = sort(Distance(i,:),2);
        for j = 1 : k
             DistanceValue(i) = DistanceValue(i) + (1./mean(AA(i,:),2))*norm(Population(i,:) - Population(II(j),:));
%             DistanceValue(i) = DistanceValue(i) + (1./sum(AA(II(j),:),2))*norm(Population(i,:) - Population(II(j),:));
%             DistanceValue(i) = DistanceValue(i) + (sum(AA(II(j),:),2)./sum(sum(AA,2),1))*norm(Population(i,:) - Population(II(j),:));
        end
    end
      
    



