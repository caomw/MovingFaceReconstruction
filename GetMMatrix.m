function [M, Iz] = GetMMatrix(db_images, templateFiduc, locs)
% Get the M matrix for a given directory.
%   Returns n (num_images) x p (num_pixels) matrix. Each entry is the
%   grayscale value.

db1 = db_images{1};
[I2, ~, Iz] = MakeFrontalFace(db1.im, db1.fiduc, templateFiduc, locs);
p = size(I2, 1)*size(I2, 2);

num_images = size(db_images, 1);
M = zeros(num_images, p);
tic
for i = 1:num_images
    db = db_images{i};
    I2 = im2double(...
        rgb2gray(MakeFrontalFace(db.im, db.fiduc, templateFiduc, locs)));
    M(i, :) = reshape(I2, 1, []);
    if(mod(i, 10) == 1)
        i
        toc
        tic
    end
end
toc

end

