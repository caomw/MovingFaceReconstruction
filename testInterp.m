im = imread('lfw/George_HW_Bush/George_HW_Bush_0010.jpg');

% Get an image from (60, 40) -> (180, 200).
c = 0;
p = [];
ilim = [40, 200];
jlim = [60, 180];

for i = ilim(1):ilim(2)
    for j = jlim(1):jlim(2)
        noise = normrnd(0, 0.1);
        p = [p; j+noise i+noise];
    end
end
p = p';

pixel_interp = GetImagePixelValues(im, p);

% Reshape the image and view it.
I = DebugProjectedImage(im, pixel_interp, p);
figure;
imshow(I);

% Make sure that the bounding box in image matches with what we're
% grabbing.
im2 = DrawBoundingBox(im, ilim, jlim);
figure;
imshow(im2);