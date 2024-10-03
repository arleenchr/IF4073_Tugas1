image = imread('../../images/peppers512warna.bmp');
figure,imshow(image); title("Citra Asli");
figure,histogram(image); title("Histogram Citra Asli");

log_image = logtransform(image,10,1);
figure,imshow(log_image); title("Citra Log Transformed");
figure,histogram(log_image); title("Histogram Log Transformed");

function output_image = logtransform(image,c,r)
    [rows, cols, color_channels] = size(image);
    output_image = zeros(rows, cols, 'uint8');

    for i = 1:rows
        for j = 1:rows
            for k = 1:color_channels
                temp = c*log(double(image(i,j,k) + r));
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