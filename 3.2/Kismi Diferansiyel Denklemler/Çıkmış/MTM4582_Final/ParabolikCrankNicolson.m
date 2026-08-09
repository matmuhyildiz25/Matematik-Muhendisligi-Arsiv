function [w] = ParabolikCrankNicolson(L,T,m,n,alpha)

fx0 = @(x,t) ...;
fxL = @(x,t) ...;
ft0 = @(x,t) ...;

h = L/m;
k = T/n;

x = 0:h:L;
t = 0:k:T;

lambda = (alpha^2)*k/(h^2);
mu1 = 1 + lambda;
mu2 = 1 - lambda;

for j = 1:n+1
    w(1,j) = fx0(0,t(j));
    w(m+1,j) = fxL(L,t(j));
end

for i = 1:m+1
    w(i,1) = ft0(x(i),0);
end

% Katsayýlar matrisi

for i = 1:m-1
    K(i,i) = mu1;
end

for i = 1:m-2 
    K(i,i+1) = -lambda/2;
    K(i+1,i) = -lambda/2;
end


for j = 1:n
    
    % Sað taraf vektörü F
    
    F(1,1) = (lambda/2)*w(1,j) + mu2*w(2,j) + (lambda/2)*w(3,j) + (lambda/2)*w(1,j+1);
    for i = 2:m-2
        F(i,1) = (lambda/2)*w(i,j) + mu2*w(i+1,j) + (lambda/2)*w(i+2,j);
    end
    F(m-1,1) = (lambda/2)*w(m-1,j) + mu2*w(m,j) + (lambda/2)*w(m+1,j) + (lambda/2)*w(m+1,j+1);
    
    ww = K\F;
    
    for i = 2:m
        w(i,j+1) = ww(i-1,1);
    end
    
end


    
    










