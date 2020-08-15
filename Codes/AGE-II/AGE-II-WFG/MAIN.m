clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
    
 for testNo = 1:9
    
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
   
    
   
%-----------------------------------------------------------------------------------------      
  for run = 1 : Runs
           
     
    epsilon = 0.1;  
         
    % initialize the population
    Population              = repmat(MinValue,N,1) + repmat(MaxValue - MinValue,N,1).*rand(N,D); % initial population
    F                       = wfg(Population, M, k, l, testNo);                % calculate the objective function values
    [ArchivePop,ArchiveVal] = UpdateArchive(Population,F,epsilon);

%-----------------------------------------------------------------------------------------      
    % start iterations
    for Gene = 1 : Generations
       
        MatingPool                  = MatingSelection(F);
        Offspring                   = F_operator(Population(MatingPool',:),Boundary);
        NewFunctionValue            = wfg(Offspring, M, k, l, testNo);
        [ArchivePop,ArchiveVal]     = UpdateArchive([ArchivePop;Offspring],[ArchiveVal;NewFunctionValue],epsilon);
        [Population,F]  = EnvironmentalSelection(Population,F,ArchivePop,ArchiveVal,N);
       %Gene
    end

    F_output(Population,toc,'AGE-II_WFG',testNo,M,k,l,run);
    
  end
    
     
  end
  
 end
