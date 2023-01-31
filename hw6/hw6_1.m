%(3-1)
im1=double(imread("C:\Users\User\Desktop\專題\Pic\8.gif"));
im2=double(imread("C:\Users\User\Desktop\專題\Pic\12.gif"));
n=width(im1);
m=height(im1);

IM1=fft2(im1);
IM2=fft2(im2);
th=n/30;
L=zeros(m,n);
for p=1:m
    for q=1:n
        if (p-1+q-1 <=th)||((n-p+1)+q-1<=th)||(p-1+(m-q+1)<=th)||((n-p+1)+(m-q+1)<=th)
            L(p,q)=1;
        end
    end
end

IM1=IM1.*L;
IM2=IM2.*(1-L);
IM=IM1+IM2;
im=ifft2(IM);
figure()
image(im);
colormap(gray(m));
