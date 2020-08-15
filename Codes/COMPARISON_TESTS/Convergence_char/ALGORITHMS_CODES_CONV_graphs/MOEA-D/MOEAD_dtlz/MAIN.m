% The code of NSGA-II accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
 for Problem = 3
    
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
    
    Runs = 10;
    
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
   %%convergence graphs AND igd,gd,DELTA CALCUL;ATIONS
                    if M==4
                        load D:\Convergence_char\RESULT-LOOP-DTLZ\D1_M4.mat;
                        True_PF = KK;
                        
                    elseif M==6
                        load D:\Convergence_char\RESULT-LOOP-DTLZ\D1_M6.Mat;
                        True_PF = KK;
                    elseif M==8
                        load D:\Convergence_char\RESULT-LOOP-DTLZ\D1_M8.Mat;
                        True_PF = KK;
                    else
                        load D:\Convergence_char\RESULT-LOOP-DTLZ\D1_M10.Mat;
                        True_PF = KK;
                    end
                    % True_PF = (True_PF - repmat(min(True_PF,[],1),size(True_PF,1),1))./repmat(max(True_PF,[],1)-min(True_PF,[],1),size(True_PF,1),1);
                    
                    FunctionValue = F_DTLZ(Population,Problem,M,K);
                    
                    % FunctionValue = (FunctionValue - repmat(min(FunctionValue,[],1),size(FunctionValue,1),1))./repmat(max(FunctionValue,[],1)-min(FunctionValue,[],1),size(FunctionValue,1),1);
                    
                    IGD(Gene)     = IGD_Function(FunctionValue,True_PF);
                    GD(Gene)      = GD_cal(FunctionValue,True_PF);
                    delta(Gene)   = Spread(FunctionValue,True_PF);
                    result(Gene,:)= [Gene;IGD(Gene);GD(Gene);delta(Gene)];
                    
                    save(['D:\Convergence_char\ALGORITHMS_CODES_CONV_graphs\MOEA-D\MOEAD_dtlz\IGD_GD_DELTA_gen\IGD_GD_DELTA_gen_D' num2str(Problem) '_M' num2str(M) '_run' num2str(run) '.mat'],'result');
                                                           
                end % for gene loop
                
               
            end % for runs
            %%
            tot=zeros(size(result));
            for r=1:Runs
                eval(['load D:\Convergence_char\ALGORITHMS_CODES_CONV_graphs\MOEA-D\MOEAD_dtlz\IGD_GD_DELTA_gen\IGD_GD_DELTA_gen_D' num2str(Problem) '_M' num2str(M) '_run' num2str(r) '.mat']);
                tot=tot+result;
                
            end
            FinalMean=tot./Runs;
            eval(['save D:\Convergence_char\FINAL_PLOTvalues\MOEA-D','_', num2str(Problem),'_',num2str(M),'.mat']);
    
     
   
  
    
  end
  
 end
