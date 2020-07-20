%Real+Imaginary parts, magnitude and phase spectra of DTFt
%M3.1---------------------------------------------------------

 clear all; close all; clc

%parameters
r1=0.6;
p1=0;  
w=0:0.01:2*pi;

%DTFT equation
G1=1./(1-2*r1*(cos(p1))*exp(-1i*w)+r1^(2)*exp(-1i*2*w));

%Points of interest
Re1=real(G1);
Im1=imag(G1);
Magnitude1=abs(G1);
dB1=20*log10(Magnitude1);
Phase1=angle(G1);

%plotting af r=0.6; p=0; ----------------------

figure()
subplot(2,2,1)
plot(w,Re1); title('Real component'); grid on
xlim([w(1) w(end)]);xlabel('frequency, 0:2*pi'); ylabel('Amplitude')
subplot(2,2,2)
plot(w,Im1); title('Imaginary component'); grid on
xlim([w(1) w(end)]);xlabel('frequency, 0:2*pi'); ylabel('Amplitude')
subplot(2,2,3)
plot(w,dB1); title('Magnitude'); grid on
xlim([w(1) w(end)]);xlabel('frequency, 0:2*pi'); ylabel('dB')
subplot(2,2,4)
plot(w,Phase1); title('Phase'); grid on
xlim([w(1) w(end)]); xlabel('frequency, 0:2*pi'); ylabel('Phase, Radians')
suptitle('r=0.6; p=0')

%%
%plotting af r=0.9; p=pi; ----------------------
%parameters
r2=0.9;
p2=pi;  

%DTFT equation
G2=1./(1-2*r2*(cos(p2))*exp(-1i*w)+r2^(2)*exp(-1i*2*w));

%Points of interest
Re2=real(G2);
Im2=imag(G2);
Magnitude2=abs(G2);
dB2=20*log10(Magnitude2);
Phase2=angle(G2);

figure()
subplot(2,2,1)
plot(w,Re2); title('Real component'); grid on
xlim([w(1) w(end)]); xlabel('frequency, 0:2*pi'); ylabel('Amplitude')
subplot(2,2,2)
plot(w,Im2); title('Imaginary component'); grid on
xlim([w(1) w(end)]); xlabel('frequency, 0:2*pi'); ylabel('Amplitude')
subplot(2,2,3)
plot(w,dB2); title('Magnitude'); grid on
xlim([w(1) w(end)]); xlabel('frequency, 0:2*pi'); ylabel('dB')
subplot(2,2,4)
plot(w,Phase2); title('Phase'); grid on
xlim([w(1) w(end)]); xlabel('frequency, 0:2*pi'); ylabel('Phase, Radians')
suptitle('r=0.9; p=pi')

%%
%plotting af r=0.99; p=pi/4; ----------------------

%parameters
r3=0.99;
p3=pi/4;

%DTFT equation
G3=1./(1-2*r3*(cos(p3))*exp(-1i*w)+r3^(2)*exp(-1i*2*w));

%Points of interest
Re3=real(G3);
Im3=imag(G3);
Magnitude3=abs(G3);
dB3=20*log10(Magnitude3);
Phase3=angle(G3);

figure()
subplot(2,2,1)
plot(w,Re3); title('Real component'); grid on
xlim([w(1) w(end)]); xlabel('frequency, 0:2*pi'); ylabel('Amplitude')
subplot(2,2,2)
plot(w,Im3); title('Imaginary component'); grid on
xlim([w(1) w(end)]);xlabel('frequency, 0:2*pi'); ylabel('Amplitude')
subplot(2,2,3)
plot(w,dB3); title('Magnitude'); grid on
xlim([w(1) w(end)]);xlabel('frequency, 0:2*pi'); ylabel('dB')
subplot(2,2,4)
plot(w,Phase3); title('Phase'); grid on
suptitle('r=0.99; p=pi/4')
xlim([w(1) w(end)]);xlabel('frequency, 0:2*pi'); ylabel('Phase, Radians')

