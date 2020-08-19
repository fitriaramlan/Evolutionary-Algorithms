function NewPopulation = F_generator(Population,FunctionValue,MaxValue,MinValue,FrontValue,DistanceValue)
% Function <F_generator> uses 'Population' to generate a 'NewPopulation'
% with the same size by genetic operation
% Copyright 2014 BCMA Group in Anhui University
% Written by Ye Tian

    [N,D] = size(Population);
    
    M = size(FunctionValue,2);
    
    Fmax     = max(FunctionValue,[],1);     
    Fmin     = min(FunctionValue,[],1);    
    
    FunctionValue = (FunctionValue - repmat(Fmin,N,1))./repmat(Fmax-Fmin,N,1);
    
    SFunctionValue = mean(FunctionValue,2);
    
    FX = [FunctionValue,SFunctionValue];
    
    % genetic parameters
    rate_c = 1;                 % the probability of crossover
    rate_m = 1 / D;          	% the probability of mutation
    para_c = 20;                % the parameter of crossover
    para_m = 20;                % the parameter of mutation
    
    % crossover
    NewPopulation = zeros(N,D); % offsprings
    NoNP  = 0;                	% the number of offspring having been generated
    rank  = randperm(N);       	% a random rank of parents
    local = 1;                 	% the location in the rank 
    while NoNP < N
        % choose parents by binary tournament selection
        k = zeros(1,2);
        for i = 1:2
            if local >= N
                rank  = randperm(N);
                local = 1;
            end
            
           if i == 1 
            if FrontValue(rank(local)) < FrontValue(rank(local+1))
                k(i) = rank(local);
            elseif FrontValue(rank(local)) > FrontValue(rank(local+1))
                k(i) = rank(local+1);
            elseif FX(rank(local),M+1) < FX(rank(local+1),M+1)
                k(i) = rank(local);
            else
                k(i) = rank(local+1);
            end
           else
            ap = randi(M,1,1);
            if FrontValue(rank(local)) < FrontValue(rank(local+1))
                k(i) = rank(local);
            elseif FrontValue(rank(local)) > FrontValue(rank(local+1))
                k(i) = rank(local+1);
            elseif FX(rank(local),ap) < FX(rank(local+1),ap)
                k(i) = rank(local);
            else
                k(i) = rank(local+1);
            end
           end
           
            local = local + 2;
        end
        % generate two offspring      
        beta = randn(1,D)*1.481;
        beta(rand(1,D)>rate_c)  = 1;
        NewPopulation(NoNP+1,:) = (Population(k(1),:) + Population(k(2),:))/2 + beta.*(Population(k(1),:) - Population(k(2),:))/2;         
        NewPopulation(NoNP+2,:) = (Population(k(1),:) + Population(k(2),:))/2 - beta.*(Population(k(1),:) - Population(k(2),:))/2;      
        NoNP = NoNP + 2;
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

