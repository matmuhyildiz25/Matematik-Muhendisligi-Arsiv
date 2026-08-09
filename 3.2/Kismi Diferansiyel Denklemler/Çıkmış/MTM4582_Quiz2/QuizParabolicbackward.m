function [w,wson,uA] = QuizParabolicbackward(k,h,l,T,alpha)

m = l/h;
n = T/k;
 
gt0 = @(x,t) ...;            % Doldurunuz      % x=0
gtl = @(x,t) ...;            % Doldurunuz      % x=l
gx0 = @(x,t) ...;            % Doldurunuz      % t=0

x = ... ;                    % Doldurunuz
t = ... ;                    % Doldurunuz

lambda = (alpha^2)*(k/(h^2));
mu = 1+2*lambda;

% Katsayilar matrisinin parçalari

A = zeros(m-1,m-1);
B = zeros(m-1,m-1);

for i = 1:m-2
    A(i,i+1) = -lambda;
    A(i+1,i) = -lambda;
    A(i,i) = mu; 
end
A(m-1,m-1) = mu;

for i = 1:m-1
    B(i,i) = -1;
end

% Katsayilar matrisi


K = zeros((m-1)*n, (m-1)*n);

for i = 1:n
    
    K(1+(m-1)*(i-1):(m-1)*i, 1+(m-1)*(i-1):(m-1)*i) = A; 
    
end

for i=1:n-1
    
    K(1+(m-1)*i:(m-1)*(i+1), 1+(m-1)*(i-1):(m-1)*i) = B;
    
end

F = zeros(n*(m-1),1);

F(1,1) = gx0(x(2),0) + lambda*gt0(0,t(2));
F(m-1,1) = gx0(x(m),0) + lambda*gtl(0,t(2));

for i = 2:m-1
    
    F(i,1) = gx0(x(i+1),0);
    
end

for j = 3:n+1
    
    F((m-1)*(j-2)+1,1) = lambda*gt0(0,t(j));
    F((m-1)*(j-1),1) = lambda*gtl(0,t(j));
    
end
 
 % Bilinmeyen vektörü
 
 w = K\F;
 
 wson = w((m-1)*(n-1)+1:(m-1)*n,1);
 
% Analitik

[T,X] = meshgrid(t,x);

uA = ...;                      % Doldurunuz    % .* unutmayýnýz
    










