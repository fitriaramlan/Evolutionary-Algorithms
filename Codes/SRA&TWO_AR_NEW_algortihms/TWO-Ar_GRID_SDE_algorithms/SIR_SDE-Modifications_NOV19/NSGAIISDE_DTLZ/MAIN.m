% The code of NSGA-II accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
 for Problem = 1:7
    
  for M = 2:2:10 % number of objectives
    
    if Problem == 1 % DTLZ1
         
      K = 5;  % the parameter in DTLZ1
              
    elseif Problem == 2 || 3 || 4  
          
      K = 10;  % the parameter in DTLZ2, DTLZ3, DTLZ4,
                
    elseif Problem == 5 || 6 
          
      K = 10;  % the parameter in DTLZ5, DTLZ6  
           
    elseif Problem == 7 % DTLZ7
     
      K = 20;  % the parameter in DTLZ7
            
    end 
    D = M + K - 1;
    
    MinValue   = zeros(1,D);
    MaxValue   = ones(1,D);
    
       
%-----------------------------------------------------------------------------------------   
    % Algorithm parameters
    
       
    if Problem == 1
        
     Generations = 700;	 % number of iterations
     
    elseif Problem == 3
        
     Generations = 1000;
     
    else
        
      Generations = 250;
      
    end
   
    if M == 2 
        
      N = 100;            % population size
      
    elseif M == 4
        
      N = 120;
    
    elseif M == 6
        
      N = 132;
      
    elseif M == 8
        
      N = 156;
      
    elseif M == 10
        
      N = 276;
      
    end
    
    Runs = 10;
    
%-----------------------------------------------------------------------------------------      
  for run = 1 : Runs
         
    % initialize the population
    Population                    = repmat(MinValue,N,1) + repmat(MaxValue - MinValue,N,1).*rand(N,D); % initial population
    FunctionValue                 = F_DTLZ(Population,Problem,M,K);     % calculate the objective function values
    FrontValue                    = ENS(FunctionValue,N,'all');           % non-dominated sort, and return the front number of each solution
    DistanceValue                 = F_distance(FunctionValue,FrontValue);           % calculate the crowding-distance values
%-----------------------------------------------------------------------------------------      
    % start iterations
    for Gene = 1 : Generations
        
        % generate offspring
        NewPopulation    = F_generator(Population,FunctionValue,MaxValue,MinValue,FrontValue,DistanceValue);
        Population       = [Population;NewPopulation];              % combine the two populations
        FunctionValue    = F_DTLZ(Population,Problem,M,K);             % calculate the objective function values
       
        [FrontValue,NoF] = ENS(FunctionValue,N,'half');          	% non-dominated sort, and return the front number of each solution
        
        DistanceValue    = F_distance(FunctionValue,FrontValue);    % calculate the crowding-distance values


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
        FunctionValue    = FunctionValue(NextPopulation,:);
        FrontValue       = FrontValue(NextPopulation);              % the front number of each solution in the next population
        DistanceValue    = DistanceValue(NextPopulation);       	% the crowding-distance values of each solution in the next population
        Gene
    end  
    
     F_output(Population,toc,'NSGAII-SDE_D',Problem,M,K,run);
     
  end
   
  
    
  end
  
 end
