function hyimage = hybrid_image(image1, image2, hc_frequency, lc_frequency)     
    
    %get low pass image
    low_frequencies = Gaussianblur(image1, lc_frequency, 0);
    
    %get high pass image
    high_frequencies = Gaussianblur(image2, hc_frequency, 1);
    
    %get hybrid image
    hyimage = low_frequencies + high_frequencies;

%     figure(1); imshow(low_frequencies);
%     figure(2); imshow(high_frequencies + 0.5);
%     figure(3); imshow(vis_hybrid_image(hyimage););
    
end