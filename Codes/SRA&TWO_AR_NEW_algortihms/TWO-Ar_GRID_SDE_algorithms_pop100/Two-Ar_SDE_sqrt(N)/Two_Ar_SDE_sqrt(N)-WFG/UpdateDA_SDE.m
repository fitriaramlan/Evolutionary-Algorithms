function [DAp,DAo] = UpdateDA_SDE(DAp,DAo,Newp,Newo,MaxSize,p)

% Update DA: using SDE instaed of Lp-norm
%SDE IN UPDATE DA:


FunctionValue = [DAo;Newo];
Population = [DAp;Newp];
[N,M] = size(FunctionValue);
PopObj = FunctionValue;
 
fmax   = repmat(max(PopObj,[],1),N,1);
fmin   = repmat(min(PopObj,[],1),N,1);
PopObj = (PopObj-fmin)./(fmax-fmin);

 
 
 %SRA ISDE indicator %%%    Compute indicator values of I2 (SDE)
 Distance = inf(N);
 for i = 1 : N
     SPopObj = max(PopObj,repmat(PopObj(i,:),N,1));
     for j = 1 : i-1
         Distance(i,j) = (norm(PopObj(i,:)-SPopObj(j,:)))/M;
     end
 end
 
 %Distance is 100* 100 matrix
 %I2 = min(Distance,[],2);
 %DistanceValue = min(Distance,[],2);% oroginal SDE indicator
  DistanceValue = Distance(:,ceil(sqrt(N)));


[~,rank]   = sort(DistanceValue,'descend');% sort these solutions according to their crowding-distance va
if N <= MaxSize
    
    DAp = Population;
    DAo = FunctionValue;
   
else
 % next population
  DAp       = Population(rank(1:MaxSize),:);         	% next population
  DAo       = FunctionValue(rank(1:MaxSize),:);
end
end
 %


%     %% Find the non-dominated solutions- two archive -org form here
%     %M = size(FunctionValue);
%     DAp = [DAp;Newp];
%     DAo = [DAo;Newo];
%     ND = NDSort(DAo,1);
%     DAp = DAp(ND==1,:);
%     DAo = DAo(ND==1,:);
%     N  = size(DAp,1);
%     if N <= MaxSize
%         return;
%     end
%     
%     %% Select the extreme solutions first
%     Choose = false(1,N);
%     [~,Extreme1] = min(DAo,[],1);
%     [~,Extreme2] = max(DAo,[],1);
%     Choose(Extreme1) = true;
%     Choose(Extreme2) = true;
%     
%     %% Delete or add solutions to make a total of K solutions be chosen by truncation
%     if sum(Choose) > MaxSize
%         % Randomly delete several solutions
%         Choosed = find(Choose);
%         k = randperm(sum(Choose),sum(Choose)-MaxSize);
%         Choose(Choosed(k)) = false;
%     elseif sum(Choose) < MaxSize
%         % Add several solutions by truncation strategy
%         Distance = inf(N);
%         %%
%         for i = 1 : N
%             SPopObj = max(DAo,repmat(DAo(i,:),N,1));
%             for j = 1 : i-1
%                 Distance(i,j) = (norm(DAo(i,:)-SPopObj(j,:)))/M;
%             end
%         end
%         %%
%  %I2 = min(Distance,[],2);
%  DistanceValue = min(Distance,[],2);
% %         for i = 1 : N-1
% %             for j = i+1 : N
% %                 Distance(i,j) = norm(DAo(i,:) - DAo(j,:),p);
% %                 Distance(j,i) = Distance(i,j);
% %             end
% %         end
%         while sum(Choose) < MaxSize
%             Remain = find(~Choose);
%             [~,x]  = max(min(DistanceValue(~Choose,Choose),[],2));
%             Choose(Remain(x)) = true;
%         end
%     end
%     DAp = DAp(Choose,:);
%     DAo = DAo(Choose,:);
%    
% end