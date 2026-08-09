
function [w,k,yA,MutlakHata]=soru2(a,b,alpha,beta,N,TOL,M)

% N aralik sayisidir. a ve b sinirlar, alpha ve beta sinir kosullaridir. 

h = ...;                           % Doldurunuz

f = @(x,Y0,Y1) ...;                % f(x,y,y') tanimlanacak.                 % Doldurunuz          
fY0 = @(x,Y0,Y1) ...;              % f in y  ye göre türevi yazilacak        % Doldurunuz                             
fY1 = @(x,Y0,Y1) ...;              % f in y' ne göre türevi yazilacak        % Doldurunuz                               

x = ...;     % Doldurunuz

w(1,1)=alpha;
w(N+1,1)=beta;

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

% Analitik Cozum

yA = ...;            % Doldurunuz

MutlakHata = ...;    % Doldurunuz 
    
    
    
    
    
    