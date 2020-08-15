% The code of NSGA-II accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
 for Problem = [1 3]
    
  for M = 4:2:10 % number of objectives
    
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
    
    Runs = 10;
    
    Boundary = [MaxValue;MinValue]; 
%-----------------------------------------------------------------------------------------      
  for run = 1: Runs
         
    % initialize the population
    Population                    = repmat(MinValue,N,1) + repmat(MaxValue - MinValue,N,1).*rand(N,D); % initial population
    FunctionValue                 = F_DTLZ(Population,Problem,M,K);     % calculate the objective function values
    DistanceValue                 = F_distance_sir(FunctionValue,M); 
%-----------------------------------------------------------------------------------------      
    % start iterations
    for Gene = 1 : Generations
        
     %   MatingPool          = MatingSelection(FunctionValue,10);
        MatingPool          = MatingSelection_rand_PREV_DIS_SENDING(FunctionValue,DistanceValue,M);
        NewPopulation       = F_operator(Population(MatingPool',:),Boundary);%offspring production
        
        Population       = [Population;NewPopulation];              % combine the two populations
        FunctionValue    = F_DTLZ(Population,Problem,M,K);             % calculate the objective function values
        
        DistanceValue    = F_distance_sir(FunctionValue,M);    % calculate the crowding-distance values
    
      %  length(find(DistanceValue~=0))
        
      
        [~,rank]         = sort(DistanceValue,'ascend');% sort these solutions according to their crowding-distance values
         
        % next population
        Population       = Population(rank(1:N),:);         	% next population
        FunctionValue    = FunctionValue(rank(1:N),:);
        DistanceValue    = DistanceValue(rank(1:N));
      %%convergence graphs AND igd,gd,DELTA CALCUL;ATIONS
                    if M==4
                        load D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\RESULT-LOOP-DTLZ\D1_M4.mat;
                        True_PF = KK;
                        
                    elseif M==6
                        load D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\RESULT-LOOP-DTLZ\D1_M6.Mat;
                        True_PF = KK;
                    elseif M==8
                        load D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\RESULT-LOOP-DTLZ\D1_M8.Mat;
                        True_PF = KK;
                    else
                        load D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\RESULT-LOOP-DTLZ\D1_M10.Mat;
                        True_PF = KK;
                    end
                    % True_PF = (True_PF - repmat(min(True_PF,[],1),size(True_PF,1),1))./repmat(max(True_PF,[],1)-min(True_PF,[],1),size(True_PF,1),1);
                    
                    FunctionValue = F_DTLZ(Population,Problem,M,K);
                    
                    % FunctionValue = (FunctionValue - repmat(min(FunctionValue,[],1),size(FunctionValue,1),1))./repmat(max(FunctionValue,[],1)-min(FunctionValue,[],1),size(FunctionValue,1),1);
                    
                    IGD(Gene)     = IGD_Function(FunctionValue,True_PF);
                    GD(Gene)      = GD_cal(FunctionValue,True_PF);
                    delta(Gene)   = Spread(FunctionValue,True_PF);
                    result(Gene,:)= [Gene;IGD(Gene);GD(Gene);delta(Gene)];
                    
                    save(['D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\ALGORITHMS_CODES_CONV_graphs\our_indicator\DTLZ\IGD_GD_DELTA_gen\IGD_GD_DELTA_gen_D' num2str(Problem) '_M' num2str(M) '_run' num2str(run) '.mat'],'result');
                                                           
                end % for gene loop
                
               
            end % for runs
            %%
            tot=zeros(size(result));
            for r=1:Runs
                eval(['load D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\ALGORITHMS_CODES_CONV_graphs\our_indicator\DTLZ\IGD_GD_DELTA_gen\IGD_GD_DELTA_gen_D' num2str(Problem) '_M' num2str(M) '_run' num2str(r) '.mat']);
                tot=tot+result;
                
            end
            FinalMean=tot./Runs;
            eval(['save D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\FINAL_PLOTvalues\our_ISDE+','_', num2str(Problem),'_',num2str(M),'.mat']);
            
  
    
  end
  
 end
