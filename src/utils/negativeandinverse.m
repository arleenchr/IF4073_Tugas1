image = imread('../../images/peppers512warna.bmp');
imshow(image);
histogram(image);

negative_image = negative(image);
invers_negative = negative(negative_image);

imshow(negative_image);
histogram(negative_image);
%imshow(invers_negative);
histogram(invers_negative);

function output_image = negative(image)
    [rows, cols, color_channels] = size(image);
    output_image = zeros(rows, cols, 'uint8');

    for i = 1:rows
        for j = 1:rows
            for k = 1:color_channels
                temp = 255 - image(i,j,k);

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


    