f = load('gwbush_M_flat.mat')

para = get_default_cflow_para();
M = f.M;
Mflat = f.M_iter_1;
S_r = f.S_r;


k = 22
I1 = reshape(M(:, 22), S_r, []);
I1f = reshape(Mflat(:, 22), S_r, []);


I2 = reshape(M(:, 67), S_r, []);
I2f = reshape(Mflat(:, 67), S_r, []);

ShowImages(I1, I1f);
ShowImages(I2, I2f);

[vx1, vy1, w1] = Coarse2FineTwoFrames(I1, I1f, para);
[vx2, vy2, ~] = Coarse2FineTwoFrames(w1, I2, para);

ShowImages(I1, w1);

I3 = WarpImage(I1, vx1 + vx2, vy1 + vy2);
ShowImages(I1, I3);
