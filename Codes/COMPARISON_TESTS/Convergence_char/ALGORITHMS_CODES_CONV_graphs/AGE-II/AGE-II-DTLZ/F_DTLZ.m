function FunctionValue = F_DTLZ(Population,Problem,M,K)

if Problem == 1  % DTLZ1
   
  FunctionValue = zeros(size(Population,1),M);
  g = 100*(K+sum((Population(:,M:end)-0.5).^2 - cos(20.*pi.*(Population(:,M:end)-0.5)),2));
  FunctionValue(:,1) = 0.5.*prod(Population(:,1:M-1),2).*(1+g);
  for i = 2 : (M-1)
    FunctionValue(:,i) = 0.5*prod(Population(:,1:M-i),2).*(1 - Population(:,M-i+1)).*(1 + g);
  end
  FunctionValue(:,M) = 0.5*(1 - Population(:,1)).*(1 + g);
  
end

if Problem == 2  % DTLZ2
   
  FunctionValue = zeros(size(Population,1),M);
  g = sum((Population(:,M:end)-0.5).^2,2);
  FunctionValue(:,1) = prod(cos(pi/2*Population(:,1:M-1)),2).*(1 + g);
  for i = 2 : (M-1)
    FunctionValue(:,i) = prod(cos(pi/2*Population(:,1:M-i)),2).* sin(pi/2*Population(:,M-i+1)).*(1 + g);
  end
  FunctionValue(:,M) =sin(pi/2*Population(:,1)).*(1 + g);
  
end

if Problem == 3  % DTLZ3
   
  FunctionValue = zeros(size(Population,1),M);
  g = 100*(K+sum((Population(:,M:end)-0.5).^2 - cos(20.*pi.*(Population(:,M:end)-0.5)),2));
  FunctionValue(:,1) = prod(cos(pi/2*Population(:,1:M-1)),2).*(1 + g);
  for i = 2 : (M-1)
    FunctionValue(:,i) = prod(cos(pi/2*Population(:,1:M-i)),2).* sin(pi/2*Population(:,M-i+1)).*(1 + g);
  end
  FunctionValue(:,M) =sin(pi/2*Population(:,1)).*(1 + g);
  
end

if Problem == 4  % DTLZ4
  
  alpha = 100; 
  FunctionValue = zeros(size(Population,1),M);
  g = sum((Population(:,M:end)-0.5).^2,2);
  FunctionValue(:,1) = prod(cos(pi/2*Population(:,1:M-1).^alpha),2).*(1 + g);
  for i = 2 : (M-1)
    FunctionValue(:,i) = prod(cos(pi/2*Population(:,1:M-i).^alpha),2).* sin(pi/2*Population(:,M-i+1).^alpha).*(1 + g);
  end
  FunctionValue(:,M) =sin(pi/2*Population(:,1).^alpha).*(1 + g);
  
end

if Problem == 5  % DTLZ5
  
  FunctionValue = zeros(size(Population,1),M);
  g = sum((Population(:,M:end)-0.5).^2,2);
  theta(:,1) = pi/2*Population(:,1);
  gr = g(:,ones(1,M-2)); %replicates gr for the multiplication below
  theta(:,2:M-1) = pi./(4*(1+gr)) .* (1 + 2*gr.*Population(:,2:M-1));
  FunctionValue(:,1) = prod(cos(theta(:,1:M-1)),2).*(1 + g);
  for i = 2 : (M-1)
    FunctionValue(:,i) = prod(cos(theta(:,1:M-i)),2).*sin(theta(:,M-i+1)).*(1 + g);
  end
  FunctionValue(:,M) = sin(theta(:,1)).*(1 + g);
  
end

if Problem == 6  % DTLZ6
  
  FunctionValue = zeros(size(Population,1),M);
  g = sum(Population(:,M:end).^(0.1),2);
  theta(:,1) = pi/2*Population(:,1);
  gr = g(:,ones(1,M-2)); %replicates gr for the multiplication below
  theta(:,2:M-1) = pi./(4*(1+gr)) .* (1 + 2*gr.*Population(:,2:M-1));
  FunctionValue(:,1) = prod(cos(theta(:,1:M-1)),2).*(1 + g);
  for i = 2 : (M-1)
    FunctionValue(:,i) = prod(cos(theta(:,1:M-i)),2).*sin(theta(:,M-i+1)).*(1 + g);
  end
  FunctionValue(:,M) = sin(theta(:,1)).*(1 + g);
  
end


if Problem == 7  % DTLZ7
  
  FunctionValue = zeros(size(Population,1),M);
  g = 1 + 9/K *sum(Population(:,M:end),2);
  FunctionValue(:,1:M-1) = Population(:,1:M-1);
  gaux = g(:,ones(1,M-1)); %replicates the g function
  h = M - sum(FunctionValue(:,1:M-1)./(1+gaux).*(1 + sin(3*pi*FunctionValue(:,1:M-1))),2);
  FunctionValue(:,M) = h.*(1 + g);
  
end