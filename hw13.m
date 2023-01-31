%(5-3 Bilateral Filter)
noise= 0.3*rand(1,101);
syms x(t);
x(t)=piecewise((0<=t)&(t<=50),1,(50<=t)&(t<=100),0);
n=0:100;
xn=x(n*1);
xn=double(xn);

y=xn+noise;
figure()
stem(n,y);

k1=0.005;
k2=5;
L=15;

c=zeros(1,101);
x0=zeros(1,101);

for n=1:101
    s=0;
    for m=n-L:n+L
        if  m>101 || m<1
            %s=s+exp(-k1*(n-m)^2)*exp(-k2*(y(n))^2);
        else  
            s=s+exp(-k1*(n-m)^2)*exp(-k2*(y(n)-y(m))^2);
        end
    end
    c(n)=1/s;
end

for n=1:101
    a=0;
    for m=n-L:n+L
        if m<=101 && m>=1
            a=a+y(m)*exp(-k1*(n-m)^2)*exp(-k2*(y(n)-y(m))^2);
        end
    end
    x0(n)=c(n)*a;
end
n=0:100;
figure()
stem(n,x0);
