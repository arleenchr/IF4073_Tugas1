%image = imread('images/peppers512warna.bmp');
%equalized_image = hist_equalization(image);
%equalized_image = histeq(image);
%imshowpair(image,equalized_image,'montage');
%hist(equalized_image);
%hist(image);
%axis off;


function output_image = histogram_equalization(image)
   equalized_image = compute_equalization(image);
   output_image = equalized_image(double(image) + 1);
end