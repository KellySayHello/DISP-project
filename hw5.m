%(4)
n=0:1:35;
x=1*(n>=2&n<=4)+(n-9).*(n>=8&n<=10)-(n-15).*(n>=14&n<=16)+(sin(n-7.5*pi)).*(n>=7.5*pi&n<=9.5*pi);
figure()
subplot(4,1,1);
stem(n,x);
xlabel('n')
ylabel('x[n]')

h=(n-1).*(n>=0&n<=2);
subplot(4,1,2);
stem(n,h);
xlabel('n')
ylabel('h[n]')

h_neg=-h;
subplot(4,1,3);
stem(n,h_neg);
xlabel('n')
ylabel('h*[-n]')

tau1=0;
tau2=length(h)-1;
a=size(n);
s=a(2);
h0=sum(h)/(tau2-tau1+1);
y=zeros(1,length(x));

for i=1:s-tau2
    n1=i+tau1:i+tau2;
    n2=tau1+1:tau2+1;
    x0=sum(x(n1))/(tau2-tau1+1);
    if sum(abs(x(n1)-x0).^2)~=0
        y(i)=sum(x(n1).*(h(n2)-h0))/(sum(abs(x(n1)-x0).^2)*sum(abs(h(n2)-h0).^2)).^0.5;
    end
end
subplot(4,1,4);
stem(n,y);
xlabel('n')
ylabel('y[n]')





