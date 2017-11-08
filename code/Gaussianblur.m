function I = Gaussianblur(img, sigma, flag)
    %load image in and normalisation
    image = double(img)/255;
%   image = double(imread('../data/dog.bmp'))/255;
%   sigma = 5;
%   flag = 1;

    %define Gaussian Filter Size
    siz = 4 * sigma + 1;
    if mod(siz, 2) == 0
        siz = siz + 1;
    end
    
    %mapping Gaussian distribution
    f1=-fix(siz/2):ceil(siz/2)-1;
    temp = zeros(siz, siz);
    sum = 0;
    for i = f1
        for j = f1
            temp((siz-1)/2+i+1,(siz-1)/2+j+1)= 1/(2*pi*sigma^2)* exp(-1*(i^2+j^2)/(2*sigma^2));
            sum = sum + temp((siz-1)/2+i+1,(siz-1)/2+j+1);
        end
    end
    temp = temp ./ sum;
    
    %flag == 1 means high pass, flag == 0 means low pass
    if flag == 1
        I =image - template_convolution(image, temp, 1);
    else
        I = template_convolution(image, temp, 1);
    end
    %imshow(I)
end