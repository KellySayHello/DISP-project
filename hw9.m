%corner/edge detector
I=double(imread("C:\Users\User\Desktop\專題\Pic\8.gif"));
s=size(I);
figure();
image(I);
colormap(gray(s(1)));

X= conv2(I, [-1, 0, 1], 'same');
Y= conv2(I, [-1, 0, 1]', 'same');

sigma=3;
w=zeros(21,21);
for u=-10:10
    for v=-10:10
        w(u+11,v+11)=exp(-(u^2+v^2)/2/sigma^2);
    end
end

A=conv2(X.^2 ,w,'same');
B=conv2(Y.^2 ,w,'same');
C=conv2(X.*Y ,w,'same');
k=0.04;
R= A.*B - C.^2 - k*(A+B).^2;

threshold=max(R,[],'all')/100;

for m=2:s(1)-1
    for n=2:s(2)-1
        if R(m,n)>=threshold & R(m,n)>=R(m-1,n-1) & R(m,n)>=R(m-1,n+1) & R(m,n)>=R(m+1,n-1) & R(m,n)>=R(m+1,n+1)
            I(m,n)=255;
        end
    end
end

figure();
image(I);
colormap(gray(s(1)));


