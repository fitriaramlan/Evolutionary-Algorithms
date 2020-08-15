function KnEA()
% Knee point driven evolutionary algorithm for many-objective optimization
% (KnEA), TEVC, 2014
% Xingyi Zhang, Ye Tian and Yaochu Jin
% Copyright 2015 BIMK Group, Written by Ye Tian

format compact;tic;
  
%-----------------------------------------------------------------------------------------
% Parameters setting
for Problem     = [1 3] % test problem
   Problem
    for M =  4:2:10 
        M% number of objectives
        Runs = 10
        for run = 1 :Runs
    if Problem == 1
        
        if M == 2
         
       rate = 0.6;        % the ratio of knee points
        
     elseif M == 4
     
      rate = 0.6;
      
    elseif M == 6
            
      rate = 0.2;
      
    elseif M == 8
             
      rate = 0.1;
      
    elseif M == 10
      
      rate = 0.1;
        
        end
    end
     
     if Problem == 2
        
        if M == 2
         
       rate = 0.6;        % the ratio of knee points
        
     elseif M == 4
     
      rate = 0.5;
      
    elseif M == 6
            
      rate = 0.5;
      
    elseif M == 8
             
      rate = 0.5;
      
    elseif M == 10
      
      rate = 0.5;
        
        end
     end
    
      if Problem == 3
        
        if M == 2
         
       rate = 0.6;        % the ratio of knee points
        
     elseif M == 4
     
      rate = 0.4;
      
    elseif M == 6
            
      rate = 0.2;
      
    elseif M == 8
             
      rate = 0.1;
      
    elseif M == 10
      
      rate = 0.1;
        
        end
      end
       
     if Problem == 4
        
        if M == 2
         
       rate = 0.6;        % the ratio of knee points
        
     elseif M == 4
     
      rate = 0.5;
      
    elseif M == 6
            
      rate = 0.5;
      
    elseif M == 8
             
      rate = 0.5;
      
    elseif M == 10
      
      rate = 0.5;
        
        end
     end
     
     if Problem == 5
        
        if M == 2
         
       rate = 0.6;        % the ratio of knee points
        
     elseif M == 4
     
      rate = 0.5;
      
    elseif M == 6
            
      rate = 0.5;
      
    elseif M == 8
             
      rate = 0.3;
      
    elseif M == 10
      
      rate = 0.3;
        
        end
     end
    
      if Problem == 6
        
        if M == 2
         
       rate = 0.6;        % the ratio of knee points
        
     elseif M == 4
     
      rate = 0.5;
      
    elseif M == 6
            
      rate = 0.4;
      
    elseif M == 8
             
      rate = 0.3;
      
    elseif M == 10
      
      rate = 0.3;
        
        end
      end
   
     if Problem == 7
        
        if M == 2
         
       rate = 0.6;        % the ratio of knee points
        
     elseif M == 4
     
      rate = 0.5;
      
    elseif M == 6
            
      rate = 0.5;
      
    elseif M == 8
             
      rate = 0.5;
      
    elseif M == 10
      
      rate = 0.4;
        
        end
    end
     
    if Problem == 1 % DTLZ1
         
      K = 5;  % the parameter in DTLZ1
              
    elseif Problem == 2 || 3 || 4  
          
      K = 10;  % the parameter in DTLZ2, DTLZ3, DTLZ4,
                
    elseif Problem == 5 || 6 
          
      K = 10;  % the parameter in DTLZ5, DTLZ6  
           
    elseif Problem == 7 % DTLZ7
     
      K = 20;  % the parameter in DTLZ7
            
    end 
    
     
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
        
      N = 275;
      
    end
    
    D = M + K - 1;
    
    MinValue   = zeros(1,D);
    MaxValue   = ones(1,D);
    Boundary = [MaxValue;MinValue];
                   
    r    = zeros(1,2*N)-1;	% parameter r for each front
    t    = zeros(1,2*N)-1; 	% parameter t for each front
%-----------------------------------------------------------------------------------------
% Initialization
    Population            = repmat(MinValue,N,1) + repmat(MaxValue - MinValue,N,1).*rand(N,D); % initial population
    FunctionValue         = F_DTLZ(Population,Problem,M, K);	% calculate the objective values
    FrontValue            = ENS(FunctionValue,'all');                 % non-dominated sort using A-ENS
    KneePoint             = zeros(1,N);                                 % whether a solution is a knee point
%-----------------------------------------------------------------------------------------    
% Main iterations
    for Gene = 1 : Generations       
        % generate offsprings
        MatingPool    = F_mating(Population,FunctionValue,FrontValue,KneePoint);
        % mating selection
        Offspring     = F_operator(MatingPool,Boundary);                        % generate offsprings
        Population    = [Population;Offspring];                                 % recombination
        FunctionValue = F_DTLZ(Population,Problem,M, K) ;             % calculate the objective values 
        
        % environmental selection
        [FrontValue,MaxFront]    = ENS(FunctionValue,'half');                          	% non-dominated sort (only the first half)
        [KneePoint,Distance,r,t] = F_kneepoint(FunctionValue,FrontValue,MaxFront,r,t,rate);	% finding knee point
       
        Next = F_choose(FunctionValue,FrontValue,MaxFront,KneePoint,Distance,N);            % environmental selection
        
        % population for next generation
        Population    = Population(Next,:);     % solutions on decision space
        FunctionValue = FunctionValue(Next,:);  % solutions on objective space
        FrontValue    = FrontValue(Next);       % the front number of each solution
        KneePoint     = KneePoint(Next);        % whether a solution is a knee point
        
        %%
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
        
        save(['D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\ALGORITHMS_CODES_CONV_graphs\KnEA-DTLZ\IGD_GD_DELTA_gen\IGD_GD_DELTA_gen_D' num2str(Problem) '_M' num2str(M) '_run' num2str(run) '.mat'],'result');
        
               
        
        %%
      %  clc;fprintf('KnEA with A-ENS on %5s with %2s-objective, %4s%% completed, %5s seconds past ... ...\n',Problem,num2str(M),num2str(roundn(Gene/Generations*100,-1)),num2str(roundn(toc,-2)));
    end
%-----------------------------------------------------------------------------------------     
% Result saving
  %  F_output(Population,toc,'KnEA-ENSD',Problem,M,K,run);
  %%
 
        end
        %%
         tot=zeros(size(result));
        for r=1:Runs
            eval(['load D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\ALGORITHMS_CODES_CONV_graphs\KnEA-DTLZ\IGD_GD_DELTA_gen\IGD_GD_DELTA_gen_D' num2str(Problem) '_M' num2str(M) '_run' num2str(r) '.mat']);
            tot=tot+result;
           
        end
        FinalMean=tot./Runs;
        eval(['save D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\FINAL_PLOTvalues\KnEA','_', num2str(Problem),'_',num2str(M),'.mat']);
        %save(['D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\FINAL_PLOTvalues\KnEA' num2str(Problem) '_M' num2str(M).mat'],'result');
        
        %%
       % old concatenation method
%         tot=[];
%         for r=1:Runs
%             eval(['load D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\ALGORITHMS_CODES_CONV_graphs\KnEA-DTLZ\IGD_GD_DELTA_gen\IGD_GD_DELTA_gen_D' num2str(Problem) '_M' num2str(M) '_run' num2str(r) '.mat']);
%             tot=[tot;result];
%         end
%         l=length(result)
%        
%         for j=1:l
%             for q=1:Runs-1
%                 T(j,q)=(tot(j,q)+tot(j+l,q)+tot((j+2*l),q)+tot((j+3*l),q)+tot((j+4*l),q))./Runs;
%             end
%         end
       
%         plot(T(:,1),T(:,2));
%         % plot(result(:,1),result(:,2),result(:,1),result(:,3),result(:,1),result(:,4));
%         figure(2)
%         plot(T(:,1),T(:,3));
%         figure(3)
%         plot(T(:,1),T(:,4));
    end
    
end
