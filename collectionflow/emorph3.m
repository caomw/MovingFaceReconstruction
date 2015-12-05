if false
M = LoadAsParts('frontal_rgb_gbush');
Mflat = LoadAsParts('flat_rgb_gbush');
imsize = [150 116 3];
para = get_default_cflow_para();
end

k1 = 363;
I1 = reshape(M(:, k1), imsize);
I1f = reshape(Mflat(:, k1), imsize);


k2 = 261;
I2 = reshape(M(:, k2), imsize);
I2f = reshape(Mflat(:, k2), imsize);

mv = MakeMorphVideoColor(I1, I1f, I2, I2f, 25);
ShowImages(I1, I1f, 'im1');
ShowImages(I2, I2f, 'im2');
implay(mv);