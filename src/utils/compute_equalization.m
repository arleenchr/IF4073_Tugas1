function hist_eq = compute_equalization(image)
    hist_frequency = compute_histogram(image);
    
    cdf = cumsum(hist_frequency) / numel(image) * size(image,3); 
  
    hist_eq = uint8(floor(cdf * 255));
end