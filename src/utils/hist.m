%image = imread('../../images/peppers512warna.bmp');
image = imread('../../images/peppers.bmp');
imshow(image);
histogram(image);

function histogram(image)
    if size(image, 3) == 1
        % Grayscale image
        histogram_data = compute_histogram(image);
        plot_histogram(histogram_data, 'Grayscale', 'k');
    else
        % Colored image
        r_hist = compute_histogram(image(:, :, 1));
        g_hist = compute_histogram(image(:, :, 2));
        b_hist = compute_histogram(image(:, :, 3));
        
        figure;
        subplot(3, 1, 1);
        plot_histogram(r_hist, 'Red', 'r');
        subplot(3, 1, 2);
        plot_histogram(g_hist, 'Green', 'g');
        subplot(3, 1, 3);
        plot_histogram(b_hist, 'Blue', 'b');
    end
end

% Compute histogram data
function hist_data = compute_histogram(channel)
    hist_data = zeros(1, 256);
    
    for i = 1:size(channel, 1)
        for j = 1:size(channel, 2)
            intensity = channel(i, j);
            hist_data(intensity + 1) = hist_data(intensity + 1) + 1;
        end
    end
end

% Plot / visualize histogram
function plot_histogram(hist_data, img_title, color)
    bar(0:255, hist_data, 'FaceColor', color, 'EdgeColor', color);
    title(img_title);
    xlabel('Intensity Level');
    ylabel('Frequency');
    xlim([0 255]);
end


