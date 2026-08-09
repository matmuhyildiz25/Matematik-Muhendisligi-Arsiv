

function [w1, k, yA, MutlakHata] = Question1(a, b, alpha, beta, N, TOL, M)            

h = ...;                           % h tanimlanacak.

f = @(x,Y0,Y1) ...;                % f(x,y,y') tanimlanacak.          
fY0 = @(x,Y0,Y1) ...;              % f'in y ye göre türevi yazilacak                                 
fY1 = @(x,Y0,Y1) ...;              % f'in y' ne göre türevi yazilacak                                      

x = ...;                           % x tanimlanacak                                   

t(1) = (beta-alpha)/(b-a);                                                

% ilk denklemin çözümü

k=1;
while 1                                                                   
w1(1) = alpha;   
w2(1) = t(k);   

for i = 1:length(x)-1                                                     
    
    k11(i) = h*w2(i);
    k12(i) = h*f(x(i),w1(i),w2(i));
    
    k21(i) = h*(w2(i) + (1/2)*k12(i));
    k22(i) = h*f(x(i)+h/2,w1(i)+(1/2)*k11(i),w2(i)+(1/2)*k12(i));
    
    k31(i) = h*(w2(i) + (1/2)*k22(i));
    k32(i) = h*f(x(i)+h/2,w1(i)+(1/2)*k21(i),w2(i)+(1/2)*k22(i));
    
    k41(i) = h*(w2(i) + k32(i));
    k42(i) = h*f(x(i)+h,w1(i)+k31(i),w2(i)+k32(i));
    
    w1(i+1) = w1(i) + (1/6)*(k11(i) + 2*k21(i) + 2*k31(i) + k41(i));
    w2(i+1) = w2(i) + (1/6)*(k12(i) + 2*k22(i) + 2*k32(i) + k42(i));
    
end

% ikinci denklemin çözümü

u1(1) = 0;
u2(1) = 1; 

for i = 1:length(x)-1
    
    m11(i) = h*u2(i);
    m12(i) = h*(fY0(x(i),w1(i),w2(i))*u1(i) + fY1(x(i),w1(i),w2(i))*u2(i));
    
    m21(i) = h*(u2(i) + (1/2)*m12(i));
    m22(i) = h*(fY0(x(i)+h/2,w1(i),w2(i))*(u1(i)+(1/2)*m11(i)) + fY1(x(i)+h/2,w1(i),w2(i))*(u2(i)+(1/2)*m12(i)));
    
    m31(i) = h*(u2(i) + (1/2)*m22(i));
    m32(i) = h*(fY0(x(i)+h/2,w1(i),w2(i))*(u1(i)+(1/2)*m21(i)) + fY1(x(i)+h/2,w1(i),w2(i))*(u2(i)+(1/2)*m22(i)));
    
    m41(i) = h*(u2(i) + m32(i));
    m42(i) = h*(fY0(x(i)+h,w1(i),w2(i))*(u1(i)+m31(i)) + fY1(x(i)+h,w1(i),w2(i))*(u2(i)+m32(i)));
    
    u1(i+1) = u1(i) + (1/6)*(m11(i) + 2*m21(i) + 2*m31(i) + m41(i));
    u2(i+1) = u2(i) + (1/6)*(m12(i) + 2*m22(i) + 2*m32(i) + m42(i));
    
end

if abs(w1(N+1)-beta)<TOL || k>M                                          
break;
end
k=k+1;
t(k) = t(k-1) - (w1(N+1) - beta)/u1(N+1);
end

%Analitik çözüm

yA = ...;                      % Analitik çözüm yazilacak.

MutlakHata = ...;              % Mutlak Hata yazilacak.



