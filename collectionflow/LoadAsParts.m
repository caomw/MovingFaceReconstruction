function [M] = LoadAsParts(prefix)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

num_parts = 10;
M = [];
for i = 1:(num_parts - 1)
    f = load(sprintf('%s_part_%d_of_%d.mat', prefix, i, num_parts-1));
    M(:, f.start_i:f.end_i) = f.submatrix;
end
end

