function output = downsampling_hybrid_image(hybrid_image)
    %downsampling parameters, set by default
    numbers = 5; 
    devided_by = 0.5; 
    gap = 2;
    
    height = size(hybrid_image,1);
    channels = size(hybrid_image,3); 
    output = hybrid_image;
    cur_image = hybrid_image;
    
    %looping for downsampling and concatenate
    for i = 1 : numbers - 1
        %Add a gap everytime a new image is going to cat
        output = cat(2, output, ones(height, gap, channels));
        cur_image = imresize(cur_image, devided_by);
        tmp = cat(1, ones(height - size(cur_image, 1), size(cur_image, 2), channels), cur_image);
        output = cat(2, output, tmp);
    end
end
