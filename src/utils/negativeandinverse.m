%image = imread('../../images/peppers512warna.bmp');
%figure,imshow(image); title("Citra Asli");
%figure,histogram(image); title("Histogram Citra Asli");

%negative_image = negative(image);
%invers_negative = negative(negative_image);

%figure,imshow(negative_image); title("Citra Negative");
%figure,histogram(negative_image); title("Histogram Citra Negative");
%figure,imshow(invers_negative); title("Citra Invers Negative");
%figure,histogram(invers_negative); title("Histogram Citra Invers Negative");

function output_image = negativeandinverse(image)
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


    