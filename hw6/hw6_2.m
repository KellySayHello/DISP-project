%(3-2)
x=double(imread("C:\Users\User\Desktop\專題\Pic\binary_img\binary (43).gif"));

a=height(x);
b=width(x);
figure()
image(x);
colormap(gray(b));

E1=x;
se =strel('disk',2);
E1= imdilate(E1,se);
E1= imdilate(E1,se);
E1= imdilate(E1,se);
figure()
subplot(2,2,1);
image(E1);
colormap(gray(a));
title("Dilation")

E2=x;
E2 = imerode(E2,se);
E2 = imerode(E2,se);
E2 = imerode(E2,se);
subplot(2,2,2);
image(E2);
colormap(gray(a));
title("Erotion")

E3=x;
E3= imdilate(E3,se);
E3= imdilate(E3,se);
E3= imdilate(E3,se);
E3 = imerode(E3,se);
E3 = imerode(E3,se);
E3 = imerode(E3,se);
subplot(2,2,3);
image(E3);
colormap(gray(a));
title("Closing")

E4=x;
E4 = imerode(E4,se);
E4 = imerode(E4,se);
E4 = imerode(E4,se);
E4= imdilate(E4,se);
E4= imdilate(E4,se);
E4= imdilate(E4,se);
subplot(2,2,4);
image(E4);
colormap(gray(a));
title("Opening")


