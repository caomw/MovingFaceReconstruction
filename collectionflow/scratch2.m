dir_name = '../lfw/George_W_Bush';
s = dir(sprintf('%s/*.jpg', dir_name));

num_images = size(s, 1);
db_images = cell(num_images, 1);
for i = 1:num_images
    fname = sprintf('%s/%s', dir_name, s(i).name);
    I = imread(fname);
    [DETS, PTS, DESCS] = getFiducial(I);
    db_images{i} = struct('im', I, 'fiduc', PTS, 'fname', fname);
end

save('gw_bush_images_fiducs.mat', 'db_images');

return;
m = 150;
n = 116;

I_orig = reshape(M(:, 2), 150, []);
I_k = reshape(M2(:, 2), 150, []);

figure;
imshow(I_orig);
figure;
imshow(I_k);

[vx,vy,warpI2] = Coarse2FineTwoFrames(I_k,I_orig,para);

[X, Y] = meshgrid(1:n, 1:m);
Xq = X - vx;
Yq = Y - vy;
I3 = interp2(X, Y, I_orig, Xq, Yq);

figure;
imshow(I3);

figure;
imshow(warpI2);

return;
figure;
imshow(I_orig);
figure;
imshow(I_k);

[vx,vy,warpI2] = Coarse2FineTwoFrames(I_k,I_orig,para);


%figure;
%imshow(warpI2);