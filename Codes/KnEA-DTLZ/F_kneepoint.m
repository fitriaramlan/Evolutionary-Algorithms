function [KneePoint,Distance,r,t] = F_kneepoint(FunctionValue,FrontValue,MaxFront,r,t,rate)
% This function finds all the knee points in each front

    [N,M] = size(FunctionValue);

    % the flag tells that each solution is knee point or not
    KneePoint = false(1,N);
    % the distance between each solution and the hyperplane
    Distance = zeros(1,N);
    % choose the knee points in one front in each iteration 
    for i = 1 : MaxFront
        % the solutions in front 'i'
        Temp = find(FrontValue==i);
        if length(Temp) <= M
            % if the number of solutions is less than the number of
            % objectives, they will all be knee points
            KneePoint(Temp) = 1;
        else
            % choose the extreme solutions (M different solutions must be
            % choosed)
            [null,Rank] = sort(FunctionValue(Temp,:),'descend');
            Extreme = zeros(1,M);
            Extreme(1) = Rank(1,1);
            for j = 2 : length(Extreme)
                k = 1;
                Extreme(j) = Rank(k,j);
                while ismember(Extreme(j),Extreme(1:j-1))
                    k = k+1;
                    Extreme(j) = Rank(k,j);
                end
            end
            % calculate the hyperplane
            Hyperplane = FunctionValue(Temp(Extreme),:)\ones(length(Extreme),1);
            % calculate the distances between solutions and the hyperplane
            Distance(Temp) = -(FunctionValue(Temp,:)*Hyperplane-1)./sqrt(sum(Hyperplane.^2));
            % update the parameter r, and calculate R
            Fmax = max(FunctionValue(Temp,:),[],1);
            Fmin = min(FunctionValue(Temp,:),[],1);
            if t(i) == -1
                r(i) = 1;
            else
                r(i) = r(i)/exp((1-t(i)/rate)/M);
            end
            % find knee points
            R = (Fmax-Fmin).*r(i);
            [null,Rank] = sort(Distance(Temp),'descend');
            Choose = zeros(1,length(Rank));
            Remain = ones(1,length(Rank));
            for j = Rank
                if Remain(j)
                    for k = 1 : length(Temp)     
                        if abs(FunctionValue(Temp(j),:)-FunctionValue(Temp(k),:)) <= R
                            Remain(k) = 0;
                        end
                    end
                    Choose(j) = 1;
                end
            end
            Choose(Rank(find(Choose(Rank)==1,1,'last'))) = 0;
            KneePoint(Temp(Choose==1)) = 1;
            % update the parameter t
            t(i) = sum(Choose)/length(Temp);
        end
    end
end

