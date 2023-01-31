%(3-4) PCA
I=[2 -1 3 ;-1 3 5;0 2 4;4 -2 -1;1 0 4;-2 5 5];
M=height(I);
N=width(I);
f=zeros(1,N);
for i=1:N
    f(i)=sum(I(:,i))/M;
end

A=zeros(M,N);
for i=1:M
    for j=1:N
        A(i,j)=I(i,j)-f(j);
    end
end

[U,S,V]=svd(A);
c=sum(S(:,1));
v1=V(1,:);

n=0:1:10;
x=zeros(1,10);
y=zeros(1,10);
z=zeros(1,10);
for i=1:10
    x(i)=f(1)+n(i)*v1(1);
    y(i)=f(2)+n(i)*v1(2);
    z(i)=f(3)+n(i)*v1(3);
end
figure()
plot3( x,y,z);

