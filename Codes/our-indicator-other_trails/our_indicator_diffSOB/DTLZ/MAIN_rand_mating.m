% The code of NSGA-II accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
  for M = [8 6 4 10 2]
    for Problem = 1:7
    
  %for M = 8 % number of objectives
    
    if Problem == 1 % DTLZ1
         
      K = 5;  % the parameter in DTLZ1
              
    elseif Problem == 2 || 3 || 4  
          
      K = 10;  % the parameter in DTLZ2, DTLZ3, DTLZ4,
                
    elseif Problem == 5 || 6 
          
      K = 10;  % the parameter in DTLZ5, DTLZ6  
           
    elseif Problem == 7 % DTLZ7
     
      K = 20;  % the parameter in DTLZ7  fmax   = repmat(max(PopObj,[],1),N,1);
    fmin   = repmat(min(PopObj,[],1),N,1);
            
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
    elseif Problem == 6
        
     Generations = 250;
     
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
    w= rand(1,M);

    w = w/sum(w,2);
    
    
    Runs = 10;
    
    Boundary = [MaxValue;MinValue]; 
%-----------------------------------------------------------------------------------------      
  for run = 1: Runs
         
    % initialize the population
    Population                    = repmat(MinValue,N,1) + repmat(MaxValue - MinValue,N,1).*rand(N,D); % initial population
    FunctionValue                 = F_DTLZ(Population,Problem,M,K);     % calculate the objective function values
    DistanceValue                 = F_distance_sir(FunctionValue,M,w); 
%-----------------------------------------------------------------------------------------      
    % start iterations
    for Gene = 1 : Generations
        
     %   MatingPool          = MatingSelection(FunctionValue,10);
        MatingPool          = MatingSelection_rand_PREV_DIS_SENDING(FunctionValue,DistanceValue,M);
        NewPopulation       = F_operator(Population(MatingPool',:),Boundary);%offspring production
        
        Population       = [Population;NewPopulation];              % combine the two populations
        FunctionValue    = F_DTLZ(Population,Problem,M,K);             % calculate the objective function values
        
        DistanceValue    = F_distance_sir(FunctionValue,M,w);    % calculate the crowding-distance values
    
      %  length(find(DistanceValue~=0))
        
      
        [~,rank]         = sort(DistanceValue,'ascend');% sort these solutions according to their crowding-distance values
         
        % next population
        Population       = Population(rank(1:N),:);         	% next population
        FunctionValue    = FunctionValue(rank(1:N),:);
        DistanceValue    = DistanceValue(rank(1:N));
    %  Gene     
    end  
  
     F_output(Population,toc,'DTLZ-ISDE+',Problem,M,K,run);
     
 end
   
  
    
  end
  
 end
