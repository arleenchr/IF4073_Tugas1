%image = imread('../../images/peppers512warna.bmp');
%figure,imshow(image); title("Citra Asli");
%figure,histogram(image); title("Histogram Citra Asli");

%log_image = logtransform(image,10,1);
%figure,imshow(log_image); title("Citra Log Transformed");
%figure,histogram(log_image); title("Histogram Log Transformed");

% s = c*log(r+1+a)
function output_image = logtransformation(image,c,r)
    [rows, cols, color_channels] = size(image);
    output_image = zeros(rows, cols, 'uint8');

    % iterasi untuk setiap pixel pada citra
    for i = 1:rows
        for j = 1:cols
            for k = 1:color_channels
                % menjalankan operasi s = c*log(r+1+a) untuk setiap pixel
                temp = c*log(double(image(i,j,k) + r +1));

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