function [w,ww,yA,MutlakHata] = Soru2(a,b,alpha,beta,N)

p = @(x) ...;
q = @(x) ...;
r = @(x) ...;

h = (b-a)/N;

x = a:h:b;

w(1,1) = alpha;
w(N+1,1) = beta; 

% Katsayilar matrisi

for i = 1:N-1
    A(i,i) = 2 + (h^2)*q(x(i+1));
end

for i = 1:N-2
    A(i+1,i) = (-1-(h/2)*p(x(i+2)));
    A(i,i+1) = (-1+(h/2)*p(x(i+1)));
end

% Karsi taraf vektörü

B(1,1) = -(h^2)*r(x(2)) + (1 + (h/2)*p(x(2)))*alpha;
B(N-1,1) = -(h^2)*r(x(N)) + (1 - (h/2)*p(x(N)))*beta;

for i = 2:N-2
    B(i,1) = -(h^2)*r(x(i+1));
end

% Bilinmeyenler vektörü

ww = A\B;

for i = 2:N
    w(i,1) = ww(i-1);
end

% Analitik çözüm

yA = ...;

MutlakHata = abs(yA - w');












