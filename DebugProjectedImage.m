function [I] = DebugProjectedImage(im, pixel_interp, p)
% Debug the projected image.
% Args:
%  im: M x N x 3 image.
%  pixel_interp: 3 x Q matrix. Each column contains (R,G,B) data.
%  p: The positions for each of those colors. p(:, i) = [x, y] => im(y, x)
%  = pixel_interp(:, i).

I = zeros(size(im));
for i = 1:size(pixel_interp, 2)
    u = round(p(2, i));
    v = round(p(1, i));
    rgb = pixel_interp(:, i);
    I(u, v, :) = rgb';
end

end

