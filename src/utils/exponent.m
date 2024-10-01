image = imread('../../images/peppers512warna.bmp');
imshow(image);
histogram(image);

exp_image = exptransform(image,1,100);
imshow(exp_image);
histogram(exp_image);

function output_image = exptransform(image,c,r)
    [rows, cols, color_channels] = size(image);
    output_image = zeros(rows, cols, 'uint8');

    for i = 1:rows
        for j = 1:rows
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