f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;

%im = imread('lfw/George_HW_Bush/George_HW_Bush_0011.jpg');
im = imread('lfw/George_HW_Bush/George_HW_Bush_0001.jpg');
I2 = MakeFrontalFace(im, templateFiduc, locs);
p = size(I2, 1)*size(I2, 2);

dir_name = 'lfw/George_HW_Bush';
M = GetMMatrix(dir_name, templateFiduc, locs);
save('GeorgeHWBush_M.mat', 'M')

