f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;

db = load('ghw_bush_images_fiducs.mat')
tic
M = GetMMatrix(db.db_images, templateFiduc, locs);
toc