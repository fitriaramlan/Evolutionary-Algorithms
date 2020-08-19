function [FrontNO,MaxFNO] = ENS(FunctionValue,N,Operation)
% This function sorts the population by ENS

    [~,kind] = ismember(Operation,{'all','half','first'});
    [N,M]    = size(FunctionValue);
    FrontNO  = inf(1,N);
    MaxFNO   = 0;
    [FunctionValue,rank] = sortrows(FunctionValue);
    while (kind<=1 && sum(FrontNO<inf)<N) || (kind==2 && sum(FrontNO<inf)<N/2) || (kind==3 && MaxFNO<1)
        MaxFNO = MaxFNO + 1;
        for i = 1 : N
            if FrontNO(i) == inf
                Dominated = false;
                for j = i-1 : -1 : 1
                    if FrontNO(j) == MaxFNO
                        m = 2;
                        while m <= M && FunctionValue(i,m) >= FunctionValue(j,m)
                            m = m + 1;
                        end
                        Dominated = m > M;
                        if Dominated || M == 2
                            break;
                        end
                    end
                end
                if ~Dominated
                    FrontNO(i) = MaxFNO;
                end
            end
        end
    end
    FrontNO(rank) = FrontNO;
end