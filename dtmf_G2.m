%Detecing spectrum of specific frequency in input signal
function [keyH,keyL,G_spect]=dtmf_G2(x,N)
f=[697 770 852 941 1209 1336 1477 1633];
fs=8000;
df=fs/N;       %%frequency resolution
k=round(f/df);
Vk(1)=0;Vk(2)=0;
for i=1:8
    w=2*cos(2*pi*k(i)/N);     %coefficient
    for j=3:N
        Vk(j)=w.*Vk(j-1)-Vk(j-2)+x(j); 
    end
    Xk(i)=Vk(N).^2+Vk(N-1).^2-w*Vk(N)*Vk(N-1);  %squared value of magnitude
end
G_spect=Xk;        
keyH=1;keyL=5;     %separate DTMF frequency into two group, low frequency and high frequency
                   %keyH refers to the sequency of low frequency, keyL refers to the sequency of high frequency   
                   %initally, we choose
tmp=Xk(1);         %set first component 697 as first part
for i=2:4          %in low frequency group, 697,770,852,941
    if tmp<Xk(i)   %find the low frequency in low frequency group which has maximum squared value of magnitude
        tmp=Xk(i);keyH=i;
    end
end
tmp=Xk(5);         %set first component 1209Hz as first part
for i=6:8          %in high frequency group, 1209,1336, 1477
    if tmp<Xk(i)   %%find the high frequency in high frequency group which has maximum squared value of magnitude
        tmp=Xk(i);keyL=i;
    end
end