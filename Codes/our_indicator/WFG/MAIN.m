% The code of NSGA-II accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
 for testNo = 1:9;
    
  for M = 2:2:10  % number of objectives
    
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
    Boundary = [MaxValue;MinValue]; 
%-----------------------------------------------------------------------------------------      
  for run = 1 : Runs
         
    % initialize the population
    Population                    = repmat(MinValue,N,1) + repmat(MaxValue - MinValue,N,1).*rand(N,D); % initial population % initial population
    F                             = wfg(Population, M, k, l, testNo);     % calculate the objective function values
     DistanceValue                 = F_distance_sir(F,M);
%-----------------------------------------------------------------------------------------      
    % start iterations
  for Gene = 1 : Generations
         
        MatingPool          = MatingSelection_with_prev_gen(F,DistanceValue,M);
        NewPopulation       = F_operator(Population(MatingPool',:),Boundary);
        
        Population       = [Population;NewPopulation];              % combine the two populations
        F                = wfg(Population, M, k, l, testNo);             % calculate the objective function values
       
        DistanceValue    = F_distance_sir(F);    % calculate the crowding-distance values

       
        [~,rank]                 = sort(DistanceValue,'ascend');% sort these solutions according to their crowding-distance values
       
        % next population
        Population       = Population(rank(1:N),:);         	% next population
        F                = F(rank(1:N),:);
        DistanceValue    = DistanceValue(rank(1:N));
       % Gene
    end  
    
     F_output(Population,toc,'WFG-ISDE+',testNo,M,k,l,run);
  end
   
  
    
  end
  
 end
