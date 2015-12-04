function [] = ShowImages(I1, I2, title_str)
%UNTITLED73 Summary of this function goes here
%   Detailed explanation goes here

figure;
subplot(1, 2, 1);
imshow(I1);
subplot(1, 2, 2);
imshow(I2);
title(title_str);

end

