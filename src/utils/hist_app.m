function hist_app(app, image, redAxes, greenAxes, blueAxes)
    if size(image, 3) == 1
        cla(redAxes);
        cla(greenAxes);
        cla(blueAxes);
        % Grayscale image, hanya menggunakan redAxes
        histogram_data = compute_histogram(image);
        plot_histogram_on_axes(histogram_data, 'Grayscale', redAxes, 'k');
    else
        cla(redAxes);
        cla(greenAxes);
        cla(blueAxes);
        % Colored image, menggunakan ketiga axes
        r_hist = compute_histogram(image(:, :, 1));
        g_hist = compute_histogram(image(:, :, 2));
        b_hist = compute_histogram(image(:, :, 3));
        
        % Plot pada axes yang diberikan
        plot_histogram_on_axes(r_hist, 'Red', redAxes, 'r');
        plot_histogram_on_axes(g_hist, 'Green', greenAxes, 'g');
        plot_histogram_on_axes(b_hist, 'Blue', blueAxes, 'b');
    end
end

function plot_histogram_on_axes(histogram_data, color_name, axesHandle, color)
    bar(axesHandle, histogram_data, 'FaceColor', color);
    title(axesHandle, [color_name, ' Histogram']);
    xlabel(axesHandle, 'Intensity');
    ylabel(axesHandle, 'Frequency');
end