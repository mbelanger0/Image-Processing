%% Frequency domain low pass filtering (Ideal, Butterworth and Gaussian LPF)
% code credit: https://www.abhilashsingh.net/?source=lpf_matlab 
clc
clear all
%%
img = imread('carter.jpg');
gimg=rgb2gray(img);
subplot(331)
imshow(gimg)
title('f(x,y)')
%% Ideal low pass
P=size(gimg);
M=P(1);N=P(2);
F=fft2(gimg,M,N);
subplot(332)
%imshow(uint8(abs(fftshift(F))));
imshow(uint8(abs((F))));
title('F(u,v)')
u0=20; %remove freq greater than u0
u=0:(M-1);
v=0:(N-1);
idx=find(u>M/2);
u(idx)=u(idx)-M;
idy=find(v>N/2);
v(idy)=v(idy)-N;
[V,U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2);
H=double(D<=u0);
% display
subplot(333)
imshow(abs(fftshift(H)),[]);
title('H(u,v) ILPF')
subplot(334)
G=H.*F;
gideal=(ifft2(G));
imshow(uint8(gideal))
title('ILPF')
%% Butterworth low pass
n=1; %Butterworth filter of order n
H= 1./(1 + (D./u0).^(2*n));
subplot(335)
imshow(abs(fftshift(H)));
title('H(u,v) BLPF')
subplot(336)
G=H.*F;
gbutter=(ifft2(G));
imshow(uint8(gbutter))
title('BLPF')
%% Gaussian low pass filter
H = exp(-(D.^2)./(2*(u0^2)));
subplot(337)
imshow(abs(fftshift(H)));
title('H(u,v) GLPF')
subplot(338)
G=H.*F;
ggauss=(ifft2(G));
imshow(uint8(ggauss))
title('GLPF')