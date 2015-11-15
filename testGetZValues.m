f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;

im = imread('lfw/George_HW_Bush/George_HW_Bush_0003.jpg');
[I2, ~, Iz] = MakeFrontalFace(im, templateFiduc, locs);
figure;
imagesc(Iz(:, :, 3));
figure;
imshow(I2);