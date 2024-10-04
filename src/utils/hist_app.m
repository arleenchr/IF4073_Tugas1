function hist_app(app, image, Axes)
    % Arahkan ke axes pada GUI
    axes(Axes);
    
    if size(image, 3) == 1
        % Gambar grayscale
        histogram_data = compute_histogram(image);
        cla(Axes); % Bersihkan axes sebelum plotting
        plot_histogram_app(histogram_data, 'Grayscale', 'k', Axes);
    else
        % Gambar berwarna
        r_hist = compute_histogram(image(:, :, 1));
        g_hist = compute_histogram(image(:, :, 2));
        b_hist = compute_histogram(image(:, :, 3));
        
        % Bersihkan axes sebelum plotting
        cla(Axes);
        
        % Plot histogram RGB dalam satu figure
        hold(Axes, 'on');
        plot_histogram_app(r_hist, 'Red', 'r', Axes);
        plot_histogram_app(g_hist, 'Green', 'g', Axes);
        plot_histogram_app(b_hist, 'Blue', 'b', Axes);
        hold(Axes, 'off');
    end
end

function plot_histogram_app(histogram_data, titleText, color, ax)
    bar(ax, histogram_data, 'FaceColor', color); % Plot pada axes yang diberikan
    title(ax, titleText); % Judul pada axes yang diberikan
end