clear all;
close all;

% histogram equalization
% io = imread('houses.jpg');
% i = rgb2gray(io);
i = imread('carter.jpg');
figure;
subplot(1,2,1); 
imshow(i);
subplot(1,2,2);
imhist(i);
imh = imadjust(i,[0.6,0.9],[0.0,1.0]);
imh1 = histeq(i);
figure;
subplot(2,2,1); 
imshow(imh);
title('stretched image');
subplot(2,2,2);
imhist(imh);
subplot(2,2,3);
imshow(imh1);
title('hist equalized image');
subplot(2,2,4);
imhist(imh1);
figure;
subplot(2,1,1);
imshow(i);
subplot(2,1,2);
imshow(imh1);



figure;
subplot(2,2,1); 
imshow(i);
subplot(2,2,2);
imhist(i);
subplot(2,2,3);
imshow(imh1);
subplot(2,2,4);
imhist(imh1);

figure;
subplot(2,2,1); 
imshow(i);
subplot(2,2,2);
imhist(i);
subplot(2,2,3);
imshow(imh);
subplot(2,2,4);
imhist(imh);
