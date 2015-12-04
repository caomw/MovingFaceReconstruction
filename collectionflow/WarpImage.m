function [I2] = WarpImage(I, vx, vy)
%UNTITLED69 Summary of this function goes here
%   Detailed explanation goes here

m = size(I, 1);
n = size(I, 2);

[X, Y] = meshgrid(1:n, 1:m);
Xq = X + vx;
Yq = Y + vy;
I2 = interp2(X, Y, I, Xq, Yq);

end

