%% Group Assignment 2
% Carter Harris, Mark Belanger, Meagan Lipsman
% 09/24/24
%% 
% The aim of this assignment is to start thinking about images as a collection 
% of functions of the pixels, as a matrix of pixels, how to  work with those and 
% apply some convolution to images. 
% 
% What you need to do:
%% 1) You need 2 images. You can take new images or use your previous  images. (a suggestion: try to use images where you think you will see  something new in different color spaces).

arcaid = imread("ARCAid.jpg");
carter = imread("carter.jpg");

imshow(arcaid)
title("ARCAid Sign")
imshow(carter)
title("Our dear friend, Carter (and Ayush in the background with verbal consent)")
%% 2) Pixel Processing
% a) Change brightness of your image

arcaid_bright = arcaid + 128;
imshow(arcaid_bright)
title("ARCAid Sign Brightened")

carter_bright = carter + 128;
imshow(carter_bright)
title("Carter Brightened")

arcaid_dark = arcaid - 128;
imshow(arcaid_dark)
title("ARCAid Darkened")

carter_dark = carter - 128;
imshow(carter_dark)
title("Carter Darkened")
% b) Change contrast of your image

arcaid_contrast = arcaid * 1/2;
imshow(arcaid_contrast)
title("ARCAid with Contrast")

carter_contrast = carter * 2;
imshow(carter_contrast)
title("Carter with Contrast")
% c) Change brightness of alternating pixels of the image

arcaid_apb = arcaid;

arcaid_apb(1:2:end, 1:2:end, :) = arcaid(1:2:end, 1:2:end, :) + 128;

imshow(arcaid_apb)
title("ARCAid with Alternating Pixel Brightness")
carter_apb = carter;

carter_apb(1:2:end, 1:2:end, :) = carter(1:2:end, 1:2:end, :) + 128;

imshow(carter_apb)
title("Carter with Alternating Pixel Brightness")
%% 3) Color Spaces (more about color spaces <https://www.imageeprocessing.com/search/label/Image%20Conversion here > and <https://www.mathworks.com/help/images/understanding-color-spaces-and-color-space-conversion.html here>)
% a) Show your images in the different color spaces we discussed.
% ARCAid RGB



arcaid_red = zeros(size(arcaid), "uint8");
arcaid_red(:,:,1) = arcaid(:, :, 1);
imshow(arcaid_red)
title("Red ARCAid")
arcaid_green = zeros(size(arcaid), "uint8");
arcaid_green(:, :, 2) = arcaid(:, :, 2);

imshow(arcaid_green)
title("Green ARCAid")

arcaid_blue = zeros(size(arcaid), "uint8");
arcaid_blue(:, :, 3) = arcaid(:, :, 3);

imshow(arcaid_blue)
title("Blue ARCAid")
% Carter RGB

carter_red = zeros(size(carter), "uint8");
carter_red(:,:,1) = carter(:, :, 1);
imshow(carter_red)
title("Red Carter")

carter_green = zeros(size(carter), "uint8");
carter_green(:,:,2) = carter(:, :, 2);

imshow(carter_green)
title("Green Carter")
carter_blue = zeros(size(carter), "uint8");
carter_blue(:,:,3) = carter(:, :, 3);

imshow(carter_blue)
title("Blue Carter")
% ARCAid HSV

arcaid_hsv = rgb2hsv(arcaid);
imshow(arcaid_hsv(:,:,1))
title("ARCAid Sign in Hue")

imshow(arcaid_hsv(:, :, 2))
title("ARCAid Sign in Saturation")

imshow(arcaid_hsv(:,:,3))
title("ARCAid Sign in Value")
% Carter HSV

carter_hsv = rgb2hsv(carter);
imshow(carter_hsv(:, :, 1))
title("Carter Sign in Hue")

imshow(carter_hsv(:, :, 2))
title("Carter Sign in Saturation")

imshow(carter_hsv(:, :, 3))
title("Carter Sign in Value")
% b) Plot at least 4 different histograms for each image from the various color spaces (e.g. you can do red, green, saturation, value). 
% Arcaid Histograms

figure
subplot(1, 3, 1)
imhist(arcaid_red)
title("Red ARCAid")
xlabel("Red")
ylabel("Number of Pixels")
ylim([0 1e4])

subplot(1, 3, 2)
imhist(arcaid_green)
title("Green ARCAid")
xlabel("Green")
ylabel("Number of Pixels")
ylim([0 1e4])

subplot(1, 3, 3)
imhist(arcaid_blue)
title("Blue ARCAid")
xlabel("Blue")
ylabel("Number of Pixels")
ylim([0 1e4])
figure
subplot(1, 3, 1)
imhist(arcaid_hsv(:, :, 1))
title("Hue ARCAid")
xlabel("Hue")
ylabel("Number of Pixels")
ylim([0 3.2e4])

subplot(1, 3, 2)
imhist(arcaid_hsv(:, :, 2))
title("Saturation ARCAid")
xlabel("Saturation")
ylabel("Number of Pixels")
ylim([0 8e3])

subplot(1, 3, 3)
imhist(arcaid_hsv(:, :, 3))
title("Value ARCAid")
xlabel("Value")
ylabel("Number of Pixels")
% Carter Histograms

figure
subplot(1, 3, 1)
imhist(carter_red)
title("Red Carter")
xlabel("Red")
ylabel("Number of Pixels")
ylim([0 4e3])

subplot(1, 3, 2)
imhist(carter_green)
title("Green Carter")
xlabel("Green")
ylabel("Number of Pixels")
ylim([0 4e3])

subplot(1, 3, 3)
imhist(carter_blue)
title("Blue Carter")
xlabel("Blue")
ylabel("Number of Pixels")
ylim([0 4e3])
figure
subplot(1, 3, 1)
imhist(carter_hsv(:, :, 1))
title("Hue Carter")
xlabel("Hue")
ylabel("Number of Pixels")
ylim([0 1.2e4])

subplot(1, 3, 2)
imhist(carter_hsv(:, :, 2))
title("Saturation Carter")
xlabel("Saturation")
ylabel("Number of Pixels")
ylim([0 1e4])

subplot(1, 3, 3)
imhist(carter_hsv(:, :, 3))
title("Value Carter")
xlabel("Value")
ylabel("Number of Pixels")
ylim([0 3e3])
% c) Were these color spaces useful for your chosen image? Did they show something that you would not see in a color or grayscale image? Did the histograms show something useful?
% Generally no but the saturation space was good at highlighting lit areas. 
% This can especially be seen in the ARCAid saturation image. The HSV did not 
% highlight much that cannot be seen in color or gray but highly lit areas are 
% well highlighted. The histograms for color show similar distributions however 
% in the HSV spaces peaks seem more concentrated which is notable.
%% 4) Convolution/linear filtering
% a) Again, use 2 images - these can be same as before or different - your choice
% b) Apply identity filter to both images, show results
% Arcaid

identity = [
0 0 0;
0 1 0;
0 0 0
];

arcaid_identity = imfilter(arcaid, identity);

figure
imshow(arcaid_identity)
title("ARCAid with Identity Filter")
% Carter

carter_identity = imfilter(carter, identity);

figure
imshow(carter_identity)
title("Carter with Identity FIlter")
% c) Apply box filter of 2 different sizes to both images, show results (that would be 4 images). 

box_nine = 1 / 81 * ones(9, 9);
box_twenty = 1 / 20.^2 * ones(20, 20);

arcaid_box_nine = imfilter(arcaid, box_nine,"symmetric");
arcaid_box_twenty = imfilter(arcaid, box_twenty,"symmetric");


figure
subplot(2,1,1)
imshow(arcaid_box_nine)
title("ARCAid with 9x9 Box and Symmetric Padding")
subplot(2,1,2)
imshow(arcaid_box_twenty)
title("ARCAid with 20x20 Box and Symmetric Padding")
%%
carter_box_nine = imfilter(carter, box_nine, "replicate");
carter_box_twenty = imfilter(carter, box_twenty, "replicate");


figure
subplot(2,1,1)
imshow(carter_box_nine)
title("Carter with 9x9 Box and Replicate Padding")
subplot(2,1,2)
imshow(carter_box_twenty)
title("Carter with 20x20 Box and Replicate Padding")
% d) Box filter was a blurring filter. Think about what a sharpening filter would look like and apply it to your 2 images.

sharp = -ones(26, 26);
sharp(13, 13) = 26^2 + 26^2;
sharp = 1 / 26^2 * sharp;

arcaid_sharp = imfilter(arcaid, sharp);
figure
imshow(arcaid_sharp)
title("Sharpened ARCAid")
carter_sharp = imfilter(carter, sharp);
imshow(carter_sharp)
title("Sharpened Carter")
% e) Design a Gaussian filter with your choice of variance. Apply this to your 2 images. Please mention what variance you used in the image. 

arcaid_gauss = imgaussfilt(arcaid, 4);
imshow(arcaid_gauss)
title("ARCAid with Gaussian Filter with \sigma = 4")
%% 
% We used a variance of 4 in this image. We started with a value of 20 which 
% made the image indecipherable so we toned it down so we could make out the arcaid 
% sign while blurring the poster.

carter_gauss = imgaussfilt(carter, 3);
imshow(carter_gauss)
title("Carter with Gaussian Filter with \sigma = 3")
%% 5) Submit your images, results and reflection as a single file.  (since you are working in groups, one submission is fine. Please write the names of the members of your group at the top of your submission file or as a comment.) 
%