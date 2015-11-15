function [I2, I] = DebugProjectedImage(im, pixel_interp, p)
% Debug the projected image.
% Args:
%  im: M x N x 3 image.
%  pixel_interp: 3 x Q matrix. Each column contains (R,G,B) data.
%  p: The positions for each of those colors. p(:, i) = [x, y] => im(y, x)
%  = pixel_interp(:, i).

crop_image = true;

I = zeros(8*size(im, 1), 8*size(im, 2), size(im, 3));
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
end

if crop_image
    I2 = I(min_u:max_u, min_v:max_v, :);
else
    I2 = I;
end

end

