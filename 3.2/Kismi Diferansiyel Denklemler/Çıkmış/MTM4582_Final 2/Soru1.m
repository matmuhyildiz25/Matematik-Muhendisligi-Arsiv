
% Sorudaki r degiskeni yerine rr degiskeni kullanilmistir. Sadece analitik çözümde
% doldurmaniz gereken yerler vardýr. 

function [w1,w2,pA,MutlakHata] = Soru1(R1, R2, V1, V2, N)    

h = (R2-R1)/N;                             

p = @(rr) -2./rr;                             
q = @(rr)     0;                                
r = @(rr)     0;                      

rr = R1:h:R2;                                                                       

u1(1) = V1;                     
u2(1) = 0;   

for i = 1:length(rr)-1                              
    
    k11(i) = h*u2(i);
    k12(i) = h*(p(rr(i))*u2(i) + q(rr(i))*u1(i) + r(rr(i)));
    
    k21(i) = h*(u2(i) + (1/2)*k12(i));
    k22(i) = h*(p(rr(i)+h/2)*(u2(i)+(1/2)*k12(i)) + q(rr(i)+h/2)*(u1(i)+(1/2)*k11(i)) + r(rr(i)+h/2));
    
    k31(i) = h*(u2(i) + (1/2)*k22(i));
    k32(i) = h*(p(rr(i)+h/2)*(u2(i)+(1/2)*k22(i)) + q(rr(i)+h/2)*(u1(i)+(1/2)*k21(i)) + r(rr(i)+h/2));
    
    k41(i) = h*(u2(i) + k32(i));
    k42(i) = h*(p(rr(i)+h)*(u2(i)+k32(i)) + q(rr(i)+h)*(u1(i)+k31(i)) + r(rr(i)+h));
    
    u1(i+1) = u1(i) + (1/6)*(k11(i) + 2*k21(i) + 2*k31(i) + k41(i));
    u2(i+1) = u2(i) + (1/6)*(k12(i) + 2*k22(i) + 2*k32(i) + k42(i));
    
end

% 2. denklemin çözümü

v1(1) = 0;
v2(1) = 1; 

for i = 1:length(rr)-1                             
    
    m11(i) = h*v2(i);
    m12(i) = h*(p(rr(i))*v2(i) + q(rr(i))*v1(i));
    
    m21(i) = h*(v2(i) + (1/2)*m12(i));
    m22(i) = h*(p(rr(i)+h/2)*(v2(i)+(1/2)*m12(i)) + q(rr(i)+h/2)*(v1(i)+(1/2)*m11(i)));
    
    m31(i) = h*(v2(i) + (1/2)*m22(i));
    m32(i) = h*(p(rr(i)+h/2)*(v2(i)+(1/2)*m22(i)) + q(rr(i)+h/2)*(v1(i)+(1/2)*m21(i)));
    
    m41(i) = h*(v2(i) + m32(i));
    m42(i) = h*(p(rr(i)+h)*(v2(i)+m32(i)) + q(rr(i)+h)*(v1(i)+m31(i)));
    
    v1(i+1) = v1(i) + (1/6)*(m11(i) + 2*m21(i) + 2*m31(i) + m41(i));
    v2(i+1) = v2(i) + (1/6)*(m12(i) + 2*m22(i) + 2*m32(i) + m42(i));
    
end

% w1 p çözümü, w2 p' çözümü olmak üzere

for i = 1:length(rr)                               
    
    w1(i) = u1(i) + ((V2-u1(N+1))/v1(N+1))*v1(i);
    
    w2(i) = u2(i) + ((V2-u1(N+1))/v1(N+1))*v2(i);
    
end

% Analitik çözüm

pA = ...;                    % Analitik çözümü yazýnýz.

MutlakHata = ...;            % Mutlak Hatayý yazýnýz. 




    
    
    
    
    
    
    
    
    
    

