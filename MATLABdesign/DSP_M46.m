
%M4.6) Causal IIR filter

% https://ece.uwaterloo.ca/~ece413/HW/Solution1.pdf
% https://uk.mathworks.com/help/ident/ref/bode.html TF

close all;
clear all;

k = 1;
for w = 0:0.01:2*pi %frequency range
z=exp(-1i*w);

%Transfer function
H(k)=(0.0534.*(1+z.^(-1)).*(1-1.0166.*z.^(-1)+z.^(-2)))./...      
  ((1-0.683.*z.^(-1)).*(1-1.4461.*z.^(-1)+0.7957.*z.^(-2))); 

k = (k + 1);
end 

Magnitude=abs(H);
Amp=20*log10(Magnitude);

Phase=angle(H);

figure()
subplot(2,1,1)
plot(0:0.01:2*pi, Amp); title('Magnitude response'); grid on
xlim([0, 2*pi]); ylabel('dB'); xlabel('frequency, radians')
subplot(2,1,2)
plot(0:0.01:2*pi, Phase); title('Phase response'); grid on
xlim([0, 2*pi]); ylabel('Phase, radians'); xlabel('frequency, radians')

