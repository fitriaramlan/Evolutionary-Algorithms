function MatingPool = F_mating(Population, FunctionValue, FrontValue, KneePoint)
% This function is used for the mating selection

    [N,D] = size(Population);
%-----------------------------------------------------------------------------------------     
% Calculate the weighted distance of each solution
% the neighbor size
    k = 3;
    % the distance between each two solutions
    Distance = zeros(N)+inf;
    for i = 1 : N-1
        for j = i+1 : N
            Distance(i,j) = norm(FunctionValue(i,:)-FunctionValue(j,:));
            Distance(j,i) = Distance(i,j); 
        end
    end
    Distance = sort(Distance,2);
    % the weighted distance of each solution
	Crowd = sum(Distance(:,1:k).*repmat(k:-1:1,N,1),2); 
%-----------------------------------------------------------------------------------------     
% Sort the solutions based on their 'FrontValue', 'KneePoint' and 'Crowd'
    FitnessValue = [FrontValue',-KneePoint',-Crowd];
    [null,Rank] = sortrows(FitnessValue);
    % the final fitness of each solution (the smaller the better)
    FitnessValue(Rank) = 1:N; 
%-----------------------------------------------------------------------------------------     
% Binary tournament mating selection based on 'FitnessValue'
    Parent1    = randi(N,1,ceil(N/2)*2);
    Parent2    = randi(N,1,ceil(N/2)*2);
    MatingPool = [Parent1(FitnessValue(Parent1)<=FitnessValue(Parent2)),...
                  Parent2(FitnessValue(Parent1)>FitnessValue(Parent2))];
    MatingPool = Population(MatingPool,:);
end

