%(1)
[xn, fs] = audioread("C:\Users\User\Desktop\專題\Chord.wav");  
a=size(xn);
N=a(1);
b=a(2);
delta_t=1/fs;
e=exp(1);
n=[];
for i=1:N
    n(i)=i;
end
xn1=xn(:,1);
Xm=[];
%for m=1:N
%    Xm(m)=sum(transpose(xn1).*e.^((-1i*2*pi*n.*m)/N),'all');
%end
Xm = fft(xn1); 

Ym=[];
freq=[];
for m=1:N
    if m<=N/2
        freq(m)=(m-1)*fs/N;
    elseif m>N/2
        freq(m)=(m-N-1)*fs/N;
    end
    Ym(m)=Xm(m)*delta_t;
end

figure()
plot(freq,abs(Ym));
xlabel('f')
ylabel('|Y(f)|')

