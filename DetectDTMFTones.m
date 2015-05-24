%% Read WAV File and get its properties
% [x fs nbits] = wavread('DTMF_dialing1.wav'); 
[x fs] = audioread('dtmf_sound.wav'); 
x=x(:,1); %only need 1 channel of tracks
x_size = size(x)
x_length = x_size(1)
duration = x_size(1)/fs 

%% plot and play the DTMF audio
T = duration/x_length; %duration time between samples
for i=1:1:x_length;
    y(i) = T*i;
end
x_int = round(x.*1024-1);%maxinum 1024-1£¬10bits AD

plot(y, x_int) 
title('Time Domain DTMF Sequence of sound')
xlabel('Time (s)')
axis([0 duration -2048 2048])

soundsc(x_int,fs); %%%play the tones

% figure(2)
% plot(y, x_int) 
% title('A single DTMF tone of 1')
% xlabel('Time (s)')
% axis([0 0.12 -2048 2048])

%% Framing using 3rd party toolbox 'voicebox' -- function'enframe'
wlen=500;inc=250;
x_frame=enframe(x,wlen,inc)';
x_energy=sum(x_frame.*x_frame);
figure(3);
plot(x_energy);
title('short time energe of DTMF sequence')

Emax=max(x_energy);      %find maximum energy magnitude
x=[x;0];
threshold=0.6*Emax;       %set energy threshold in order to separate the digits
eindex=find(x_energy>threshold);
dseg=findSegment(eindex);
dl=length(dseg);

%% detect the digits 
for k=1:dl;
    n1=dseg(k).begin;
    n2=dseg(k).end;
    x1=(n1-1)*inc+1;
    x2=(n2-1)*inc+1;
    h=x(x1:x2);  %data point in each segment
    xl=length(h);
    [keyL,keyH,G_spect]=dtmf_G2(h,xl);
    keydig=fk2dig(keyH,keyL);
    fprintf('%4d   %4d   %4d   %s\n',k,keyH,keyL,keydig);
    fprintf('%5.4f   %5.4f   %5.4f   %5.4f   %5.4f   %5.4f   %5.4f   %5.4f\n',G_spect);
    phone_number(k) = keydig;
end

%% show results
phone_number

