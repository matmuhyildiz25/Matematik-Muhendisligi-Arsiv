

function [w, yA, MutlakHata] = Question2(a,b,alpha,beta,N)            

h = ...;                % h tanimlanacak.

p = @(x) ...;           % p(x) yazilacak.                                               
q = @(x) ...;           % q(x) yazilacak.                      
r = @(x) ...;           % r(x) yazilacak.                       

x = ...;                % x tanimlanacak.                                  

w(1,1) = ...;           % Baslangic kosullari yazilacak.                                        
w(N+1,1) = ...;         % Baslangic kosullari yazilacak. 

% Katsayilar matrisi

A = zeros(N-1,N-1);                                           

for i = 1:N-2                                                 
    A(i+1,i) = -(1 + (h/2)*p(x(i+2)));
    A(i,i+1) = -(1 - (h/2)*p(x(i+1)));
    A(i,i) = 2 + (h^2)*q(x(i+1));
end
A(N-1,N-1) = 2 + (h^2)*q(x(N));

% Sag taraf vektörü

b = zeros(N-1,1); 

b(1,1) = -(h^2)*r(x(2)) + (1 + (h/2)*p(x(2)))*alpha;
b(N-1,1) = -(h^2)*r(x(N)) + (1 - (h/2)*p(x(N)))*beta;

for i = 2:N-2
    b(i,1) = -(h^2)*r(x(i+1));
end

% Bilinmeyenler vektörü

Aradegerler = A\b;                                             

for i = 1:N-1
    w(i+1,1) = Aradegerler(i);
end

% Analitik çözüm

yA = ...;                        % Analitik cozum yazilacak.
MutlakHata = ...;         % Mutlak hata yazilacak.














