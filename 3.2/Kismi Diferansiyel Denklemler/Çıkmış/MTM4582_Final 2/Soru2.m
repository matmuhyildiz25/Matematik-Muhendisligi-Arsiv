


function [w,k,yA,MutlakHata]=Soru2(a,b,alpha,beta,N,TOL,M)

h = ...;                                                  % h tanimlanacak. (N aralik sayisidir.)

f = @(x,Y0,Y1) ...;                                       % f(x,y,y') tanimlanacak.  (Y0 = y, Y1 = y' dür.)         
fY0 = @(x,Y0,Y1) ...;                                     % f in y  ye göre türevi yazilacak                                 
fY1 = @(x,Y0,Y1) ...;                                     % f in y' ne göre türevi yazilacak                                      

x = ...;                                                  % x tanimlanacak

w(1,1)=alpha;                                             % 1. sinir kosulu
w(N+1,1)=beta;                                            % 2. sinir kosulu

for i=1:N-1
        w(i+1,1) = alpha + (i+1)*((beta-alpha)/(b-a))*h;
end

k = 1;
while 1
    
    % Jacobian
    
    J = zeros(N-1,N-1);
    
    for i = 1:N-2
        J(i,i+1) = -1 + (h/2)*fY1(x(i+1),w(i+1,1),(w(i+2,1)-w(i,1))/(2*h));
        J(i+1,i) = -1 - (h/2)*fY1(x(i+2),w(i+2,1),(w(i+3)-w(i+1))/(2*h));
        J(i,i) = 2 + (h^2)*fY0(x(i+1),w(i+1,1),(w(i+2,1)-w(i,1))/(2*h));
    end
    J(N-1,N-1) = 2 + (h^2)*fY0(x(N),w(N,1),(beta-w(N-1,1))/(2*h));
    
    % Jv = Sag taraf vektörü hesabi
    
    b = zeros(N-1,1);
    
    b(1,1) = -2*w(2,1) + w(3,1) - (h^2)*f(x(2),w(2,1),(w(3,1)-w(1,1))/(2*h)) + alpha;
    b(N-1,1) = w(N-1,1) - 2*w(N,1) - (h^2)*f(x(N),w(N,1),(beta-w(N-1,1))/(2*h)) + beta;
    
    for i = 2:N-2
        b(i,1) = w(i,1) - 2*w(i+1,1) + w(i+2,1) - (h^2)*f(x(i+1),w(i+1,1),(w(i+2,1)-w(i,1))/(2*h));
    end
    
    v = J\b;
    
    if norm(v,2)<=TOL || k>M
        break;
    end
    
 for i = 2:N
     w(i,1) = w(i,1) + v(i-1,1);
 end

 k = k+1;
end

 % Analitik çözüm
 
 yA = ...;                           % Analitik çözüm yazilacak.                         
 
 MutlakHata = ...;                   % Mutlak Hata yazilacak. (Dikkat: yA satir vektör fakat w sütun vektördür. Farki buna göre almalisiniz.)
    
    
    
    
    
    