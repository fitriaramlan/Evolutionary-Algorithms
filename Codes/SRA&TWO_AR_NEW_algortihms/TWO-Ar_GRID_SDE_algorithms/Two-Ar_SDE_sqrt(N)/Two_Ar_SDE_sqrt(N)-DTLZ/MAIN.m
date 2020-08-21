
% The code of TWO_archiv2 accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
    
 for testNo = 1:7
    
  for M = 4:2:10  % number of objectives
    
      if testNo == 1 % DTLZ1
          Generations = 700;
          k=5  ;
      elseif testNo == 3
          Generations = 1000;
          k=10;
      elseif testNo ==  2 || 4 || 5 || 6
          k=10;
          Generations = 250;
      elseif testNo ==  7
          k=20;
          Generations=250;
      end
    %%
    
    if M==2||4||6||8||10
        N=100;
        D = M-1+k;
    end
    
       
    
  %% 
%     if M == 2
%         N = 100;            % population size
%         k  =  5;
%     elseif M == 4
%         N = 100;
%         k  =  10;
%     elseif M == 6
%         N = 100;
%         k  =  10;
%     elseif M == 8
%         N = 100;
%         k  =  7;
%     elseif M == 10
%         N = 100;
%         k  =  9;
%     end
  %%  
    Runs = 30;
    
    %l =  10;
   % D = M-1+k;
    
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
    F            = F_DTLZ(Population,testNo,M,k);   
    [CAp, CAo]   = UpdateCA([],[],Population,F,CAsize);
    [DAp, DAo]   = UpdateDA_SDE([],[],Population,F,N,p);

%-----------------------------------------------------------------------------------------      
    % start iterations
    for Gene = 1 : Generations
        
      [ParentC,ParentM] = MatingSelection(CAp,CAo,DAp,DAo,N);
      Offspring         = F_operator(ParentC,ParentM,Boundary);
      NewF              = F_DTLZ(Offspring,testNo,M,k); 
      [CAp, CAo]        = UpdateCA(CAp,CAo,Offspring,NewF,CAsize);
      [DAp, DAo]        = UpdateDA_SDE(DAp,DAo,Offspring,NewF,N,p);
        
  Gene
    end

    F_output(DAp,toc,'Two-Ar-SDE',testNo,M,k,run);
    
  end
    
     
  end
  
 end
