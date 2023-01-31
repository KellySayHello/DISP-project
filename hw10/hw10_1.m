%(4-1) Gram-Schmidt
n=zeros(5,11);
n(1,:)=ones(1,11);
m=0:10;
for i=2:5
    n(i,:)=m.^(i-1);
end

phi=zeros(5,11);
phi(1,:)=n(1,:)./sum(n(1,:).^2)^0.5;
g=zeros(5,11);
s=zeros(5,11);
for i=2:4
    for j=1:i-1
        s(i,:)=s(i,:)+sum(n(i,:).*phi(j,:))*phi(j,:);
    end
    g(i,:)=n(i,:)-s(i,:);
    phi(i,:)=g(i,:)./sum(g(i,:).^2)^0.5;
end
