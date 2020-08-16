% The code of NSGA-II accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
 for Problem = 6 : 7
    
  for M = 4 : 2 : 10  % number of objectives
    
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
    
    Runs = 30;
    
    T = max(ceil(0.1*N),2);    % Number of Neighbors
    T = min(max(T,2),15);
    gamma=0.5;
     
%-----------------------------------------------------------------------------------------      
  for run = 1 : Runs

    % Create Sub-problems
    sp = CreateSubProblems(M,N,T);

    % Initialize Goal Point
    z=zeros(1,M);
          
    % initialize the population
    Population                    = repmat(MinValue,N,1) + repmat(MaxValue - MinValue,N,1).*rand(N,D); % initial population
    FunctionValue                 = F_DTLZ(Population,Problem,M,K);     % calculate the objective function values
    
    z = min([z;FunctionValue],[],1);
    
    for i=1:N
      
        g(i) = DecomposedCost(FunctionValue(i,:),z,sp(i).lambda);
    
    end
    
    FrontValue = ENS_SS (FunctionValue);
    
    at = find(FrontValue==1);
    EP = Population(at,:);
    EF = FunctionValue(at,:);
%-----------------------------------------------------------------------------------------      
    % start iterations
    for Gene = 1 : Generations
        
       for i=1 : N
        
        % Reproduction (Crossover)
        KK = randsample(T,2);
        
        j1 = sp(i).Neighbors(KK(1));
        p1 = Population(j1,:);
        
        j2 = sp(i).Neighbors(KK(2));
        p2 = Population(j2,:);
        
        y = Crossover(p1, p2, gamma, MinValue, MaxValue);
  
        yc = F_DTLZ(y,Problem,M,K);
        
        z = min([z;yc],[],1);
        
         for j = sp(i).Neighbors
            yg = DecomposedCost(yc,z,sp(j).lambda);
            if yg <= g(j)
                Population(j,:) = y;
                FunctionValue(j,:) = yc;
                g(j) = yg;
            end
         end
        
      end
    
    % Determine Population Domination Status
	FrontValue1 = ENS_SS(FunctionValue);
    
    ad = find(FrontValue1==1);
    
    ndpop = Population(ad,:);
    ndf   = FunctionValue(ad,:);

    EP = [EP;ndpop]; 
    EF = [EF;ndf];
    
    FrontValue2 = ENS_SS(EF);
    adc = find(FrontValue2==1);
    EP = EP(adc,:);
    EF = EF(adc,:);
    
    if size(EP,1) > N
        Extra = size(EP,1) - N;
        ToBeDeleted = randsample(size(EP,1),Extra);
        EP(ToBeDeleted,:) = [];
        EF(ToBeDeleted,:) = [];
    end
   Gene 
  end  
    
     F_output(EP,toc,'MOEAD_dtlz',Problem,M,K,run);
     
  end
   
  
    
  end
  
 end
