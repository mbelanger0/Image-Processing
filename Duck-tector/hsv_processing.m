function hsv_processing(image)
    % Given an RGB image of a picture, the is function will draw a bounding
    % box around a yellow rubber duck that may be in the environment

    % Load the image
    duck = imread(image);

    % Convert the RGB image into HSV
    duck_hsv = rgb2hsv(duck);

    % Create variables for each layer in the HSV image
    duck_hue = duck_hsv(:, :, 1);
    duck_saturation = duck_hsv(:, :, 2);
    duck_value = duck_hsv(:, :, 3);

    % Add the saturation and value layer then subtract the hue layer
    hsv_duck_sum = duck_saturation + duck_value - duck_hue;
    
    % Convert the image to binary. All pixels are almost 0 or just over 1.
    % 1 is white and is the likely to be the duck while the black is likely
    % to be the background
    binary_mask = hsv_duck_sum > 1;
    
    % Smooth out background noise using Strel operation. Some small 
    % groupings of pixels in the background are white. This filters those 
    % out assuming the groupings are less than 15 pixels in radius
    clean_mask = imopen(binary_mask, strel('disk', 15)); 
    
    %Plot the binary image pre and post strel 
    figure
    subplot(1,2,1)
    imshow(binary_mask)
    title("Pre Strel")
    subplot(1,2,2)
    imshow(clean_mask)
    title("Post Strel")

    % Create region objects from the post Strel binary image. This allows
    % for bounding boxes to be drawn
    stats = regionprops(clean_mask, 'BoundingBox');
    
    % Plot the original image of the duck
    figure;
    imshow(duck);
    title("Bounding Boxed Duck")
    
    % Draw the bounding boxes on the original image in the shape of
    % rectangles
    for i = 1:length(stats)
        bb = stats(i).BoundingBox;

        rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth', 2);
    end
end