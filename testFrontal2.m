f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;

im = imread('lfw/George_HW_Bush/George_HW_Bush_0002.jpg');
[DETS,PTS,DESCS] = getFiducial(im);
DebugPoint(im, PTS);

return;
figure;
imshow(im);
I2 = MakeFrontalFace(im, templateFiduc, locs);
figure;
imshow(I2);

