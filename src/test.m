%coba
addpath('utils');
image = imread('../images/peppers512warna.bmp');
%image = imread('../images/peppers.bmp');
imshow(image);
hist(image);
imhist(image);