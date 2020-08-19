function [FrontValue,NoF] = ENS_SS (Population,operation,N)
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
    [~,rank] = sortrows(Population);
    
    % assign the first solution to the first front
    F{1} = rank(1);
    NoF = NoF + 1;
    % for each solution in the sorted population, do sequential search
    for i = 2 : N
        k = 1;	% the front now checked
        while 1
            % compare Population(rank(i)) with the solutions in F{k}
            % starting from the last one and ending with the first one
            for j = size(F{k},2) : -1 : 1
                % do non-dominated comparison
                % x = 0 means the two solutions are non-dominated
                % x = 1 means the former one dominating the latter one (but this won't happen)
                % x = 2 means the latter one dominating the former one
                x = 2;
                for j2 = 2 : M
                    if Population(rank(i),j2) < Population(F{k}(j),j2)
                        x = 0;
                        break;
                    end
                end
                if x == 2 || M == 2
                    break;
                end
            end
            if x ~= 2   % if F{k} has no solution dominating Population(rank(i))
                F{k} = [F{k},rank(i)];	% move Population(rank(i)) to F{k}
                break;
            else        % if F{k} has at least one soultion dominating Population(rank(i))
                if k < NoF
                    k = k + 1;
                else
                    NoF = NoF + 1;
                    F{NoF} = rank(i); 	% move Population(rank(i)) to F{NoF+1}
                    break;
                end
            end
        end
    end
    % convert 'F' to 'FrontValue' 
    FrontValue = zeros(1,N) + inf;
    if nargin>1 && strcmp(operation,'half')
        for i = 1 : NoF
            if sum(FrontValue ~= inf) > N/2
                NoF = i - 1;
                break;
            else
                FrontValue(F{i}) = i;
            end
        end
    else
        for i = 1 : NoF
        	FrontValue(F{i}) = i;
        end
    end
end

