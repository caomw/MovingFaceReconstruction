f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;

im = imread('lfw/George_HW_Bush/George_HW_Bush_0011.jpg');
[I2, I] = MakeFrontalFace(im, templateFiduc, locs);
figure;
imshow(I2);

figure;
imshow(I);