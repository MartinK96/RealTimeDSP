% M2.2) A) Sawtooth-------------------------------------
%{
User should be prompted for initial parameters
    Add later
%}

close all 
clear all

A=7; %Peak amplitude
N=13; %Period
l=100; %Sample size
DC=60; %Duty cycle percentage

Fs=1000000; %sampling frequency
dt=1/Fs; %distance between samples
t=0:1:l-1; %time axis array

S=sawtooth(2*pi*(1/N)*t);
S=S*7;
figure
stem(S)
grid on

% M2.2) B) Square 

figure
sq= A*square(2*pi*(1/N)*t,DC-1);
stem(sq)
grid on

% subplot of both
figure
subplot(2,1,1);
stem(S);
subplot(2,1,2);
stem(sq);
grid on


 %% M2.4) a)

A=3;  %amplitude
L=100; %length
wo=0.1*pi; %angular frequency (between 0 and pi)
p=0; %phase angle (between 0 and 2pi)

%{       
% promt = 'Input the value of desired Amplitude';
% A=input(promt);
% promt = 'Input the value of desired Length';
% L=input(promt);
% promt = 'Input the value of desired Angular Frequency';
% wo=input(promt);
% promt = 'Input the value of desired Phase angle';
% Th=input(promt);
%}     

n=1:1:L;
x(n)=A*cos(wo*n+p);
stem(n,x(n));


%stem(0:40,sqrt(3)*sin(1.2*pi*(0:40)+.3))
%% M2.4) b) varying angular frequencies
wo1=0.14*pi; wo2=0.24*pi; wo3=0.34*pi;
wo4=0.68*pi; wo5=0.75*pi;

x1(n)=A*cos(wo1*n+p);
stem(x1(n))
[pks, locs]= findpeaks(stem(x1(n))

%{
figure()
xn1=A*cos(0.14*pi*n+p); %0.14
subplot(5,1,1);
G1=stem(xn1);
xn2=A*cos(0.24*pi*n+p); %0.24
subplot(5,1,2);
G2=stem(xn2)
xn3=A*cos(0.34*pi*n+p); %0.34
subplot(5,1,3);
G3=stem(xn3)
xn4=A*cos(0.68*pi*n+p); %0.68
subplot(5,1,4);
G4=stem(xn4)
xn5=A*cos(0.75*pi*n+p); %0.75
subplot(5,1,5);
G5=stem(xn5)
%}