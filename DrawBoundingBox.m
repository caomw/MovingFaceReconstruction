function [new_im] = DrawBoundingBox(im, ilim, jlim)
% Given an rgb image and [i1:i2] and [j1:j2], draw a bounding box.

new_im = im2double(im);
width = 2;
color = [0, 1, 0];

for i = 1:2
    for k = 1:3
        new_im(ilim(i)-width:ilim(i)+width, jlim(1):jlim(2), k) = color(k);
    end
end

for j = 1:2
    for k = 1:3
        new_im(ilim(1):ilim(2), jlim(j)-width:jlim(j)+width, k) = color(k);
    end
end

end

