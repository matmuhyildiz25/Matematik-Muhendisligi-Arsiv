function [w,uA,MutlakHata] = Soru3(a,b,c,d,n,m)

f = @(x,y) ....;
fxa = @(x,y) ...;
fxb = @(x,y) ...;
fyc = @(x,y) ...;
fyd = @(x,y) ...;

h = (b-a)/n;
k = (d-c)/m;

x = a:h:b;
y = c:k:d;

lambda = (h^2)/(k^2);
mu = 2*(1+lambda);

% Katsayilar matrisi

   % A ve B matrisleri hesabý

for i = 1:m-1
    
    A(i,i) = mu;
    
end

for i = 1:m-2
    
    A(i,i+1) = -lambda;
    A(i+1,i) = -lambda;
    
end

for i = 1:m-1
    
    B(i,i) = -1;
    
end

   % K matrisi
   
K(1:m-1,1:2*(m-1))=[A,B];

for i = 1:n-3
    
    K((m-1)*i + 1:(m-1)*(i+1), (m-1)*(i-1) + 1:(m-1)*(i+2)) = [B,A,B];
    
end

K((n-2)*(m-1) + 1:(m-1)*(n-1), (n-3)*(m-1) + 1:(m-1)*(n-1)) = [B,A];

% Sað taraf vektörü F hesabý

F(1,1) = -(h^2)*f(x(2),y(2)) + fxa(a,y(2)) + lambda*fyc(x(2),c);

for i = 2:m-2
    
    F(i,1) = -(h^2)*f(x(2),y(i+1)) + fxa(a,y(i+1));
    
end

F(m-1,1) = -(h^2)*f(x(2),y(m)) + fxa(a,y(m)) + lambda*fyd(x(2),d);

for i = 3:n-1
    
    F((m-1)*(i-2) + 1,1) = -(h^2)*f(x(i),y(2)) + lambda*fyc(x(i),c);
    F((m-1)*(i-1),1) = -(h^2)*f(x(i),y(m)) + lambda*fyd(x(i),d);
    
    for j = 3:m-1
        
        F((m-1)*(i-2) + j - 1,1) = -(h^2)*f(x(i),y(j));
        
    end
    
end

F((n-2)*(m-1) + 1,1) = -(h^2)*f(x(n),y(2)) + fxb(b,y(2)) + lambda*fyc(x(n),c);

for i = 2:m-2
    
    F((n-2)*(m-1) + i,1) = -(h^2)*f(x(n),y(i+1)) + fxb(b,y(i+1));
    
end

F((n-1)*(m-1),1) = -(h^2)*f(x(n),y(m)) + fxb(b,y(m)) + lambda*fyd(x(n),d);

% Bilinmeyenler vektörü

ww = K\F;

% Tablo oluþturma

for i = 1:n+1
    w(1,i) = fyc(x(i),c);
    w(m+1,i) = fyd(x(i),d);
end

for i = 1:m+1
    w(i,1) = fxa(a,y(i));
    w(i,n+1) = fxb(b,y(i));
end

for j = 2:n
    for i = 2:m
        w(i,j) = ww((i-1) + (m-1)*(j-2));
    end
end


% Analitik çözüm

[X,Y] = meshgrid(x,y);

uA = ...;
    
MutlakHata = abs(uA - w);




        
        
        
        
        
        




    


















