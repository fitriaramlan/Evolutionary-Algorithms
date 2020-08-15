% The code of NSGA-II accomplished on MATLAB

clc;format compact;

%-----------------------------------------------------------------------------------------   
    % Problem Selection and Problem Paramaters
 for Problem = 1
    
  for M = 4 : 2 : 10  % number of objectives
    
    if Problem == 1 % DTLZ1
         
      K = 5;  % the parameter in DTLZ1
      filename = ['DTLZ' num2str(Problem) '_M' num2str(M)];
      eval(['load ' filename '.dat']);
      True_PF = eval(filename);
        
    elseif Problem == 2 || 3 || 4  
          
      K = 10;  % the parameter in DTLZ2, DTLZ3, DTLZ4,
      filename = ['DTLZ' num2str(2) '_M' num2str(M)]; % DTLZ2 to DTLZ4 have same True Paretofront
      eval(['load ' filename '.dat']);
      True_PF = eval(filename);
           
    elseif Problem == 5 || 6 
          
      K = 10;  % the parameter in DTLZ5, DTLZ6  
      filename = ['DTLZ' num2str(5) '_M' num2str(M)]; % DTLZ5 and DTLZ6 have same True Paretofront
      eval(['load ' filename '.dat']);
      True_PF = eval(filename);
      
    elseif Problem == 7 % DTLZ7
     
      K = 20;  % the parameter in DTLZ7
      filename = ['DTLZ' num2str(Problem) '_M' num2str(M)]; 
      eval(['load ' filename '.dat']);
      True_PF = eval(filename);
      
    end 
    D = M + K - 1;
    
    MinValue   = zeros(1,D);
    MaxValue   = ones(1,D);
    
    IGD_collection_all   = [];
    HV_collection_all    = [];
    
%-----------------------------------------------------------------------------------------   
    % Algorithm parameters
    
       
    Generations = 250;
      
    
    
    N = 200;
    
    Runs = 10;
    
%-----------------------------------------------------------------------------------------      
  for run = 1 : Runs
         
    % initialize the population
    Population                    = repmat(MinValue,N,1) + repmat(MaxValue - MinValue,N,1).*rand(N,D); % initial population
    FunctionValue                 = F_DTLZ(Population,Problem,M,K);                     % calculate the objective function values
    [FrontValue,DistanceValue]    = SORNS(FunctionValue);           % non-dominated sort, and return the front number of each solution
    
%-----------------------------------------------------------------------------------------      
    % start iterations
    for Gene = 1 : Generations
        
        % generate offspring
        NewPopulation                  = F_generator(Population,MaxValue,MinValue,FrontValue,DistanceValue);
        NewPopulationFunctionValue     = F_DTLZ(NewPopulation,Problem,M,K);              % calculate the objective function values
        Population                     = [Population;NewPopulation];              % combine the two populations
        FunctionValue                  = [FunctionValue;NewPopulationFunctionValue];
        [FrontValue,DistanceValue,NoF] = SORNS(FunctionValue);   

        % choose the solutions in the first several fronts     
        NextPopulation         = zeros(1,N);                              % store the locations of solutions in 'Population' for the next population
        [~,rank]               = sort(DistanceValue,'descend');% sort these solutions according to their crowding-distance values
        NextPopulation(1:N)    = rank(1:N);       % store the solutions with larger crowding-distance values
         
        % next population
        Population       = Population(NextPopulation,:);         	% next population
        FunctionValue    = FunctionValue(NextPopulation,:);
        FrontValue       = FrontValue(NextPopulation);              % the front number of each solution in the next population
        DistanceValue    = DistanceValue(NextPopulation);       	% the crowding-distance values of each solution in the next population
             
        load DTLZ5_M4.dat;
        True_PF = DTLZ5_M4;
        True_PF = (True_PF - repmat(min(True_PF,[],1),size(True_PF,1),1))./repmat(max(True_PF,[],1)-min(True_PF,[],1),size(True_PF,1),1); 
    end
    
%     load DTLZ5_M4.dat;
%     
%     True_PF = DTLZ5_M4;
%     
%     True_PF = (True_PF - repmat(min(True_PF,[],1),size(True_PF,1),1))./repmat(max(True_PF,[],1)-min(True_PF,[],1),size(True_PF,1),1);
    
   % plot(True_PF(:,1),True_PF(:,2),'o')
    
  %  hold on
    
 
    
    
    FunctionValue    = F_DTLZ(Population,Problem,M,K);
    
    FunctionValue = (FunctionValue - repmat(min(FunctionValue,[],1),size(FunctionValue,1),1))./repmat(max(FunctionValue,[],1)-min(FunctionValue,[],1),size(FunctionValue,1),1);
     
    IGD = IGD_Function(FunctionValue,True_PF);
    
   % plot(FunctionValue(:,1),FunctionValue(:,2),'x')
    
    v = Hypervolume(FunctionValue,ones(1,size(FunctionValue,2)),1000000);
    
    IGD_collection_all   = [IGD_collection_all,IGD];
    HV_collection_all    = [HV_collection_all,v];
    
  end
    
    Result.g = [mean(IGD_collection_all,2),std(IGD_collection_all,0,2)];
    Result.h = [mean(HV_collection_all,2),std(HV_collection_all,0,2)];
    
   % save(['C:\Users\MALLIPEDDI\Desktop\NSGA-IIFramework\Result\DTLZ' num2str(Problem) '_M' num2str(M) '.mat'],'-struct', 'Result');
 
  end
  
 end
