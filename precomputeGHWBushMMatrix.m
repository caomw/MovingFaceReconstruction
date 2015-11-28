dir_name = 'lfw/George_W_Bush';
s = dir(sprintf('%s/*.jpg', dir_name));

num_images = size(s, 1);
db_images = cell(num_images, 1);
c = 0;
for i = 1:num_images
    fname = sprintf('%s/%s', dir_name, s(i).name);
    I = imread(fname);
    [DETS, PTS, DESCS, success] = getFiducial(I);
    if success
        c = c + 1;
        db_images{c} = struct('im', I, 'fiduc', PTS, 'fname', fname);
    else
        fprintf('Ignoring %s since getFiduc() failed.\n', fname);
    end
end
db_images = db_images(1:c);
save('gw_bush_images_fiducs.mat', 'db_images');