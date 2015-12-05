
mrgb = Loadrgbfrontalfaces();
f = load('gwbush_M_flat.mat');
M = f.M;
Mflat = f.M_iter_1;
S_r = 150;
para = get_default_cflow_para();

k1 = 55;
I1 = reshape(M(:, k1), S_r, []);
I1f = reshape(Mflat(:, k1), S_r, []);
Irgb1 = mrgb{k1};

k2 = 57;
I2 = reshape(M(:, k2), S_r, []);
I2f = reshape(Mflat(:, k2), S_r, []);
Irgb2 = mrgb{k2};

ShowImages(Irgb1, Irgb2, 'morph input');
mv = MakeMorphVideo(I1, I1f, I2, I2f, 15, Irgb1);
implay(mv);