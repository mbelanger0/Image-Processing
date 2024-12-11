function color_filter(image)
    % Find a yellow rubber duck in an environment by filtering for the
    % distinctive yellow color
    
    % Set RGB threshold values to define the range of what might be yellow
    red_lower_threshold = 190;
    red_upper_threshold = 230;
    
    green_lower_threshold = 90;
    green_upper_threshold = 200;
    
    blue_lower_threshold = 50;
    blue_upper_threshold = 130;
    
    duck = imread(image);
    duck_out = duck;
    
    % Create variables for each of the RGB layers in the original image
    duck_red = duck(:, :, 1);
    duck_green = duck(:, :, 2);
    duck_blue = duck(:, :, 3);
    
    % Iterate through each pixel in each of the RGB layers and determine if the
    % pixel is yellow. If the pixel isn't yellow, make it black in each RGB
    % layer
    for i = 1:size(duck, 1)
        for j = 1:size(duck, 2)
            if not ...
                (duck_red(i, j) > red_lower_threshold && ...
                duck_red(i, j) < red_upper_threshold && ...
                duck_green(i, j) > green_lower_threshold && ...
                duck_green(i, j) < green_upper_threshold && ...
                duck_blue(i, j) > blue_lower_threshold && ...
                duck_blue(i, j) < blue_upper_threshold)
    
                duck_red(i, j) = 0;
                duck_green(i, j) = 0;
                duck_blue(i, j) = 0;
            end
        end
    end
    
    % Combine the processes RGB layers back
    duck_out(:,:, 1) = duck_red;
    duck_out(:,:, 2) = duck_green;
    duck_out(:,:, 3) = duck_blue;
    
    % Show the original and color filtered image
    figure
    subplot(1, 2, 1)
    imshow(duck)
    title("Original")
    subplot(1, 2, 2)
    imshow(duck_out)
    title("Color Filtered")
end