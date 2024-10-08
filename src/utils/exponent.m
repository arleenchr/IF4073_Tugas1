%image = imread('../../images/peppers512warna.bmp');
%figure,imshow(image); title("Citra Asli");
%figure,histogram(image); title("Histogram Citra Asli");

%exp_image = exptransform(image,1,100);
%figure,imshow(exp_image); title("Citra Hasil Exponent");
%figure,histogram(exp_image); title("Histogram Citra Hasil Exponent");

% s = c*s^r
function output_image = exponent(image,c,r)
    [rows, cols, color_channels] = size(image);
    output_image = zeros(rows, cols, 'uint8');

    for i = 1:rows
        for j = 1:cols
            for k = 1:color_channels
                temp = c*(double(image(i,j,k))^r);
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