function [] = DebugPoint(im, pts)
% Draw a small square at p(x, y) on im, so we know where is (x, y).
% im: image with 3 channels.
% pts: 2 x N matrix. The i-th column is the i-th point
im2 = im;
for i = 1:size(pts, 2)
    im2 = insertText(im2, [pts(1, i) pts(2, i)], int2str(i));
end

figure;
imshow(im2);
return

width = 3;
p = round(p);
x = p(2);
y = p(1);
color = [255, 0, 0];
for i = 1:3
im(x-width:x+width, y-width:y+width, i) = color(i);
end
figure;
imshow(im);

end

