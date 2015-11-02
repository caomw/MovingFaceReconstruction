function [y, x_bar] = MeanNormalize(x)
% Given d(dim) x N (points) matrix, return d(dim) X N matrix with mean
% subtracted.

x_bar = mean(x, 2);
y = x - repmat(x_bar, 1, size(x, 2));
end