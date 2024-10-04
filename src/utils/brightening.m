%image = imread('images/peppers512warna.bmp');
%imshow(image);
%brightened_image = image_brightening(image, 1.5, 50);
%imshow(brightened_image);

% Image brightening s = a*r + b
function output_image = brightening(image, a, b)
    [rows, cols, color_channels] = size(image);
    output_image = zeros(rows, cols, 'uint8');

    for i = 1:rows
        for j = 1:cols
            for k = 1:color_channels
                temp = double(a * image(i,j,k) + b);

                % Clipping
                 if temp < 0
                    output_image(i,j,k) = 0;
                elseif temp > 255
                    output_image(i,j,k) = 255;
                else
                    output_image(i,j,k) = uint8(temp);
                 end
            end
        end
    end
end
