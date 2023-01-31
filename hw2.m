im=double(imread("C:\Users\User\Desktop\專題\Pic\Baboon1.bmp")); %路徑需更改
figure()
image(im/255);
imshow(im/255);
T=[0.299,0.587,0.114;-0.169,-0.331,0.5;0.5,-0.419,-0.081];
M=inv(T);

s=size(im); %size of im
a=s(1);
b=s(2);
c=3;

%(3)lighten
Y=im(:,:,1)*0.299+im(:,:,2)*0.587+im(:,:,1)*0.114;
Cb=im(:,:,1)*(-0.169)+im(:,:,2)*(-0.331)+im(:,:,3)*0.5;
Cr=im(:,:,1)*0.5+im(:,:,2)*(-0.419)+im(:,:,3)*(-0.081);

Y1=255*(Y/255).^0.28;
R1=Y1*1+Cb*(-0.0009)+Cr*1.4017;  %由X的反矩陣求出係數
G1=Y1*1+Cb*(-0.3437)+Cr*(-0.7142);
B1=Y1*1+Cb*1.7722+Cr*0.001;

im1=zeros(a,b,c);
im1(:, :, 1) = R1;
im1(:, :, 2) = G1;
im1(:, :, 3) = B1;
figure()
image(im1/255);
imshow(im1/255);
title("lighten");

%(3) darken
Y2=255*(Y/255).^2.5;
R2=Y2*1+Cb*(-0.0009)+Cr*1.4017;  %由X的反矩陣求出係數
G2=Y2*1+Cb*(-0.3437)+Cr*(-0.7142);
B2=Y2*1+Cb*1.7722+Cr*0.001;

im2=zeros(a,b,c);
im2(:, :, 1) = R2;
im2(:, :, 2) = G2;
im2(:, :, 3) = B2;
figure()
image(im2/255);
imshow(im2/255);
title("darken");

%(4) NRMSE
prompt1 = "first signal"; %input two signals(matrix)
A = input(prompt1);
prompt2 = "second signal";
B = input(prompt2);

D1=0;
S1=0;
l=size(A);
m=l(1);
n=l(2);

%for i=1:m
 %   for n=1:n
  %      D1=D1+abs(B(m,n)-A(m,n)).^2;
   %     S1=S1+abs(A(m,n)).^2;
    %end
%end
D1=sum((B-A).^2, 'all');
S1=sum(A.^2, 'all');

NRSME=(D1/S1).^0.5;

%(4) PSNR
PSNR=10*log10((255.^2)*m*n/D1);

