% The code of NSGA-II accomplished on MATLAB

clc;format compact;tic;

%-----------------------------------------------------------------------------------------
% Problem Selection and Problem Paramaters
for testNo = 8 : 9
    
    for M = 4 : 2 : 10  % number of objectives
        
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
        
        Runs = 10;
        
        l =  10;
        D = k + l;
        
        MinValue   = zeros(1,D);
        MaxValue   = ones(1,D);
        
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
            %   FunctionValue                 = F_DTLZ(Population,Problem,M,K);     % calculate the objective function values
            F                             = wfg(Population, M, k, l, testNo);
            z = min([z;F],[],1);
            
            for i=1:N
                
                g(i) = DecomposedCost(F(i,:),z,sp(i).lambda);
                
            end
            
            FrontValue = ENS_SS (F);
            
            at = find(FrontValue==1);
            EP = Population(at,:);
            EF = F(at,:);
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
                    
                    %   yc = F_DTLZ(y,Problem,M,K);
                    
                    yc = wfg(y, M, k, l, testNo);
                    
                    z = min([z;yc],[],1);
                    
                    for j = sp(i).Neighbors
                        yg = DecomposedCost(yc,z,sp(j).lambda);
                        if yg <= g(j)
                            Population(j,:) = y;
                            F(j,:) = yc;
                            g(j) = yg;
                        end
                    end
                    
                end
                
                % Determine Population Domination Status
                FrontValue1 = ENS_SS(F);
                
                ad = find(FrontValue1==1);
                
                ndpop = Population(ad,:);
                ndf   = F(ad,:);
                
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
            
            F_output(Population,toc,'MOEAD_wfg',testNo,M,k,l,run);
            
        end
        
        
        
    end
    
end
