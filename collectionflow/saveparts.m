num_parts = 10;
num_images = size(Mrgb, 1);
x = round(linspace(0, num_images, num_parts));
num_x = size(x, 2);
for i = 1:num_x-1
    start_i = x(i) + 1;
    end_i = x(i + 1);
    images = Mrgb(start_i:end_i);
    save(sprintf('mrgb_part_%d.mat', i), 'images', 'start_i', 'end_i');
end