addpath('..');

S_r = 150;

num_images = size(M_iter_1, 2);
for i = 1:num_images
    I = reshape(M_iter_1(:, i), S_r, []);
    I_orig = reshape(M(:, i), S_r, []);
    figure;
    subplot(1, 2, 1);
    imshow(I_orig);
    subplot(1, 2, 2);
    imshow(I);
end

return;
I_orig = reshape(M(:, 8), S_r, []);
I_k = reshape(M2(:, 8), S_r, []);

figure;
imshow(I_orig);
figure;
imshow(I_k);

return;
M = MCopy';
[u, s, v] = svd(M);
k = 4;
u = u(:, 1:k);
s = s(1:k, 1:k);
v = v(:, 1:k);
M2 = u*s*v';
for i = 1:size(M2, 2)
    I = reshape(M2(:, i), 150, []);
    figure;
    subplot(1, 2, 1);
    imshow(I);
    subplot(1, 2, 2);
    I = reshape(M(i, :), 150, []);
    imshow(I);
end
return;
if false
rows_to_skip = [8, 2];
nn = true(size(M, 1), 1);
nn(rows_to_skip) = false;
M = M(nn, :);

for i = 1:size(M, 1)
    I = M(i, :);
    I = reshape(I, 150, []);
    figure;
    imshow(I);
end
end


return
f = load('../init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;

db = load('../ghw_bush_images_fiducs.mat')
tic
M = GetMMatrix(db.db_images, templateFiduc, locs);
toc

