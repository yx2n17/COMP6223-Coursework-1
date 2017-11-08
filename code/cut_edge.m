function img = cut_edge(image, siz)
    %abandoned
    %using cut_edge to cut edge off 
    [M, N, c] = size(image);
    horizontal = zeros(floor(siz/2), N, 3);
    vertical = zeros(M, floor(siz/2), 3);
    image(1:floor(siz/2), 1:N, :) = horizontal;
    image(M - floor(siz/2) +1:M, 1:N, :) = horizontal;
    image(1:M, 1:floor(siz/2), :) = vertical;
    image(1:M, N - floor(siz/2) + 1 : N, :) = vertical;
    img = image;
end
