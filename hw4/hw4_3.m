%(3a)
% smaller scaled (short term) feature;larger sigma 
an=1;
L=10;
sigma=10;

n=-50:100;
noise=an*(rand(1,151)-0.5);
x1=0.1*n+noise;
figure()
subplot(2,1,1);
stem(n,x1) 
xlabel('n')
ylabel('x1[n]')

n2=-L:L;
C=1/sum(exp(-sigma*abs(n2)));

n3=-L:L;
syms h(t)
h(t)=C*exp(-sigma*abs(t));
hn=h(n3*1);
hn=double(hn);

smooth=conv(x1,hn,'same');
subplot(2,1,2);
stem(n,smooth) 
xlabel('n')
ylabel('smooth')

%(3a)
% larger scaled (long term) feature ;smaller sigma 
an=7;
sigma=0.5;

noise=an*(rand(1,151)-0.5);
x1=0.1*n+noise;
figure()
subplot(2,1,1);
stem(n,x1) 
xlabel('n')
ylabel('x1[n]')

n2=-L:L;
C=1/sum(exp(-sigma*abs(n2)));

n3=-L:L;
syms h(t)
h(t)=C*exp(-sigma*abs(t));
hn=h(n3*1);
hn=double(hn);

smooth=conv(x1,hn,'same');
subplot(2,1,2);
stem(n,smooth) 
xlabel('n')
ylabel('smooth')

