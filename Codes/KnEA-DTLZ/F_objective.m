function [Output, Boundary] = F_objective(Operation, Problem, M, Input)
% This function returns the result of operation about the appointed
% instance, including generating initial random population, and calculating
% the value of each objective of each solution in a population

    k = find(~isstrprop(Problem,'digit'),1,'last');
    switch Problem(1:k)
        case 'DTLZ'
            [Output,Boundary] = P_DTLZ(Operation,Problem,M,Input);
        otherwise
            error(['Instance ',Problem,' does not exist.']);
    end
end

function [Output,Boundary] = P_DTLZ(Operation,Problem,M,Input)
    persistent K;
    Boundary = NaN;
    switch Operation
        % Generate initial randomly population
        case 'init'    
            D = M+K-1;
            MaxValue   = ones(1,D);
            MinValue   = zeros(1,D);
            Population = rand(Input,D);
            
            Output   = Population;
            Boundary = [MaxValue;MinValue];
        % Calculate the value of each objective
        case 'value'
            Population    = Input;
            FunctionValue = zeros(size(Population,1),M);
            switch Problem
                case 'DTLZ1'
                   
                    K = 5;
                     g = 100*(K+sum((Population(:,M:end)-0.5).^2 - cos(20.*pi.*(Population(:,M:end)-0.5)),2));
                     FunctionValue(:,1) = 0.5.*prod(Population(:,1:M-1),2).*(1+g);
                     for i = 2 : (M-1)
                        FunctionValue(:,i) = 0.5*prod(Population(:,1:M-i),2).*(1 - Population(:,M-i+1)).*(1 + g);
                     end
                     FunctionValue(:,M) = 0.5*(1 - Population(:,1)).*(1 + g);
                     
                case 'DTLZ2'
                    
                    K = 10;           
                    g = sum((Population(:,M:end)-0.5).^2,2);
                    FunctionValue(:,1) = prod(cos(pi/2*Population(:,1:M-1)),2).*(1 + g);
                    for i = 2 : (M-1)
                      FunctionValue(:,i) = prod(cos(pi/2*Population(:,1:M-i)),2).* sin(pi/2*Population(:,M-i+1)).*(1 + g);
                    end
                    FunctionValue(:,M) =sin(pi/2*Population(:,1)).*(1 + g);
                    
                 case 'DTLZ3'
                      
                     K = 10;
                     g = 100*(K+sum((Population(:,M:end)-0.5).^2 - cos(20.*pi.*(Population(:,M:end)-0.5)),2));
                     FunctionValue(:,1) = prod(cos(pi/2*Population(:,1:M-1)),2).*(1 + g);
                     for i = 2 : (M-1)
                        FunctionValue(:,i) = prod(cos(pi/2*Population(:,1:M-i)),2).* sin(pi/2*Population(:,M-i+1)).*(1 + g);
                      end
                            FunctionValue(:,M) =sin(pi/2*Population(:,1)).*(1 + g);
                     
                 case 'DTLZ4'
                     
                     K = 10;
                     alpha = 100; 
                     g = sum((Population(:,M:end)-0.5).^2,2);
                     FunctionValue(:,1) = prod(cos(pi/2*Population(:,1:M-1).^alpha),2).*(1 + g);
                     for i = 2 : (M-1)
                        FunctionValue(:,i) = prod(cos(pi/2*Population(:,1:M-i).^alpha),2).* sin(pi/2*Population(:,M-i+1).^alpha).*(1 + g);
                     end
                      FunctionValue(:,M) =sin(pi/2*Population(:,1).^alpha).*(1 + g);
                     
                 case 'DTLZ5'    
                     
                     K = 10;
                     g = sum((Population(:,M:end)-0.5).^2,2);
                     theta(:,1) = pi/2*Population(:,1);
                     gr = g(:,ones(1,M-2)); %replicates gr for the multiplication below
                     theta(:,2:M-1) = pi./(4*(1+gr)) .* (1 + 2*gr.*Population(:,2:M-1));
                     FunctionValue(:,1) = prod(cos(theta(:,1:M-1)),2).*(1 + g);
                     for i = 2 : (M-1)
                        FunctionValue(:,i) = prod(cos(theta(:,1:M-i)),2).*sin(theta(:,M-i+1)).*(1 + g);
                     end
                     FunctionValue(:,M) = sin(theta(:,1)).*(1 + g);
                   
                 case 'DTLZ6'
                     
                     K = 10;   
                     g = sum(Population(:,M:end).^(0.1),2);
                     theta(:,1) = pi/2*Population(:,1);
                     gr = g(:,ones(1,M-2)); %replicates gr for the multiplication below
                     theta(:,2:M-1) = pi./(4*(1+gr)) .* (1 + 2*gr.*Population(:,2:M-1));
                     FunctionValue(:,1) = prod(cos(theta(:,1:M-1)),2).*(1 + g);
                     for i = 2 : (M-1)
                            FunctionValue(:,i) = prod(cos(theta(:,1:M-i)),2).*sin(theta(:,M-i+1)).*(1 + g);
                     end
                     FunctionValue(:,M) = sin(theta(:,1)).*(1 + g);
                     
                 case 'DTLZ7'    
                     
                     K = 20;  
                     g = 1 + 9/K *sum(Population(:,M:end),2);
                     FunctionValue(:,1:M-1) = Population(:,1:M-1);
                     gaux = g(:,ones(1,M-1)); %replicates the g function
                     h = M - sum(FunctionValue(:,1:M-1)./(1+gaux).*(1 + sin(3*pi*FunctionValue(:,1:M-1))),2);
                     FunctionValue(:,M) = h.*(1 + g);
                     
                otherwise
                    error(['Instance ',Problem,' does not exist.']);
            end
            Output = FunctionValue;
    end
end