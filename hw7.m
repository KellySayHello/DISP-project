%(3-3) equalizer
x=double(imread("C:\Users\User\Desktop\專題\Pic\32.gif"));
a=height(x);
b=width(x);
figure()
subplot(2,2,1)
image(x);
colormap(gray(a));
title('x[m,n]')

m=-10:10;
n=-10:10;
s=1/sum(exp(-0.1*(m.^2+n.^2)));
k=zeros(21,21);
for m=-10:10
    for n=-10:10
        k(m+11,n+11)=s*exp(-0.1*(m^2+n^2));
    end
end

%small noise
noise1= 0.1*(rand(512)-0.5);
y1=conv2(x, k, 'same') + noise1;

subplot(2,2,2)
image(y1);
colormap(gray(a));
title('y[m,n]')

size=length(k);
c=ceil(size/2); %c=11
k1=zeros(a, b);
k1(1:c, 1:c) = k(c:size, c:size);
k1(1:c,b-(size-c-1): b) = k(c:size,1:c-1);
k1(a-(size-c-1): a,1:c) = k(1:c-1, c:size);
k1(a-(size-c-1):a, b -(size-c-1): b) = k(1:c-1,1:c-1);

X=fft2(x);
K=fft2(k1);

H1=zeros(a,b);
C1=0.01;
for i=1:a
    for j=1:b
        H1(i,j)=1/(C1/conj(K(i,j))+K(i,j));
    end
end

x1 = ifft2(fft2(y1).*H1) ;
subplot(2,2,3)
image(x1);
colormap(gray(a));
title('recovered image')

%big noise
figure()
subplot(2,2,1)
image(x);
colormap(gray(a));
title('x[m,n]')

noise2= 100*(rand(512)-0.5);
y2=conv2(x, k, 'same') + noise2;
subplot(2,2,2)
image(y2);
colormap(gray(a));
title('y[m,n]')

H2=zeros(a,b);
C2=0.2;
for i=1:a
    for j=1:b
        H2(i,j)=1/(C2/conj(K(i,j))+K(i,j));
    end
end

x2 = ifft2(fft2(y2).*H2) ;
subplot(2,2,3)
image(x2);
colormap(gray(a));
title('recovered image')
