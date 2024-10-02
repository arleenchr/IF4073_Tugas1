image = imread('../../images/girl.bmp');
imshow(image);
enhanced_image = hist_equalization(image);
imshow(enhanced_image);

function output_image = hist_equalization(image)
    [rows, cols] = size(image);
    output_image = image;

    hist_eq = zeros(265); % histogram equalization result
    % hist_frequency = zeros(rows * cols); % histogram intensity frequency
    hist_frequency = compute_histogram(image);

    sum = 0.0;
    for i = 1:265
        sum = sum + hist_frequency(i);
        hist_eq(i) = floor((sum / (rows*cols)) * 255);
    end

    for i = 1:rows
        for j = 1:cols
        output_image(i,j) = hist_eq(im(i,j) + 1);
        end
    end
end