
function [w, uA] = Question4(h,k,L,T,alpha)


gx0 = @(x,t) ...;         % x=0           % Doldurunuz
gxL = @(x,t) ...;         % x=L           % Doldurunuz
gt0 = @(x,t) ...;         % t=0           % Doldurunuz
g = @(x,t) ...;           % du/dt=g       % Doldurunuz

x = ...;                                  % Doldurunuz
t = ...;                                  % Doldurunuz

m = ...;                                  % Doldurunuz
n = ...;                                  % Doldurunuz


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

for j = 2:n
    for i = 2:m
        w(i,j+1) = 2*(1-lambda^2)*w(i,j) + (lambda^2)*(w(i+1,j) + w(i-1,j)) - w(i,j-1);
    end
end

% Analitik çözüm

[T,X] = meshgrid(t,x);

uA = ...;                % Doldurunuz. 




