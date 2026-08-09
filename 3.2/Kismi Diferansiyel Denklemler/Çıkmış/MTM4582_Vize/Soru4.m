function [w,k,yA,MutlakHata] = Soru4(a,b,alpha,beta,N,TOL,M)

f = @(x,Y0,Y1) ...;
fY0 = @(x,Y0,Y1) ...;
fY1 = @(x,Y0,Y1) ...; 

h = (b-a)/N;

x = a:h:b;

% Baþlangýç deðerleri

w(1,1) = alpha;
w(N+1,1) = beta;

for i = 2:N
    w(i,1) = alpha + i*((beta-alpha)/(b-a))*h;
end

k=0;
while 1 
    
    % Jacobian matrisi
    
    for i = 1:N-1 
        J(i,i) = 2 + (h^2)*fY0(x(i+1),w(i+1,1),(w(i+2,1)-w(i,1))/(2*h));
    end
    
    for i = 1:N-2
        J(i+1,i) = -1 - (h/2)*fY1(x(i+2),w(i+2,1),(w(i+3,1)-w(i+1,1))/(2*h));
        J(i,i+1) = -1 - (h/2)*fY1(x(i+1),w(i+1,1),(w(i+2,1)-w(i,1))/(2*h));
    end
    
    % Karþý taraf vektörü
    
    F(1,1) = -2*w(2,1) + w(3,1) - (h^2)*f(x(2),w(2,1),(w(3,1)-w(1,1))/(2*h))+alpha;
    F(N-1,1) = w(N-1,1) - 2*w(N,1) - (h^2)*f(x(N),w(N,1),(w(N+1,1)-w(N-1,1))/(2*h))+beta;
    
    for i = 2:N-2
        F(i,1) = w(i,1) - 2*w(i+1,1) + w(i+2,1) - (h^2)*f(x(i+1),w(i+1,1),(w(i+2,1)-w(i,1))/(2*h));
    end
    
    % DeltaX
    
    DeltaX = zeros(N+1,1);
    DeltaX(2:N,1) = J\F; 
    
    w = w + DeltaX; 
    
    if norm(DeltaX,2) < TOL || k > M
        break;
    end
    
    k=k+1;
end

% Analitik çözüm

yA = ...;

MutlakHata = abs(yA' - w);
    
    
    
    
    
    
    
    
    
    
    