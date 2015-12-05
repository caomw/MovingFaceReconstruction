function [I2] = WarpColorImage(I, vx, vy)
% Warp a color image instead of a grayscale image.

k = size(I, 3);
if (k == 1)
    I2 = WarpImage(I, vx, vy);
    return;
end

I2 = zeros(size(I));
for i = 1:k
    I2(:, :, i) = WarpImage(I(:, :, i), vx, vy);
end

end

