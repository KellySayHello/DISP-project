%(2a) 
% smaller noise;larger sigma 
an=0.6;
L=10;
sigma=100;

syms x(t);
x(t)=piecewise((-10<=t)&(t<=20),1,(50<=t)&(t<=80),1,(-30<=t)&(t<-10),0,(20<t)&(t<50),0,(80<t)&(t<=100),0);
n=-30:100;
xn=x(n*1);
xn=double(xn);

noise=an*(rand(1,131)-0.5) ;

x1=xn+noise;
figure()
subplot(2,1,1);
stem(n,x1) 
xlabel('n')
ylabel('x1[n]')

n2=1:L;
C=1/sum(exp(-sigma*abs(n2)));
syms sgn(t);
sgn(t)=piecewise(t>0,1,t<0,-1,t==0,0);

n3=-L:L;
syms h(t)
h(t)=C*sgn*exp(-sigma*abs(t));
hn=h(n3*1);
hn=double(hn);

edge=conv(x1,hn,'same');
subplot(2,1,2);
stem(n,edge) 
xlabel('n')
ylabel('edge')


%(2b) 
% larger noise;smaller sigma
an=2;
L=10;
sigma=0.2;
noise=an*(rand(1,131)-0.5) ;

x1=xn+noise;
figure()
subplot(2,1,1);
stem(n,x1) 
xlabel('n')
ylabel('x1[n]')

n2=1:L;
C=1/sum(exp(-sigma*abs(n2)));
syms sgn(t);
sgn(t)=piecewise(t>0,1,t<0,-1,t==0,0);

n3=-L:L;
syms h(t)
h(t)=C*sgn*exp(-sigma*abs(t));
hn=h(n3*1);
hn=double(hn);

edge=conv(x1,hn,'same');
subplot(2,1,2);
stem(n,edge) 
xlabel('n')
ylabel('edge')
