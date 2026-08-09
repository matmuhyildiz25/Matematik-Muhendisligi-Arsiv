function [w] = HiperbolikSonluFark(L,T,m,n,alpha)

fx0 = @(x,t) ...;
fxL = @(x,t) ...;
ft0 = @(x,t) ...;
ft1 = @(x,t) ...;

h = L/m;  
k = T/n;

x = 0:h:L;
t = 0:k:T;

for j=1:n+1
    w(1,j) = fx0(0,t(j));
    w(m+1,j) = fxL(m+1,t(j));
end

for i=1:m+1
    w(i,1) = ft0(x(i),0);
end

for i=2:m
    w(i,2) = w(i,1) + k*ft1(x(i),t(1));
end

lambda = alpha*k/h;

for j = 2:n
    for i = 2:m
        w(i,j+1) = 2*(1-lambda^2)*w(i,j) + (lambda^2)*(w(i+1,j) + w(i-1,j)) - w(i,j-1);
    end
end




















