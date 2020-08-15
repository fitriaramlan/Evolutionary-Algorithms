function Choose = F_choose(FunctionValue,FrontValue,MaxFront,KneePoint,Distance,N)
% This function is used for the environmental selection
    
    % the solutions which are chosen for next generation
    Choose = false(1,size(FunctionValue,1));
    % all solutions in the first several fronts are chosen
    Choose(FrontValue<MaxFront) = 1;
    % all the knee points are chosen
    Choose(KneePoint) = 1;
    if sum(Choose) < N
        % choose some other solutions from the last front if the number of
        % chosen solutions is less than N
        Temp = find(FrontValue==MaxFront & KneePoint==0);        
        [null,Rank] = sort(Distance(Temp),'descend');
        Choose(Temp(Rank(1:(N-sum(Choose))))) = 1;
    elseif sum(Choose) > N
        % delete some chosen solutions if the number of chosen solutions is
        % more than N
        Temp = find(FrontValue==MaxFront & KneePoint==1);        
        [null,Rank] = sort(Distance(Temp));
        Choose(Temp(Rank(1:(sum(Choose)-N)))) = 0;       
    end
end

