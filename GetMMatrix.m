function [M] = GetMMatrix(dir_name, templateFiduc, locs)
% Get the M matrix for a given directory.
%   Returns n (num_images) x p (num_pixels) matrix. Each entry is the
%   grayscale value.

s = dir(sprintf('%s/*.jpg', dir_name));
im = imread(sprintf('%s/%s', dir_name, s(1).name));
I2 = MakeFrontalFace(im, templateFiduc, locs);
p = size(I2, 1)*size(I2, 2);

num_images = size(s, 1);
M = zeros(num_images, p);
for i = 1:num_images
    fname = sprintf('%s/%s', dir_name, s(i).name);
    I2 = im2double(...
        rgb2gray(MakeFrontalFace(imread(fname), templateFiduc, locs)));
    M(i, :) = reshape(I2, 1, []);
end

end

