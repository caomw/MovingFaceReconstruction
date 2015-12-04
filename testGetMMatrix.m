f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;
R2 = CreateRotation(pi/2, 0, pi/9);
t2 = [0; 60];
db = load('ghw_bush_images_fiducs.mat')
tic
M = GetMMatrix(db.db_images, templateFiduc, locs, R2, t2);
toc
