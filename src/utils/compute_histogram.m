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