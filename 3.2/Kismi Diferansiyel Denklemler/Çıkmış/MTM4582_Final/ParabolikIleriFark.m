function [w] = ParabolikIleriFark(L,T,m,n,alpha)

fx0 = @(x,t) ...;
fxL = @(x,t) ...;
ft0 = @(x,t) ...;

h = L/m;
k = T/n;

x = 0:h:L;
t = 0:k:T;

lambda = (alpha^2)*k/(h^2);
mu = 1-2*lambda;

for j = 1:n+1
    w(1,j) = fx0(0,t(j));
    w(m+1,j) = fxL(L,t(j));
end

for i = 1:m+1
    w(i,1) = ft0(x(i),0);
end

% Ýleri Sonlu Fark iterasyonlarý

for j = 1:n
    for i = 2:m
        
        w(i,j+1) =  mu*w(i,j) + lambda*(w(i+1,j) + w(i-1,j));
        
    end
end


        
        
        
        
        
        
        
        
        
