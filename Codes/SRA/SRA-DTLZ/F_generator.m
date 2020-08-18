cfunction NewPopulation = F_generator(Population,MaxValue,MinValue,FrontValue,SRANK,PRANK)
% Function <F_generator> uses 'Population' to generate a 'NewPopulation'
% with the same size by genetic operation
% Copyright 2014 BCMA Group in Anhui University
% Written by Ye Tian

    [N,D] = size(Population);
    
    % genetic parameters
    rate_c = 1;                 % the probability of crossover
    rate_m = 1 / D;          	% the probability of mutation
    para_c = 20;                % the parameter of crossover
    para_m = 20;                % the parameter of mutation
    
    % crossover
    NewPopulation = zeros(N,D); % offsprings
    
    rank1  = randperm(N);       	% a random rank of parents
    rank2  = randperm(N);
    rank3  = randperm(N);
       
    for i = 1 : N
        % choose parents by binary tournament selection
        k = zeros(1,2);
        k(1) = rank1(i);
        if FrontValue(rank2(i)) < FrontValue(rank3(i))
                k(2) = rank2(i);
        elseif FrontValue(rank3(i)) > FrontValue(rank2(i))
                k(2) = rank3(i);
        elseif PRANK(rank2(i)) < PRANK(rank3(i)) 
                k(2) = rank2(i);
        elseif PRANK(rank2(i)) > PRANK(rank3(i)) 
                k(2) = rank3(i);    
        elseif rand < 0.5
                k(2) = rank2(i);
        else
                k(2) = rank3(i);
        end
        
        % generate two offspring      
        beta = randn(1,D)*1.481;
        beta(rand(1,D)>rate_c)  = 1;
        NewPopulation(i,:) = (Population(k(1),:) + Population(k(2),:))/2 + beta.*(Population(k(1),:) - Population(k(2),:))/2;         
       
    end
    
    % set the infeasible offspring to boundary values
    MaxValue = repmat(MaxValue,N,1);
    MinValue = repmat(MinValue,N,1);
    NewPopulation(NewPopulation>MaxValue) = MaxValue(NewPopulation>MaxValue);
    NewPopulation(NewPopulation<MinValue) = MinValue(NewPopulation<MinValue);
    
    % mutation
    k    = rand(N,D);
    miu  = rand(N,D);
    temp = k <= rate_m & miu < 0.5;
    NewPopulation(temp) = NewPopulation(temp) + (MaxValue(temp)-MinValue(temp)).*((2.*miu(temp)+(1-2.*miu(temp)).*(1-(NewPopulation(temp)-MinValue(temp))./(MaxValue(temp)-MinValue(temp))).^(para_m+1)).^(1/(para_m+1))-1);
    temp = k <= rate_m & miu >= 0.5;    
    NewPopulation(temp) = NewPopulation(temp) + (MaxValue(temp)-MinValue(temp)).*(1-(2.*(1-miu(temp))+2.*(miu(temp)-0.5).*(1-(MaxValue(temp)-NewPopulation(temp))./(MaxValue(temp)-MinValue(temp))).^(para_m+1)).^(1/(para_m+1)));

    % set the infeasible offspring to boundary values
    NewPopulation(NewPopulation>MaxValue) = MaxValue(NewPopulation>MaxValue);
    NewPopulation(NewPopulation<MinValue) = MinValue(NewPopulation<MinValue);
end

