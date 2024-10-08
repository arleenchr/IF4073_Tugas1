%image = imread('../../images/peppers512warna.bmp');
%figure,imshow(image); title("Citra Asli");
%figure,histogram(image); title("Histogram Citra Asli");

%negative_image = negative(image);
%invers_negative = negative(negative_image);

%figure,imshow(negative_image); title("Citra Negative");
%figure,histogram(negative_image); title("Histogram Citra Negative");
%figure,imshow(invers_negative); title("Citra Invers Negative");
%figure,histogram(invers_negative); title("Histogram Citra Invers Negative");

% s = 255 - s
function output_image = negativeandinverse(image)
    [rows, cols, color_channels] = size(image);
    output_image = zeros(rows, cols, 'uint8');

    % iterasi untuk tiap pixel pada citra
    for i = 1:rows
        for j = 1:cols
            for k = 1:color_channels
                % melakukan operasi 255 - s untuk setiap pixel
                temp = 255 - image(i,j,k);
                output_image(i,j,k) = uint8(temp);
            end
        end
    end
end


    