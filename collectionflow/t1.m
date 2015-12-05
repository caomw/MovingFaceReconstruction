r = randperm(505);
r = r(1:10)
num_r = numel(r);
imsize = [150 116 3];
for i = 1:num_r
    p = reshape(M(:, r(i)), imsize);
    p2 = reshape(Mflat(:, r(i)), imsize);
    ShowImages(p, p2, sprintf('image - %d', r(i)));
end