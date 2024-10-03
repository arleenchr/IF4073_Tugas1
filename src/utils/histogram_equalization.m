image = imread('../../images/peppers512warna.bmp');
imshow(image);
equalized_image = hist_equalization(image);
%equalized_image = histeq(image);
imshowpair(image,equalized_image,'montage');
axis off;


function output_image = hist_equalization(image)
    if size(image, 3) == 1
        % Grayscale image
        equalized_image = compute_equalization(image);
        output_image = equalized_image(double(image) + 1);
    else
        % Colored image
        output_image = zeros(size(image), 'uint8');

        equalized_red = compute_equalization(image(:,:,1));
        output_image(:,:,1) = equalized_red(double(image(:,:,1)) + 1);

        equalized_green = compute_equalization(image(:,:,2));
        output_image(:,:,2) = equalized_green(double(image(:,:,2)) + 1);

        equalized_blue = compute_equalization(image(:,:,3));
        output_image(:,:,3) = equalized_blue(double(image(:,:,3)) + 1);
    end
end