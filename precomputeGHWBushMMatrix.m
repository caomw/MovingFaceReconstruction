dir_name = 'lfw/George_HW_Bush';
s = dir(sprintf('%s/*.jpg', dir_name));

num_images = size(s, 1);
db_images = cell(num_images, 1);
for i = 1:num_images
    fname = sprintf('%s/%s', dir_name, s(i).name);
    I = imread(fname);
    [DETS, PTS, DESCS] = getFiducial(I);
    db_images{i} = struct('im', I, 'fiduc', PTS, 'fname', fname);
end

save('ghw_bush_images_fiducs.mat', 'db_images');