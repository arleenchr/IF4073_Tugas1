function hist(image)
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
