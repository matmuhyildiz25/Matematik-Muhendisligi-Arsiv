
%Sayfa 745 Soru 7 b) 

function [w] = soru7b(h,k,L,T,alpha)

% Uyarý: Buradaki L sorudaki L sabiti deðildir. Hattýn uzunluðudur. 

gx0 = @(x,t) 0.9;         % x=0           % Doldurunuz
r = @(x,t) 0;         % x=l           % Doldurunuz
gt0 = @(x,t) 0.9*cos(2*pi*x);         % t=0           % Doldurunuz
g = @(x,t) 0;           % du/dt=g       % Doldurunuz

x = 0:h:L;                                  % Doldurunuz
t = 0:k:T;                                  % Doldurunuz

m = round(L/h);                                  % Doldurunuz
n = round(T/k);                                  % Doldurunuz


lambda = (alpha*k)/h;

% sinir kosullari

for j = 1:n+1
    w(1,j) = gx0(0,t(j));
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

for j = 2:n
    for i = 2:m
        w(i,j+1) = 2*(1-lambda^2)*w(i,j) + (lambda^2)*(w(i+1,j) + w(i-1,j)) - w(i,j-1);
    end
    w(m+1,j+1) = w(m,j+1) + h*r(x(m+1),t(j+1)); 
end

surf(x,t,w);

