%I = imread('../../images/peppers512warna.bmp');
%I_new = stretch(I);
%figure,imshow(I); title("Citra Asli");
%figure,histogram(I); title("Histogram Citra Asli");
%figure,imshow(I_new); title("Citra Hasil");
%figure,histogram(I_new); title("Histogram Citra Hasil");

function output_image = stretching(image)
    [rows, cols, color_channels] = size(image);
    output_image = zeros(rows, cols, 'uint8');

    rmin = min(image,[],'all');
    %rmin = 0;
    disp(rmin);
    rmax = max(image,[],'all');
    %rmax = 50;
    disp(rmax);
    for i = 1:rows
        for j = 1:cols
            for k = 1:color_channels
                temp = (double(image(i,j,k)) - rmin)*(255/(rmax-rmin));

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
