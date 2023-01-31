%(4-2)
%(a)
nx=0;
ny=0;
rx=3;
ry=2;
[x,y] = meshgrid(linspace(-3,3,250));
cond=(x-nx).^2/rx^2+(y-ny).^2/ry^2-1<=0;
cond= double(cond);
cond(cond == 0) = NaN;
surf(x,y,cond);
view(0,90)  

f=getframe(gcf);
I=f.cdata;
I=I(:,:,1);

%(b)
m=height(I);
n=width(I);
L0=0;
for i=1:m
    for j=1:n
        if I(m,n) ~=0
            L0=L0+1;
        end
    end
end
L1=sum(abs(I),'all');
L2=sum(abs(I).^2,'all')^0.5;
L_inf=max(I,[],'all');

%(c) m20 m11 m02
m20=0;
m11=0;
m02=0;
x_avg=0;
y_avg=0;

for i=1:m
    for j=1:n
        x_avg=x_avg+i*I(i,j);
        y_avg=y_avg+j*I(i,j);
    end
end

x_avg=x_avg/sum(I,'all');
y_avg=y_avg/sum(I,'all');

for i=1:m
    for j=1:n
        m20=m20+I(i,j)*(i-x_avg)^2;
        m11=m11+I(i,j)*(i-x_avg)*(j-y_avg);
        m02=m20+I(i,j)*(j-y_avg)^2;
    end
end