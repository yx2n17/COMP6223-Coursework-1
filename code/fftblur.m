function image = fftblur(img, sigma, flag)
    img = double(img)/255;

    [h,w,s]=size(img);

    %template must be as big as the original image
    f1=-fix(h/2):ceil(h/2)-1;
    f2=-fix(w/2):ceil(w/2)-1;
    
    [fx,fy]=meshgrid(f1,f2);

    %Fourier Transform of Binary Gaussian Distribution
    X=exp(-(1/2*pi*pi*sigma*sigma)*((fx/h).^2+(fy/w).^2));
    image = real(ifft2(ifftshift(fftshift(fft2(img)) .* X')));
    
    if flag == 1
       image = img - image; 
    end
    
    imshow(image)
end