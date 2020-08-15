function DistanceValue = F_distance(FunctionValue,M,w)
% Function <F_distance> calculates the crowding-distance of the solutions
% in each front
% Copyright 2014 BCMA Group in Anhui University
% Written by Ye Tian

    [N,M] = size(FunctionValue);
    PopObj = FunctionValue;
%%  sumof OBJECTIVE
 
    fmax   = repmat(max(PopObj,[],1),N,1);
    fmin   = repmat(min(PopObj,[],1),N,1);
    PopObj = (PopObj-fmin)./(fmax-fmin);
 
%     fpr    = w*PopObj';
%     fpr    = sum(fpr',2);
%     %fpr    = mean(PopObj,2);% original ISDE+- equal weight vecotrs line
%    [~,rank] = sort(fpr);      %org isde+
   
   % finding function Value and SOB for the each weight vector
   fpr     = mean(PopObj,2);
   [~,rank] = sort(fpr);% equal weight vector pop,sob
   fpr1    = w(1,:)*PopObj';   %W(1,:)= rand vector-1:- pop1& sob1
   fpr1    = sum(fpr1',2);
   [~,rank1] = sort(fpr1);
   fpr2    = w(2,:)*PopObj';   %rand vector-2:- pop2& sob2
   fpr2    = sum(fpr2',2);
   [~,rank2] = sort(fpr2);
   fpr3    = w(3,:)*PopObj';   %rand vector-3:- pop3& sob3
   fpr3    = sum(fpr3',2);
   [~,rank3] = sort(fpr3);
   fpr4    = w(4,:)*PopObj';   %rand vector-4:- pop4& sob4
   fpr4    = sum(fpr4',2);
   [~,rank4] = sort(fpr4);
   
  
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    DistanceValue = zeros(1,N); 
    DistanceValue1 = zeros(1,N);
    DistanceValue2 = zeros(1,N);
    DistanceValue3 = zeros(1,N);
    DistanceValue4 = zeros(1,N);
    % the crowding-distance of each solution

%% org ISDE+ calculation
    for j = 2 : N

        SFunctionValue = max(PopObj(rank(1:j-1),:),repmat(PopObj(rank(j),:),(j-1),1));
        
        Distance = inf(1,j-1);
            
        for i = 1 : (j-1)
            Distance(i) = norm(SFunctionValue(i,:)-PopObj(rank(j),:))/M;
        end
           
        Distance = min(Distance);
        
        DistanceValue(rank(j)) = exp(-Distance);

         
    end

%% extra random vecotrs ISDE+

for j = 2 : N

        SFunctionValue1 = max(PopObj(rank1(1:j-1),:),repmat(PopObj(rank1(j),:),(j-1),1));
        
        Distance1 = inf(1,j-1);
            
        for i = 1 : (j-1)
            Distance1(i) = norm(SFunctionValue1(i,:)-PopObj(rank1(j),:))/M;
        end
           
        Distance1 = min(Distance1);
        
        DistanceValue1(rank1(j)) = exp(-Distance1);

         
end
    for j = 2 : N

        SFunctionValue2 = max(PopObj(rank2(1:j-1),:),repmat(PopObj(rank2(j),:),(j-1),1));
        
        Distance2 = inf(1,j-1);
            
        for i = 1 : (j-1)
            Distance2(i) = norm(SFunctionValue2(i,:)-PopObj(rank2(j),:))/M;
        end
           
        Distance2 = min(Distance2);
        
        DistanceValue2(rank2(j)) = exp(-Distance2);

         
    end
    for j = 2 : N

        SFunctionValue3 = max(PopObj(rank3(1:j-1),:),repmat(PopObj(rank3(j),:),(j-1),1));
        
        Distance3 = inf(1,j-1);
            
        for i = 1 : (j-1)
            Distance3(i) = norm(SFunctionValue3(i,:)-PopObj(rank3(j),:))/M;
        end
           
        Distance3 = min(Distance3);
        
        DistanceValue3(rank3(j)) = exp(-Distance3);

         
    end
     for j = 2 : N

        SFunctionValue4 = max(PopObj(rank4(1:j-1),:),repmat(PopObj(rank4(j),:),(j-1),1));
        
        Distance4 = inf(1,j-1);
            
        for i = 1 : (j-1)
            Distance4(i) = norm(SFunctionValue4(i,:)-PopObj(rank4(j),:))/M;
        end
           
        Distance4 = min(Distance4);
        
        DistanceValue4(rank4(j)) = exp(-Distance4);

         
     end
    
     
     all_Isde = DistanceValue+DistanceValue1+DistanceValue2+DistanceValue3+DistanceValue4;
     DistanceValue = all_Isde./5;
  
keyboard
