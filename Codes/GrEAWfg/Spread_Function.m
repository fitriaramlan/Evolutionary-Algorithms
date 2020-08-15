function spread = Spread_Function(PF, truePF)

%STEP 1. Obtain the maximum and minimum values of the Pareto front
m1 = size(PF, 1);
m = size(truePF, 1);
maxVals = max(truePF);
minVals = min(truePF);

%STEP 2. Get the normalized front
normalizedPF = (PF - repmat(minVals, m1, 1)) ./ repmat(maxVals - minVals, m1, 1);
normalizedTruePF = (truePF - repmat(minVals, m, 1)) ./ repmat(maxVals - minVals, m, 1);

%STEP 3. Sort normalizedFront and normalizedParetoFront;
normalizedPF = sortrows(normalizedPF);
normalizedTruePF = sortrows(normalizedTruePF);

%STEP 4. Compute df and dl (See specifications in Deb's description of the metric)
diff = normalizedPF(1, :) - normalizedTruePF(1, :);
df = sqrt(sum(diff.^2, 2));
diff = normalizedPF(m1, :) - normalizedTruePF(m, :);
dl = sqrt(sum(diff.^2, 2));

%STEP 5. Calculate the mean of distances between points i and (i - 1). (the poins are in lexicografical order)
diff = normalizedPF(1:m1-1,:) - normalizedPF(2:m1,:);
distNears = sqrt(sum(diff.^2, 2));
meanVal = mean(distNears);

%STEP 6. If there are more than a single point, continue computing the metric. In other case, return the worse value (1.0, see metric's description).
if m1 > 1
    diversitySum = sum(abs(distNears - repmat(meanVal, m1-1, 1)));
    spread = (df +dl + diversitySum) / (df + dl + (m1-1) * meanVal);
else
    spread = 1.0;
end

end