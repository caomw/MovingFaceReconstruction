function [new_pixels] = GetImagePixelValues(im, p)
% Given an rgb image im and a 2 x N matrix p, find the pixel values.
%  Here if p(:, i) = [u; v], we retrieve im(v, u). (u, v) can be floats so
%  we interpolate.
% Return
%   3 x N matrix if im is colored.
%   1 x N matrix if im is grayscale.

im = im2double(im);
N = size(p, 2);
num_channels = size(im, 3);
new_pixels = zeros(num_channels, N);

for i = 1:num_channels
    ch_im = im(:, :, i);
    [m, n] = size(ch_im);
    [X, Y] = meshgrid(1:n, 1:m);
    Vq = interp2(X, Y, ch_im, p(1, :), p(2, :));
    new_pixels(i, :) = Vq;
end

end

