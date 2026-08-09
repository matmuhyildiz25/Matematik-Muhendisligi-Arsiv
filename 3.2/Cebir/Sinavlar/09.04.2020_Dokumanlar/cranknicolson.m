function [w,uA] = cranknicolson(k,h,l,T,alpha)

m = l/h;
n = T/k;
 
gt0 = @(x,t) 0;                  % x=0
gtl = @(x,t) 0;                  % x=l
gx0 = @(x,t) sin(pi*x);          % t=0

x = 0:h:l;
t = 0:k:T;

lambda = (alpha^2)*(k/(h^2));
mu1 = 1+lambda;
mu2 = 1-lambda;

% Katsayilar matrisi

K = zeros(m-1,m-1);

for i = 1:m-2
    K(i,i+1) = -lambda/2;
    K(i+1,i) = -lambda/2;
    K(i,i) = mu1;
end

K(m-1,m-1) = mu1;

F = zeros(m-1,1);

F(1,1) = (lambda/2)*gx0(x(3),0) + mu2*gx0(x(2),0) + (lambda/2)*gx0(x(1),0) ...
    + (lambda/2)*gt0(0,t(2));
F(m-1,1) = (lambda/2)*gx0(x(m+1),0) + mu2*gx0(x(m),0) + (lambda/2)*gx0(x(m-1),0) ...
    + (lambda/2)*gtl(0,t(2));

for i = 3:m-1
    F(i-1,1) = (lambda/2)*gx0(x(i+1),0) + mu2*gx0(x(i),0) + (lambda/2)*gx0(x(i-1),0);
end

w = K\F;

for j = 2:n
    
F = zeros(m-1,1);

F(1,1) = (lambda/2)*w(2,1) + mu2*w(1,1) + (lambda/2)*gt0(0,t(j)) ...
    + (lambda/2)*gt0(0,t(j+1));
F(m-1,1) = (lambda/2)*w(end-1,1) + mu2*w(end,1) + (lambda/2)*gtl(l,t(j)) ...
    + (lambda/2)*gtl(0,t(j+1));

for i = 3:m-1
    F(i-1,1) = (lambda/2)*w(i,1) + mu2*w(i-1,1) + (lambda/2)*w(i-2,1);
end
    
w = K\F;

end

% Analitik

[T,X] = meshgrid(t,x);

uA = exp(-(pi^2)*T).*sin(pi*X);
    
    
    
   