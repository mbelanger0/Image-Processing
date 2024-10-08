close all;
clear all;

I = imread('ARCAid.jpg');
% I = imread('image.jpg');
Ig = im2gray(I);
Y = fft2(Ig);

Y1 = abs(Y);

Y2 = log(abs(Y));

Y3 = log(abs(fftshift(Y)));

imtool(Y1,[]);
imtool(Y2,[]);
imtool(Y3,[]);
figure;
imshow(Ig);

