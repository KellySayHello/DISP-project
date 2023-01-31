%(5-2 affine transformation)
x=double(imread("C:\Users\User\Desktop\專題\Pic\32.gif"));
m=height(x);
n=width(x);
figure();
image(x);
colormap(gray(m));

%(a)
theta=pi/6;
a=cos(theta);
b=sin(theta);
c=-sin(theta);
d=cos(theta);
cm=m/2;
cn=n/2;
A=transpose([a b;c d]*[m-cm;n-cn]+[cm;cn]);
m2=round(A(1));
n2=round(A(2));
x1=zeros(m2,n2);

for i=1:m2
    for j=1:n2
        B=transpose([d -b; -c a]*[i-cm; j-cn]*(1/(a*d-b*c))+[cm;cn]);
        m1=B(1);
        n1=B(2);
        m0=floor(m1);
        n0=floor(n1);
        if m0<1 || m0>=m-1 || n0<1 || n0>=n-1
           x1(i,j)=0;
        else
           a1=m1-m0;
           b1=n1-n0;
           x1(i,j)=(1-a1)*(1-b1)*x(m0,n0)+a1*(1-b1)*x(m0+1,n0)+(1-a1)*b1*x(m0,n0+1)+a1*b1*x(m0+1,n0+1);
        end
    end
end

figure();
image(x1);
colormap(gray(m));

%(b)
a=1;
b=0;
c=0.3;
d=1;
cm=0;
cn=0;
A=transpose([a b;c d]*[m-cm;n-cn]+[cm;cn]);
m2=round(A(1));
n2=round(A(2));
x1=zeros(m2,n2);

for i=1:m2
    for j=1:n2
        B=transpose([d -b; -c a]*[i-cm; j-cn]*(1/(a*d-b*c))+[cm;cn]);
        m1=B(1);
        n1=B(2);
        m0=floor(m1);
        n0=floor(n1);
        if m0<1 || m0>=m-1 || n0<1 || n0>=n-1
           x1(i,j)=0;
        else
           a1=m1-m0;
           b1=n1-n0;
           x1(i,j)=(1-a1)*(1-b1)*x(m0,n0)+a1*(1-b1)*x(m0+1,n0)+(1-a1)*b1*x(m0,n0+1)+a1*b1*x(m0+1,n0+1);
        end
    end
end

%figure();
%image(x1);
%colormap(gray(m));

