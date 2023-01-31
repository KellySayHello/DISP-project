im=double(imread("C:\Users\User\Desktop\專題\Pic\LENA.BMP")); %路徑要改
s=size(im);
a=s(1);
figure()
image(im);
colormap(gray(a));
title("original image")

%(a)
E1=zeros(a,a-1);
for m=1:a
    for n=2:a
        E1(m,n)=im(m,n)-im(m,n-1);
    end
end
figure()
image(5*abs(E1));
colormap(gray(a));
title("horizontal axis")

%(b)
E2=zeros(a-1,a);
for m=2:a
    for n=1:a
        E2(m,n)=im(m-1,n)-im(m,n);
    end
end
figure()
image(5*abs(E2));
colormap(gray(a));
title("vertical axis")

%(c)
E3=zeros(a-1,a-1);
for m=2:a-1
    for n=2:a-1
        E3(m,n)=(2*im(m,n+1)-2*im(m,n-1)+im(m+1,n+1)-im(m+1,n-1)+im(m-1,n+1)-im(m-1,n-1))/4;
    end
end
figure()
image(5*abs(E3));
colormap(gray(a));
title("Sobel Operator(horizontal axis)")

%(d)
E4=zeros(a-1,a-1);
for m=2:a-1
    for n=2:a-1
        E4(m,n)=(2*im(m+1,n)-2*im(m-1,n)+im(m+1,n+1)-im(m-1,n+1)+im(m+1,n-1)-im(m-1,n-1))/4;
    end
end
figure()
image(5*abs(E4));
colormap(gray(a));
title("Sobel Operator(vertical axis)")

%(e)
O1=[0,-1,-2;1,0,-1;2,1,0];
E5=conv2(im,O1)/4;
figure()
image(5*abs(E5));
colormap(gray(a));
title("Sobel Operator(45 degree)")

%(f)
O2=[-1,-2,0;-1,0,1;0,1,2];
E6=conv2(im,O2)/4;
figure()
image(5*abs(E6));
colormap(gray(a));
title("Sobel Operator(135 degree)")

%(g)
O3=[-1,-1,-1;-1,8,-1;-1,-1,-1];
E7=conv2(im,O3)/8;
figure()
image(5*abs(E7));
colormap(gray(a));
title("Laplacian Operator")

