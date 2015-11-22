function [I2, I, Iz] = DebugProjectedImage(im, pixel_interp, p, z_values)
% Debug the projected image.
% Args:
%  im: M x N x 3 image.
%  pixel_interp: 3 x Q matrix. Each column contains (R,G,B) data.
%  p: The positions for each of those colors. p(:, i) = [x, y] => im(y, x)
%  = pixel_interp(:, i).
%  z_values: 3 x Q matrix. Each column contains the (X, Y, Z) values of
%  that point. (if thi arg is not provided, we return Iz = 0).
%  Returns:
%       I2: The cropped image.
%       I: The uncropped image.
%       Iz: size(I2, 1) x size(I2, 2) x 3 image. Iz(u, v, :) = [X, Y, Z].

I = zeros(8*size(im, 1), 8*size(im, 2), size(im, 3));

if ~exist('z_values', 'var') || isempty(z_values)
    compute_z = false;
    Iz = 0;
else
    compute_z = true;
    Iz = zeros(size(I));
end

min_u = Inf;
max_u = 0;
min_v = Inf;
max_v = 0;

for i = 1:size(pixel_interp, 2)
    u = round(p(2, i));
    v = round(p(1, i));
    tt = [u, v];
    if (sum(isnan(tt)) > 0)
        continue
    end
    if (sum(tt <= 0) > 0)
        continue
    end
    
    min_u = min(u, min_u);
    max_u = max(u, max_u);
    min_v = min(v, min_v);
    max_v = max(v, max_v);
    
    rgb = pixel_interp(:, i);
    I(u, v, :) = rgb';
    if compute_z
        Iz(u, v, :) = z_values(:, i)';
    end
end


I2 = I(min_u:max_u, min_v:max_v, :);
Iz = Iz(min_u:max_u, min_v:max_v, :);
end

