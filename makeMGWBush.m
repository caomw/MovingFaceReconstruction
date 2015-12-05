f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;

db = load('gw_bush_images_fiducs.mat')

R2 = CreateRotation(pi/2, 0, pi/9);
t2 = [0; 60];

tic
[fullM, fullIz, Mrgb] = GetMMatrix(db.db_images, templateFiduc, locs, R2, t2);
toc

save('gwbush_mrgb.mat', 'fullM', 'fullIz', 'Mrgb');
