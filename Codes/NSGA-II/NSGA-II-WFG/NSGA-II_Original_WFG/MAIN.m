% The code of NSGA-II accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
 for testNo = 1 : 9
    
  for M = 2  % number of objectives
    
    if testNo == 1 % WFG1
     
     Generations = 1000;
                   
    elseif testNo == 2  
          
      Generations = 700;
                
    elseif testNo ==  3 || 4 || 5 || 6 || 7  || 8 ||  9 
       
       Generations = 250;
     
            
    end
       
%-----------------------------------------------------------------------------------------   
    % Algorithm parameters
    
    
    if M == 2 
        
      N = 100;            % population size
      
      k  =  4;
    
    elseif M == 4
        
      N = 120;
      
      k  =  6;
    
    elseif M == 6
        
      N = 132;
      
      k  =  10;
 
     elseif M == 8
        
      N = 156;
      
      k  =  7;
     
    elseif M == 10
        
      N = 276;
    
      k  =  9;
    
    end
    
    Runs = 30;
        
    l =  10;
    D = k + l;
    
    MinValue   = zeros(1,D);
    MaxValue   = ones(1,D);
%-----------------------------------------------------------------------------------------      
  for run = 1 : Runs
         
    % initialize the population
    Population                    = repmat(MinValue,N,1) + repmat(MaxValue - MinValue,N,1).*rand(N,D); % initial population
    F                             = wfg(Population, M, k, l, testNo);     % calculate the objective function values
    FrontValue                    = ENS_SS(F);           % non-dominated sort, and return the front number of each solution
    DistanceValue                 = F_distance(F,FrontValue);           % calculate the crowding-distance values
%-----------------------------------------------------------------------------------------      
    % start iterations
    for Gene = 1 : Generations
        
        % generate offspring
        NewPopulation    = F_generator(Population,MaxValue,MinValue,FrontValue,DistanceValue);
        Population       = [Population;NewPopulation];              % combine the two populations
        F                = wfg(Population, M, k, l, testNo);             % calculate the objective function values
        [FrontValue,NoF] = ENS_SS(F,'half');          	% non-dominated sort, and return the front number of each solution
        DistanceValue    = F_distance(F,FrontValue);    % calculate the crowding-distance values


        % choose the solutions in the first several fronts     
        NextPopulation         = zeros(1,N);                              % store the locations of solutions in 'Population' for the next population
        NoNP                   = numel(FrontValue,FrontValue<NoF);     	% the total number of solutions in the first several fronts
        NextPopulation(1:NoNP) = find(FrontValue<NoF);            % store the solutions in the first several fronts
      
        % choose the solutions in the last front (solutions in the fronts before this front will be selected for next population,
        % and the solutions in this front will be partially selected)
        LastFront                = find(FrontValue==NoF);                   % the solutions in the last front
        [~,rank]                 = sort(DistanceValue(LastFront),'descend');% sort these solutions according to their crowding-distance values
        NextPopulation(NoNP+1:N) = LastFront(rank(1:N-NoNP));       % store the solutions with larger crowding-distance values
         
        % next population
        Population       = Population(NextPopulation,:);         	% next population
        F                = F(NextPopulation,:);
        FrontValue       = FrontValue(NextPopulation);              % the front number of each solution in the next population
        DistanceValue    = DistanceValue(NextPopulation);       	% the crowding-distance values of each solution in the next population
        
    end  
    
     F_output(Population,toc,'NSGA-II',testNo,M,k,l,run);
     
  end
   
  
    
  end
  
 end
