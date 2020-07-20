% M2.2) 
%A) Sawtooth-------------------------------------

close all 
clear all

A=7;   %Peak amplitude
N=13;  %Period
l=100; %Sample size
DC=60; %Duty cycle percentage

t=0:0.1:l-1; %discrete time

S=sawtooth(2*pi*(1/(N-1))*(t));
S=S*7;
figure
stem(t,S); title('Sawtooth Wave (A=7, N=13)');
ylabel('Amplitude, A'); xlabel('Number of samples, L');
grid on
%%
%B) Square  -------------------------------

figure(2)
sq= A*square(2*pi*(1/N)*t,DC);
stem(t,sq); title('Square Wave (A=7, N=13, DC=60)');
ylabel('Amplitude, A'); xlabel('Number of samples, L');
grid on
 
%%
% subplot of both --------------------------
figure(3)
subplot(2,1,1);
stem(t,S);
title('Sawtooth Wave(A=7, N=13)');
ylabel('Amplitude, A'); xlabel('Number of samples, L');
subplot(2,1,2);
stem(t,sq);
title('Square Wave (A=7, N=13, DC=60)');
ylabel('Amplitude, A'); xlabel('Number of samples, L');
grid on
