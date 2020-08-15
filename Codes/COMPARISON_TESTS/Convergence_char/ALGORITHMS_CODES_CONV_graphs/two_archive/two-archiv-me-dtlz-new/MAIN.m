

% The code of TWO_archiv2 accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
    
 for Problem = 3
    
  for M = 4:2:10  % number of objectives
    
      if Problem == 1 % DTLZ1
          Generations = 700;
          K=5  ;
      elseif Problem == 3
          Generations = 1000;
          K=10;
      elseif Problem ==  2 || 4 || 5 || 6
          K=10;
          Generations = 250;
      elseif Problem ==  7
          K=20;
          Generations=250;
      end
    %%
    
    if M==2||4||6||8||10
        N=100;
        D = M-1+K;
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
    Runs = 10;
    
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
    FunctionValue            = F_DTLZ(Population,Problem,M,K);   
    [CAp, CAo]   = UpdateCA([],[],Population,FunctionValue,CAsize);
    [DAp, DAo]   = UpdateDA([],[],Population,FunctionValue,N,p);

%-----------------------------------------------------------------------------------------      
    % start iterations
    for Gene = 1 : Generations
        
      [ParentC,ParentM] = MatingSelection(CAp,CAo,DAp,DAo,N);
      Offspring         = F_operator(ParentC,ParentM,Boundary);
      NewFunctionValue              = F_DTLZ(Offspring,Problem,M,K); 
      [CAp, CAo]        = UpdateCA(CAp,CAo,Offspring,NewFunctionValue,CAsize);
      [DAp, DAo]        = UpdateDA(DAp,DAo,Offspring,NewFunctionValue,N,p);
        
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
                    
                    save(['D:\Convergence_char\ALGORITHMS_CODES_CONV_graphs\two_archive\two-archiv-me-dtlz-new\IGD_GD_DELTA_gen\IGD_GD_DELTA_gen_D' num2str(Problem) '_M' num2str(M) '_run' num2str(run) '.mat'],'result');
                                                           
                end % for gene loop
                
               
            end % for runs
            %%
            tot=zeros(size(result));
            for r=1:Runs
                eval(['load D:\Convergence_char\ALGORITHMS_CODES_CONV_graphs\two_archive\two-archiv-me-dtlz-new\IGD_GD_DELTA_gen\IGD_GD_DELTA_gen_D' num2str(Problem) '_M' num2str(M) '_run' num2str(r) '.mat']);
                tot=tot+result;
                
            end
            FinalMean=tot./Runs;
            eval(['save D:\Convergence_char\FINAL_PLOTvalues\TWO_Ar2','_', num2str(Problem),'_',num2str(M),'.mat']);
    
    
     
  end
  
 end
