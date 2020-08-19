% The code of NSGA-II accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
    
 for testNo = 1 
    
  for M = 2 : 2 : 10 % number of objectives
    
    if testNo == 1 % WFG1
     
     Generations = 1000;
                   
    elseif testNo == 2  
          
      Generations = 700;
                
    elseif testNo ==  3 || 4 || 5 || 6 || 7  || 8 ||  9 
       
       Generations = 250;
     
            
    end
    
   
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
   %% Parameter setting
    %[CAsize,p] =[N,1/M];
    CAsize=N;
    p=1/M;    
    
   
    
   
%-----------------------------------------------------------------------------------------      
  for run = 1 : Runs
         
    % initialize the population
    %% Generate random population
    Population   = repmat(MinValue,N,1) + repmat(MaxValue - MinValue,N,1).*rand(N,D); % initial population
    F            = wfg(Population, M, k, l, testNo);   
    [CAp, CAo]   = UpdateCA([],[],Population,F,CAsize);
    [DAp, DAo]   = UpdateDA([],[],Population,F,N,p);

%-----------------------------------------------------------------------------------------      
    % start iterations
    for Gene = 1 : Generations
      [ParentC,ParentM] = MatingSelection(CAp,CAo,DAp,DAo,N);
      Offspring         = F_operator(ParentC,ParentM,Boundary);
      NewF              = wfg(Offspring, M, k, l, testNo); 
      Population        = [Population;Offspring];
      F                 = [F;NewF];
      [CAp, CAo]        = UpdateCA(CAp,CAo,Population,F,CAsize);
      [DAp, DAo]        = UpdateDA(DAp,DAo,Population,F,N,p);
        
 
    end

    F_output(DAo,toc,'Two-Archive2',testNo,M,k,l,run);
    
  end
    
     
  end
  
 end
