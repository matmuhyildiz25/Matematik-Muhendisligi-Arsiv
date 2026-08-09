function [w] = ParabolikGeriFark(L,T,m,n,alpha)

fx0 = @(x,t) ...;
fxL = @(x,t) ...;
ft0 = @(x,t) ...;

h = L/m;
k = T/n;

x = 0:h:L;
t = 0:k:T;

lambda = (alpha^2)*k/(h^2);
mu = 1+2*lambda;

% A ve B matrisleri hesabý

for i = 1:m-1
    A(i,i) = mu;
end

for i = 1:m-2
    A(i,i+1) = -lambda;
    A(i+1,i) = -lambda;
end

for i = 1:m-1
    B(i,i) = -1;
end

% K katsayýlar matrisi

for i = 1:n
    K((m-1)*(i-1)+1:(m-1)*i,(m-1)*(i-1)+1:(m-1)*i) = A; 
end

for i = 1:n-1
    K((m-1)*i+1:(m-1)*(i+1),(m-1)*(i-1)+1:(m-1)*i) = B; 
end

% Sað taraf vektörü F

F(1,1) = ft0(x(2),0) + lambda*fx0(0,t(2));

for i = 2:m-2
    F(i,1) = ft0(x(i+1),0);
end

F(m-1,1) = ft0(x(m),0) + lambda*fxL(L,t(2));

for j = 3:n+1
    F((m-1)*(j-2)+1,1) = lambda*fx0(0,t(j));
    F((m-1)*(j-1),1) = lambda*fxL(L,t(j));
end

% Bilinmeyenler vektörü

ww = K\F;

for j = 1:n+1
    w(1,j) = fx0(0,t(j));
    w(m+1,j) = fxL(L,t(j));
end

for i = 1:m+1
    w(i,1) = ft0(x(i),0);
end

for j = 2:n+1
   for i = 2:m
       w(i,j) = ww(i-1 + (j-2)*(m-1),1);
   end
end














