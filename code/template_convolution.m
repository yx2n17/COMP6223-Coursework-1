function testimage = template_convolution(img, template, flag)
    %load image in and convert it to single 
    image = im2single(img);
    
    %get template attributions
    [trows, tcols] = size(template);
    trhalf = floor(trows/2);
    tchalf = floor(tcols/2);
    
    %different situation between grey value image and coloured image
    if length(size(image)) == 2
        channels = 1;
        [irows, icols] = size(image);
        tcimage = zeros([size(image), channels] + [2 * trhalf 2 * tchalf 0]);
    else
        [irows, icols, channels] = size(image);
        tcimage = zeros(size(image) + [2 * trhalf 2 * tchalf 0]);
    end
    
    %Template Convolution process
    for x = 1 : tcols
        for y = 1 : trows
            for c = 1 : channels
                tcimage(y : end - (trows - y),x : end - (tcols - x), c) = tcimage(y : end - (trows - y), x : end - (tcols - x), c) + image(:, :, c) * template(y, x);
            end
        end
    end
    
    testimage = zeros(size(image));
    
    %Cut it to suitable size
    if flag == 0
        for c = 1 : channels
            testimage(trhalf + 1:end-trhalf,tchalf + 1:end-tchalf, c) = tcimage(2 * trhalf + 1:end-2*trhalf, 2 * tchalf + 1:end-2*tchalf, c);
        end
    else if flag == 1
        for c = 1 : channels
            testimage(:, :, c)= tcimage(trhalf + 1:end-trhalf, tchalf + 1:end-tchalf, c);
        end
    end
end

