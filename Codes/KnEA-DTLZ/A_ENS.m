function [FrontValue, NoF, NoC] = A_ENS (Population,operation)
% Approximate non-dominated sorting for evolutionary many-objective
% optimization, Information Sciences, 2016.
% Xingyi Zhang, Ye Tian and Yaochu Jin
% Copyright 2016 BIMK Group, Written by Ye Tian
%
% Input: 
%        Population: a N-by-M matrix, which stands for the population on
%                    objective space, each row of Y stands for one solution, 
%                    and each column stands for one dimension
%        operation:  if operation = 'half', sorts only just more than a half
%                    solutions which have smaller front numbers than the other
%                    half. The solutions which have not been sorted have the
%                    same front number of Inf
%                    if operation = 'first', sorts only just the solutions
%                    on the first front
%
% Output:         
%        FrontValue: the front number of each solution
%               NoF: number of total fronts

    if nargin<2
        kinds=1;
    elseif strcmp(operation,'half')
        kinds=2;
    elseif strcmp(operation,'first')
        kinds=3;
    else
        kinds=1;
    end
    
    N = size(Population,1);     % N denotes the population size
    F = cell(N,1);              % the set of fronts
    NoF = 0;                    % number of fronts
    NoC = 0;
    Sorted = zeros(1,N);        % the flag to tell that each solution has been sorted or not
    % sort the population in ascending order according to the first
    % objective value, if two solutions have the same value on the first
    % objective value, sort them according to the second objective value
    [Population,rank] = sortrows(Population);
    % normalization
    Population = Population ./ repmat(max(Population,[],1),N,1);
    % find the minimum and maximum value of each solution
    [minvalue,minloc] = min(Population(:,2:end),[],2);
    [maxvalue,maxloc] = max(Population(:,2:end),[],2);
    minloc = minloc + 1;
    maxloc = maxloc + 1;
    meanvalue = mean(Population(:,2:end),2);
    % do sorting until all solutions have been sorted
    while (kinds==1 && sum(Sorted)<N) || (kinds==2 && sum(Sorted)<N/2) || (kinds==3 && NoF<1)
        NoF = NoF + 1;              % start sorting on a new front
        NSorted = find(Sorted == 0);% find all the not sorted solutions
        F{NoF}  = NSorted(1);      	% put the first not sorted solution into the current front
        Sorted(NSorted(1)) = 1;
        % for each not sorted solution
        for i = NSorted(2:end)
            % compare Population(rank(i)) with all the solutions now in the current front
            for j = length(F{NoF}) : -1 : 1
                % do non-dominated comparison
                % x = 0 means the two solutions are non-dominated
                % x = 1 means the former one dominating the latter one (but this won't happen)
                % x = 2 means the latter one dominating the former one
                if minvalue(i) < Population(F{NoF}(j),minloc(i))
                    x = 0;
                    NoC = NoC + 1;
                elseif maxvalue(F{NoF}(j)) > Population(i,maxloc(F{NoF}(j)))
                    x = 0;
                    NoC = NoC + 2;
                elseif meanvalue(i) < meanvalue(F{NoF}(j))
                    x = 0;
                    NoC = NoC + 3;
                else
                    x = 2;
                    NoC = NoC + 3;
                end
                if x == 2
                    break;
                end
            end
            if x ~= 2   % if the current front has no solution dominating Population(rank(i))
                F{NoF} = [F{NoF},i];	% move Population(rank(i)) to the current front
                Sorted(i) = 1;
            end
        end
    end
    % convert 'F' to 'FrontValue' 
    FrontValue = zeros(1,N) + inf;
    for i = 1 : NoF
        FrontValue(F{i}) = i;
    end
    FrontValue(rank) = FrontValue;
end