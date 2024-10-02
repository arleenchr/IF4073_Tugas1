% Plot / visualize histogram
function plot_histogram(hist_data, img_title, color)
    bar(0:255, hist_data, 'FaceColor', color, 'EdgeColor', color);
    title(img_title);
    xlabel('Intensity Level');
    ylabel('Frequency');
    xlim([0 255]);
end