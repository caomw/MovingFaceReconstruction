f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;

dir_name = 'lfw/George_HW_Bush';
M = GetMMatrix(dir_name, templateFiduc, locs);
save('GeorgeHWBush_M.mat', 'M')

