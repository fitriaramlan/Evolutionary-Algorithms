function [fpr ,PRANK] = WSrank(Population,FrontValue,NoF)
    
    [N,M] = size(Population);    

    F = cell(NoF,1); 
    
    rd = 1;
    
    PRANK = inf* ones(N,1);
    
    for i = 1 : NoF
       
      F{i} = find(FrontValue == i);  
      result = [];
      CS = 1 : M;
      for ii = 1:M
        CS1 = circshift(CS,[1,-(ii-1)]);
        PP = Population(F{i},CS1);    
        [~, result(:,ii)] = sortrows(PP);
      end 
      
         
      [~, AAA] = sort(result, 1);
    
       
      PRANK(F{i}(result(1,:))) = 1;

      [~,rank] = sortrows([sum(AAA,2),-sum(AAA <= repmat(mean(AAA,2),1,M),2),std(AAA,0,2)]);
        
   for i = 1 : NoF
       
    fmax   = repmat(max(Population,[],1),N,1);
    fmin   = repmat(min(Population,[],1),N,1);
    PopObj = (Population-fmin)./(fmax-fmin);
    fpr    = sum(Population,2);
   
   end
   
   
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



