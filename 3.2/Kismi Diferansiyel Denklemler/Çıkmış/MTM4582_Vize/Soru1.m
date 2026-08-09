function [u1,u2,v1,v2,w1,w2,yA,MutlakHata] = Soru1(a,b,alpha,beta,N)

p = @(x) ...;
q = @(x) ...;
r = @(x) ...;

h = (b-a)/N;
x = a:h:b;

%1 denkleminin çözümü
u1(1) = alpha;
u2(1) = 0;

for i=1:N
    k11(i) = h*u2(i);
    k12(i) = h*(p(x(i))*u2(i) + q(x(i))*u1(i) + r(x(i)));
    k21(i) = h*(u2(i)+(k12(i)/2));
    k22(i) = h*(p(x(i)+(h/2))*(u2(i)+(k12(i)/2)) + q(x(i)+(h/2))*(u1(i)+(k11(i)/2))+r(x(i)+(h/2)));
    k31(i) = h*(u2(i)+(k22(i)/2));
    k32(i) = h*(p(x(i)+(h/2))*(u2(i)+(k22(i)/2)) + q(x(i)+(h/2))*(u1(i)+(k21(i)/2))+r(x(i)+(h/2)));
    k41(i) = h*(u2(i)+k32(i));
    k42(i) = h*(p(x(i)+h)*(u2(i)+k32(i)) + q(x(i)+h)*(u1(i)+k31(i))+r(x(i)+h));
    
    u1(i+1) = u1(i) + (1/6)*(k11(i) + 2*k21(i) + 2*k31(i) + k41(i));
    u2(i+1) = u2(i) + (1/6)*(k12(i) + 2*k22(i) + 2*k32(i) + k42(i));
end

%2 denkleminin çözümü
v1(1) = 0;
v2(1) = 1;

for i = 1:N
    kk11(i) = h*v2(i);
    kk12(i) = h*(p(x(i))*v2(i) + q(x(i))*v1(i));
    kk21(i) = h*(v2(i)+(kk12(i)/2));
    kk22(i) = h*(p(x(i)+(h/2))*(v2(i)+(kk12(i)/2)) + q(x(i)+(h/2))*(v1(i)+(kk11(i)/2)));
    kk31(i) = h*(v2(i)+(kk22(i)/2));
    kk32(i) = h*(p(x(i)+(h/2))*(v2(i)+(kk22(i)/2)) + q(x(i)+(h/2))*(v1(i)+(kk21(i)/2)));
    kk41(i) = h*(v2(i)+kk32(i));
    kk42(i) = h*(p(x(i)+h)*(v2(i)+kk32(i)) + q(x(i)+h)*(v1(i)+kk31(i)));
    
    v1(i+1) = v1(i) + (1/6)*(kk11(i) + 2*kk21(i) + 2*kk31(i) + kk41(i));
    v2(i+1) = v2(i) + (1/6)*(kk12(i) + 2*kk22(i) + 2*kk32(i) + kk42(i));
end

% w1 = y, w2 = y'

for i = 1:N+1
    
    w1(i) = u1(i) + ((beta-u1(N+1))/v1(N+1))*v1(i);
    w2(i) = u2(i) + ((beta-u1(N+1))/v1(N+1))*v2(i);
    
end

% Analitik çözüm

yA = ...;

MutlakHata = abs(yA - w1); 



    
    
    

