function [w] = Soru3(a,b,c,d,n,m)

h = ...;                          % Doldurunuz (n, x için aralik sayisidir)
k = ...;                          % Doldurunuz (m, y için aralik sayisidir)

f = @(x,y) ...;                   % Doldurunuz
gxa = @(x,y) ...;                 % Doldurunuz             % x=a
gxb = @(x,y) ...;                 % Doldurunuz             % x=b
gyc = @(x,y) ...;                 % Doldurunuz             % y=c
gyd = @(x,y) ...;                 % Doldurunuz             % y=d

x = ...;                          % Doldurunuz
y = ...;                          % Doldurunuz

lambda = (h^2)/(k^2);
mu = 2*(1+lambda);

% Katsayilar matrisinin parçalari

A = zeros(m-1,m-1);
B = zeros(m-1,m-1);

for i = 1:m-2
    A(i,i+1) = -lambda;
    A(i+1,i) = -lambda;
    A(i,i) = mu; 
end
A(m-1,m-1) = mu;

for i = 1:m-1
    B(i,i) = -1;
end

% Katsayilar matrisi

K = zeros((m-1)*(n-1), (m-1)*(n-1));

K(1:m-1,1:2*(m-1)) = [A,B];

for i = 1:n-3
    
    K(1+(m-1)*i:(m-1)*(i+1), 1+(m-1)*(i-1):(m-1)*(i+2))  = [B,A,B];
    
end

    K(1+(m-1)*(n-2):(m-1)*(n-1), 1+(m-1)*(n-3):(m-1)*(n-1)) = [B,A];
    
% Sag taraf vektörü
    
F = zeros((m-1)*(n-1),1);    

F(1,1) = -(h^2)*f(x(2),y(2)) + gxa(a,y(2)) + lambda*gyc(x(2),c);

for j = 2:m-2
    F(j,1) = -(h^2)*f(x(2),y(j+1)) + gxa(a,y(j+1)); 
end

F(m-1,1) = -(h^2)*f(x(2),y(m)) + gxa(a,y(m)) + lambda*gyd(x(2),d);

for i = 3:n-1
    F((m-1)*(i-2)+1,1) = -(h^2)*f(x(i),y(2)) + lambda*gyc(x(i),c);
    F((m-1)*(i-1),1) = -(h^2)*f(x(i),y(m)) + lambda*gyd(x(i),d);
    for j = 3:m-1
        F((m-1)*(i-2)+j-1,1) = -(h^2)*f(x(i),y(j));
    end
end

F((m-1)*(n-2)+1,1) = -(h^2)*f(x(n),y(2)) + gxb(b,y(2)) + lambda*gyc(x(n),c);
 
 for j = 2:m-2
     F((m-1)*(n-2)+j,1) = -(h^2)*f(x(n),y(j+1)) + gxb(b,y(j+1));
 end
 
 F((m-1)*(n-1),1) = -(h^2)*f(x(n),y(m)) + gxb(b,y(m)) + lambda*gyd(x(n),d);
 
 
 % Bilinmeyen vektörü
 
 w = K\F;
 

 
    
    
    










