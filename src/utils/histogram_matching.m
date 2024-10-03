I2 = imread('../../images/baboon24.bmp'); % Gambar referensi (target)
I = imread('../../images/peppers512warna.bmp'); % Gambar input

% Memeriksa citra grayscale atau berwarna
if size(I, 3) == 3 && size(I2, 3) == 3
    % Gambar berwarna
    disp('Processing color images...');
   
    I_red = I(:,:,1); I_green = I(:,:,2); I_blue = I(:,:,3);
    I2_red = I2(:,:,1); I2_green = I2(:,:,2); I2_blue = I2(:,:,3);

    % histogram matching
    I_new_red = matching(I_red, I2_red);
    I_new_green = matching(I_green, I2_green);
    I_new_blue = matching(I_blue, I2_blue);

    % menggabungkan setiap komponen rgb
    I_new = cat(3, I_new_red, I_new_green, I_new_blue);
else
    % Gambar grayscale
    disp('Processing grayscale images...');
    
    if size(I, 3) == 3
        I = rgb2gray(I); 
    end
    if size(I2, 3) == 3
        I2 = rgb2gray(I2); 
    end

    % histogram matching
    I_new = matching(I, I2);
end

figure,imshow(I); title("Gambar Asli"); 
figure,histogram(I); title("Histogram Gambar Asli");
figure,imshow(I2); title("Gambar Acuan"); 
figure,histogram(I2); title("Histogram Gambar Acuan");
figure,imshow(I_new); title("Gambar Hasil");
figure,histogram(I_new); title("Histogram Gambar Hasil");

function output_image = matching(image1, image2)
    [row, col] = size(image1);
    output_image = zeros(row, col);

    hist1 = compute_equalization(image1); % Gambar input
    hist2 = compute_equalization(image2); % Gambar acuan

 
    invHist = zeros(256,1);
    for i = 1:256
        [~, minj] = min(abs(hist1(i) - hist2));
        invHist(i) = minj - 1; % Sesuaikan indeks
    end

    for i = 1:row
        for j = 1:col
            output_image(i,j) = invHist(image1(i,j) + 1);
        end
    end
    
    output_image = uint8(output_image); 
end
