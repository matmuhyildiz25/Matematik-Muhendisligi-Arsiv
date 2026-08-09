


function [w,uA, MutlakHata, Table] = hyperbolic(h,k,L,T,alpha)

gx0 = @(x,t) 0;           % x=0
gxL = @(x,t) 0;           % x=l
gt0 = @(x,t) sin(2*pi*x);          % t=0
g = @(x,t) 2*pi*sin(2*pi*x);             % du/dt=g

x = 0:h:L;
t = 0:k:T;

m = L/h;
n = T/k;


lambda = (alpha*k)/h;

% sinir kosullari

for j = 1:n+1
    w(1,j) = gx0(0,t(j));
    w(m+1,j) = gxL(L,t(j));
end

% baslangic kosullari

for i = 1:m+1
    w(i,1) = gt0(x(i),0);
end

% turevli kosul

for i = 2:m
    w(i,2) = w(i,1) + k*g(x(i),t(1));
end

% sonlu fark formulunden

for j = 2:n+1
    for i = 2:m
        w(i,j+1) = 2*(1-lambda^2)*w(i,j) + (lambda^2)*(w(i+1,j) + w(i-1,j)) - w(i,j-1);
    end
end

% Analitik çözüm

[TT,X] = meshgrid(t,x);

uA = sin(2*pi*X).*(cos(2*pi*TT)+sin(2*pi*TT));

MutlakHata = abs(uA-w);

Table = [x',w(:,end),uA(:,end), MutlakHata(:,end)];


