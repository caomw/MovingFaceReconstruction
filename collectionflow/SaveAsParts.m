function [] = SaveAsParts(Matrix, file_prefix)
% Mrgb: p_pixels x num_images matrix.
%   Detailed explanation goes here

num_parts = 10;
num_images = size(Matrix, 2);
x = round(linspace(0, num_images, num_parts));
num_x = size(x, 2);
for i = 1:num_x-1
    start_i = x(i) + 1;
    end_i = x(i + 1);
    submatrix = Matrix(:, start_i:end_i);
    save(sprintf('%s_part_%d_of_%d.mat', file_prefix, i, num_parts-1),...
        'submatrix', 'start_i', 'end_i');
end

end

