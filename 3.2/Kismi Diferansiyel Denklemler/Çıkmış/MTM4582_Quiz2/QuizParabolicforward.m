function [w,uA, MutlakHata, Table] = QuizParabolicforward(h,k,l,T,alpha)

gt0 = @(x,t) ...;             % Doldurunuz         % x=0
gtl = @(x,t) ...;             % Doldurunuz         % x=l
gx0 = @(x,t) ...;             % Doldurunuz         % t=0

x = ...;                      % Doldurunuz
t = ...;                      % Doldurunuz

n = T/k;
m = l/h;

lambda = ((alpha^2)*k)/(h^2);
mu = 1-2*lambda;

% baslangic ve sinir kosullari

for j = 1:n+1
    w(1,j) = gt0(0,t(j));
    w(m+1,j) = gtl(l,t(j));
end

for i = 1:m+1
    w(i,1) = gx0(x(i),0);
end

for j = 1:n
    for i = 2:m
        w(i,j+1) = mu*w(i,j) + lambda*(w(i+1,j) + w(i-1,j));
    end
end

% Analitik çözüm

[T,X] = meshgrid(t,x);

uA = ...;                       % Doldurunuz   % .* unutmayýnýz

MutlakHata = abs(uA-w);

Table = [x',w(:,end),uA(:,end), MutlakHata(:,end)];


