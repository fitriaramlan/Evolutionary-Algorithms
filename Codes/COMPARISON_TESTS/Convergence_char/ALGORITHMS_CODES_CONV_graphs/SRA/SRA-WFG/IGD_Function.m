function IGD = IGD_Function(PF, truePF)

q = 2; %the parameter of IGD
%STEP 1. Obtain the maximum and minimum values of the Pareto front
m1 = size(PF, 1);
m = size(truePF, 1);
maxVals = max(truePF);
minVals = min(truePF);

%STEP 2. Get the normalized front
normalizedPF = (PF - repmat(minVals, m1, 1)) ./ repmat(maxVals - minVals, m1, 1);
normalizedTruePF = (truePF - repmat(minVals, m, 1)) ./ repmat(maxVals - minVals, m, 1);

%STEP 3. Sum the distances between each point of the front and the nearest point in the true Pareto front
IGD = 0;
for i = 1:m
    diff = repmat(normalizedTruePF(i,:), m1, 1) - normalizedPF;
    dist = sqrt(sum(diff.^2, 2));         
    IGD = IGD + min(dist)^q;
end
IGD = IGD^(1.0/q)/m;

end