%
I = im2double(imread('cameraman.tif'));
figure;
subplot(1, 2, 1);
imshow(I);
vx = 15*ones(size(I));
vy = 15*ones(size(I));
I2 = WarpImage(I, vx, vy);
subplot(1, 2, 2);
imshow(I2);

return;

if false
[vx, vy, I3] = flow(I_orig, Ik)
     I4 = I3;
     I4 = warp(I_orig, vx, vy)
     I4 = warp(I_orig, -vx, -vy)
     I4 = warp(Ik, vx, vy)
     I4 = warp(Ik, -vx, -vy)
[vx, vy, I3] = flow(Ik, I_orig)
     I4 = I3;
     


%
end

k = 4;

if false
f = load('../gwbush_M_300_refined.mat');
M = f.M';
[u, s, v] = svd(M);
u = u(:, 1:k);
s = s(1:k, 1:k);
v = v(:, 1:k);
M_k = u*s*v';
end

I1 = reshape(M(:, 95), 150, []);
Ik = reshape(M2(:, 95), 150, []);
figure;
subplot(1, 2, 1);
imshow(I1);
subplot(1, 2, 2);
imshow(Ik);
para = get_default_cflow_para();

[vx, vy, warpI2] = Coarse2FineTwoFrames(Ik, I1, para);
figure;
subplot(1, 2, 1);
imshow(warpI2);

I3 = WarpImage(I1, -vx, -vy);
subplot(1, 2, 2);
imshow(I3);
