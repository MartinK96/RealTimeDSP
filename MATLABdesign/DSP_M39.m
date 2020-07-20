%circular convolution of a sequence
close all; clear all; clc;

%length of linear conv. is gn+hn-1

% a)

g=[3, 4, -2, 0, 1, -4];
h=[1, -3, 0, 4, -2, 3];

% gfft=fft(g);
% hfft=fft(h);
%Conv=gfft.*hfft %time convolution


linearA = conv(g, h); %linear convolution
circularA = ifft(fft(g).*fft(h)); %circular convolution


%% 
% b)

x=[2+3*1i, 3-1i, -1+2*1i, 3*1i, 2+4*1i];
v=[-3-2*1i, 1+4*1i, 1+2*1i, 5+3*1i, 1+2*1i];

linearB = conv(x, v); %linear convolution
circularB = ifft(fft(x).*fft(v)); %cincular convolution

%%
%plotting

figure(1)
subplot(2,1,1)
stem(linearA); title('linear convolution');
ylim([-40, 40]);
ylabel('Amplitude'); grid on;
subplot(2,1,2)
stem(circularA); title('circular convolution');
ylabel('Amplitude'); grid on;
suptitle('a)')

figure(2)
subplot(2,1,1)
stem(linearB); title('linear convolution');
ylim([-40, 40]);
ylabel('Amplitude'); grid on;
subplot(2,1,2)
stem(circularB); title('circular convolution');
ylabel('Amplitude'); grid on;
suptitle('b)')
%%
figure(3)
ReCA=real(circularA);
ImCA=imag(circularA);
subplot(2,1,1)
stem(ReCA);
subplot(2,1,2);
stem(ImCA);
%%
figure(3)
ReCB=real(circularB);
ImCB=imag(circularB);
subplot(2,1,1)
stem(ReCB);
subplot(2,1,2);
stem(ImCB);
