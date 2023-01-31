%(5-1 b-spline)
x=double(imread("C:\Users\User\Desktop\專題\Pic\8.gif"));
m=height(x);
n=width(x);

figure();
image(x);
colormap(gray(m));

y=zeros(round(1.5*m),round(n*1.6));
for i=1:round(m*1.5)
    for j=1:round(n*1.6)
            m1=i/1.5;
            n1=j/1.6;
            m0=floor(m1);
            n0=floor(n1);
            if m0==0 || m0==m || n0==0 || n0==n
                y(i,j)=0;
            else
                a=m1-m0;
                b=n1-n0;
                y(i,j)=(1-a)*(1-b)*x(m0,n0)+a*(1-b)*x(m0+1,n0)+(1-a)*b*x(m0,n0+1)+a*b*x(m0+1,n0+1);
            end
    end
end

figure();
image(y);
colormap(gray(m));
