function [FrontValue,SRANKS,PRANK] = WSrank(Population,FrontValue,NoF)
    
    [N,M] = size(Population);   % N = population size, M = number of objectives
    F = cell(N,1);              % the set of fronts
    NoF = 0;   
    
    fmax   = repmat(max(Population,[],1),N,1);
    fmin   = repmat(min(Population,[],1),N,1);
    Population = (Population-fmin)./(fmax-fmin);
    SRANKS = sum(Population,2);
    
   
    
    PRANK = inf* ones(1,N);
    
      
    [~,rank] = sortrows(SRANKS);
   
   
    Front = zeros(N,1);
    I = find(Front == 0);
    NoF = NoF + 1;
    
    while ~isempty(I)
        
      Front(I(1)) = 1;
      F{NoF} = rank(I(1));
       
      for i = 2:length(I) 
            
            for j = 1 : size(F{NoF},2) 
               
                x = 2;
          
                for j2 = 1 : M
                     if Population(rank(I(i)),j2) < Population(F{NoF}(j),j2)
                        x = 0;
                        break;
                    end
                end
                if x == 2 
                    break;
                end
            end
            if x ~= 2   % if F{k} has no solution dominating Population(rank(i))
                Front(I(i)) = 1;	% move Population(rank(i)) to F{k}
                F{NoF} = [F{NoF},rank(I(i))];
            end        % if F{k} has at least one soultion dominating Population(rank(i))
     end
      
    I = find(Front == 0);
    NoF = NoF + 1;   

    end
        
   FrontValue = zeros(1,N) + inf;
    
%     if nargin>1 && strcmp(operation,'half')
%         for i = 1 : NoF
%             if sum(FrontValue ~= inf) > N/2
%                 NoF = i - 1;
%                 break;
%             else
%                 FrontValue(F{i}) = i;
%             end
%         end
%     else
        for i = 1 : NoF
        	FrontValue(F{i}) = i;
        end
%     end
 
 
    rd = 1;
    
  %  PRANK = inf* ones(1,N);
 
    for i = 1 : NoF
        
        if size(F{i},2)  <= M
            
            PRANK(F{i}) = rd;
            
        else
                                    

           Distance = zeros(size(F{i},2));
    
           for ii = 1 : (size(F{i},2) - 1)
                 for jj = (i + 1) : size(F{i},2)
                     Distance(ii,jj) = norm(Population(F{i}(ii),:)-Population(F{i}(jj),:));
                     Distance(jj,ii) = Distance(ii,jj); 
                 end
           end
    
           R = mean(mean(Distance,1),2);
           
                   
            Choose = zeros(1,size(F{i},2));
            Remain = ones(1,size(F{i},2));
            XA = length(find(Choose == 0));
            while XA
             for j = 1 : size(F{i},2)
                if Remain(j)
                    for k = 1 : size(F{i},2)    
                        if norm(Population(F{i}(j),:)-Population(F{i}(k),:)) <= R
                            Remain(k) = 0;
                        end
                    end
                    Choose(j) = rd;
                end
            end
            rd = rd + 1;
            XA = length(find(Choose == 0));
            Remain(find(Choose==0)) = 1;
            R = R/2;
           end
                   
           PRANK(F{i}) = Choose;
           
        end
    end



