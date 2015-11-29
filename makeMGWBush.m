f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;

db = load('gw_bush_images_fiducs.mat')
tic
[fullM, fullIz] = GetMMatrix(db.db_images, templateFiduc, locs);
toc
