function [w1,w2,u1,u2,yA,MutlakHata,k] = NonlineerAtis(a,b,alpha,beta,N,TOL,M)

f = @(x,Y0,Y1) ...;
fY0 = @(x,Y0,Y1) ...;
fY1 = @(x,Y0,Y1) ...;

h = (b-a)/N;
x = a:h:b;

t = (beta-alpha)/(b-a);

   w1(1) = alpha;
   w2(1) = t;
   
   for i = 1:N
    k11(i) = h*w2(i);
    k12(i) = h*f(x(i),w1(i),w2(i));
    k21(i) = h*(w2(i)+(k12(i)/2));
    k22(i) = h*f(x(i)+(h/2),w1(i)+(k11(i)/2),w2(i)+(k12(i)/2));
    k31(i) = h*(w2(i)+(k22(i)/2));
    k32(i) = h*f(x(i)+(h/2),w1(i)+(k21(i)/2),w2(i)+(k22(i)/2));
    k41(i) = h*(w2(i)+k32(i));
    k42(i) = h*f(x(i)+h,w1(i)+k31(i),w2(i)+k32(i));
    
    w1(i+1) = w1(i) + (1/6)*(k11(i) + 2*k21(i) + 2*k31(i) + k41(i));
    w2(i+1) = w2(i) + (1/6)*(k12(i) + 2*k22(i) + 2*k32(i) + k42(i));
   end

   
k=0;
while abs(w1(N+1)-beta)>TOL && k<M
   
    u1(1) = 0;
    u2(1) = 1;
    
   for i = 1:N
    kk11(i) = h*u2(i);
    kk12(i) = h*(fY0(x(i),w1(i),w2(i))*u1(i) + fY1(x(i),w1(i),w2(i))*u2(i));
    kk21(i) = h*(u2(i)+(kk12(i)/2));
    kk22(i) = h*(fY0(x(i)+(h/2),w1(i),w2(i))*(u1(i)+(kk11(i)/2)) + fY1(x(i)+(h/2),w1(i),w2(i))*(u2(i)+(kk12(i)/2)));
    kk31(i) = h*(u2(i)+(kk22(i)/2));
    kk32(i) = h*(fY0(x(i)+(h/2),w1(i),w2(i))*(u1(i)+(kk21(i)/2)) + fY1(x(i)+(h/2),w1(i),w2(i))*(u2(i)+(kk22(i)/2)));
    kk41(i) = h*(u2(i)+kk32(i));
    kk42(i) = h*(fY0(x(i)+h,w1(i),w2(i))*(u1(i)+kk31(i)) + fY1(x(i)+h,w1(i),w2(i))*(u2(i)+kk32(i)));
    
    u1(i+1) = u1(i) + (1/6)*(kk11(i) + 2*kk21(i) + 2*kk31(i) + kk41(i));
    u2(i+1) = u2(i) + (1/6)*(kk12(i) + 2*kk22(i) + 2*kk32(i) + kk42(i));
   end
    
   t = t - ((w1(N+1)-beta)/u1(N+1));
   
   w1(1) = alpha;
   w2(1) = t;
   
   for i = 1:N
    k11(i) = h*w2(i);
    k12(i) = h*f(x(i),w1(i),w2(i));
    k21(i) = h*(w2(i)+(k12(i)/2));
    k22(i) = h*f(x(i)+(h/2),w1(i)+(k11(i)/2),w2(i)+(k12(i)/2));
    k31(i) = h*(w2(i)+(k22(i)/2));
    k32(i) = h*f(x(i)+(h/2),w1(i)+(k21(i)/2),w2(i)+(k22(i)/2));
    k41(i) = h*(w2(i)+k32(i));
    k42(i) = h*f(x(i)+h,w1(i)+k31(i),w2(i)+k32(i));
    
    w1(i+1) = w1(i) + (1/6)*(k11(i) + 2*k21(i) + 2*k31(i) + k41(i));
    w2(i+1) = w2(i) + (1/6)*(k12(i) + 2*k22(i) + 2*k32(i) + k42(i));
   end

k=k+1;

end

%Analitik çözüm

yA = ...;

MutlakHata = abs(yA - w1);
    
    
    
    
    
    
    
    
    