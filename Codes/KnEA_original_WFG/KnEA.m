function KnEA()
% Knee point driven evolutionary algorithm for many-objective optimization
% (KnEA), TEVC, 2014
% Xingyi Zhang, Ye Tian and Yaochu Jin
% Copyright 2015 BIMK Group, Written by Ye Tian

for run = 1 :30
    
    clc;format compact;tic;
    %-----------------------------------------------------------------------------------------
    % Parameters setting
    for testNo = 1:9
        
        for M = 4 : 2 : 10 % number of objectives
            
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
                
                rate = 0.6;             % the ratio of knee points
                
            elseif M == 4
                
                N = 120;
                
                k  =  6;
                
                rate = 0.5;
                
            elseif M == 6
                
                N = 132;
                
                k  =  10;
                
                rate = 0.5;
                
            elseif M == 8
                
                N = 156;
                
                k  =  7;
                
                rate = 0.5;
                
            elseif M == 10
                
                N = 275;
                
                k  =  9;
                
                rate = 0.5;
                
            end
            
            
            l =  10;
            D = k + l;
            
            MinValue   = zeros(1,D);
            MaxValue   = ones(1,D);
            Boundary = [MaxValue;MinValue];
            
            
            r    = zeros(1,2*N)-1;	% parameter r for each front
            t    = zeros(1,2*N)-1; 	% parameter t for each front
            %-----------------------------------------------------------------------------------------
            % Initialization
            Population             = rand(N,D); % initial population
            keyboard
            F                      = wfg(Population, M, k, l, testNo);  
            keyboard% calculate the objective function values
            FrontValue             = ENS(F,'all');                 % non-dominated sort using A-ENS
            KneePoint              = zeros(1,N);                                 % whether a solution is a knee point
            %-----------------------------------------------------------------------------------------
            % Main iterations
            for Gene = 1 : Generations
                % generate offsprings
                MatingPool    = F_mating(Population,F,FrontValue,KneePoint);% mating selection
                Offspring     = F_operator(MatingPool,Boundary);                        % generate offsprings
                Population    = [Population;Offspring];                                 % recombination
                F             = wfg(Population, M, k, l, testNo);             % calculate the objective values
                
                % environmental selection
                [FrontValue,MaxFront]    = ENS(F,'half');                          	% non-dominated sort (only the first half)
                [KneePoint,Distance,r,t] = F_kneepoint(F,FrontValue,MaxFront,r,t,rate);	% finding knee point
                Next = F_choose(F,FrontValue,MaxFront,KneePoint,Distance,N);            % environmental selection
                
                % population for next generation
                Population    = Population(Next,:);     % solutions on decision space
                F             = F(Next,:);  % solutions on objective space
                FrontValue    = FrontValue(Next);       % the front number of each solution
                KneePoint     = KneePoint(Next);        % whether a solution is a knee point
                
                clc;fprintf('KnEA with A-ENS on %5s with %2s-objective, %4s%% completed, %5s seconds past ... ...\n',testNo,num2str(M),num2str(roundn(Gene/Generations*100,-1)),num2str(roundn(toc,-2)));
            end
            %-----------------------------------------------------------------------------------------
            % Result saving
            F_output(Population,toc,'KnEA',testNo,M,k,l,run);
        end
    end
end
