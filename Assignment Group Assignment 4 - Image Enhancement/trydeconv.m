close all;
clear all;

I = imread('carter.jpg');
figure; imshow(I); title('Original Image');

PSF = fspecial('motion',28,45);% Create the PSF
figure; imshow(PSF,[]); title('True PSF');

Blurred = imfilter(I,PSF,'circ','conv');% Simulate the blur
figure; imshow(Blurred); title('Blurred Image');

INITPSF = ones(size(PSF));
[J P]= deconvblind(Blurred,INITPSF,10);
figure; imshow(J); title('Preliminary Restoration');
figure; imshow(P,[]);
title('Preliminary Restoration');

PSF2 = fspecial('gaussian',7,10);
V = .0001;
BlurredNoisy = imnoise(imfilter(I,PSF2),'gaussian',0,V);

J1= deconvlucy(BlurredNoisy,PSF2);
J2= deconvlucy(Blurred,PSF);


% Display the results.
figure;
subplot(221);imshow(BlurredNoisy);
title('A = Blurred and Noisy');
subplot(222);imshow(J1);
subplot(223);imshow(J2);


