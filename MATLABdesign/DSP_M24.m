%M2.4) a)generating sinusoidal sequence-------------

clear all
close all

A=3;     %amplitude
L=150;  
wo=pi/4; %angular frequency (between 0 and pi)
p=0;     %phase angle (between 0 and 2pi)

figure(1)
n = 0:0.5:L; 
x=A*cos(wo*n+p);
stem(n, x);
title('Generated sequence');
ylabel('Amplitude, A'); xlabel('Length');

%{
%M2.4) b) varying angular frequencies--------------
% figure(2)
% x1=A*cos(0.14*pi*n+p); %0.14
% G1=stem(n,x1);
% title('0.14*pi Angular Frequency');
% 
% figure(3)
% x2=A*cos(0.24*pi*n+p); %0.24
% G2=stem(n,x2);
% title('0.24*pi Angular Frequency');
% 
% figure(4)
% x3=A*cos(0.34*pi*n+p); %0.34
% G3=stem(n,x3);
% title('0.34*pi Angular Frequency');
% 
% figure(5)
% x4=A*cos(0.68*pi*n+p); %0.68
% G4=stem(n,x4);
% title('0.68*pi Angular Frequency');
% 
% figure(6)
% x5=A*cos(0.75*pi*n+p); %0.75
% G5=stem(n,x5);
% title('0.75*pi Angular Frequency');
%}
%%
figure(7)
subplot(5,1,1)
x1=A*cos(0.14*pi*n+p); %0.14
stem(n,x1); title('0.14*pi Angular Frequency');
ylabel('Amplitude, A'); xlabel('Length');
subplot(5,1,2)
x2=A*cos(0.24*pi*n+p); %0.24
stem(n,x2); title('0.24*pi Angular Frequency');
ylabel('Amplitude, A'); xlabel('Length');
subplot(5,1,3)
x3=A*cos(0.34*pi*n+p); %0.34
stem(n,x3); title('0.34*pi Angular Frequency');
ylabel('Amplitude, A'); xlabel('Length');
subplot(5,1,4)
x4=A*cos(0.68*pi*n+p); %0.68
stem(n,x4); title('0.68*pi Angular Frequency');
ylabel('Amplitude, A'); xlabel('Length');
subplot(5,1,5)
x5=A*cos(0.75*pi*n+p); %0.75
stem(n,x5); title('0.75*pi Angular Frequency');
ylabel('Amplitude, A'); xlabel('Length');


