addpath('OpticalFlow');
mrgb = Loadrgbfrontalfaces();
num_images = numel(mrgb);
[m, n, p1] = size(mrgb{1});
para = get_default_cflow_para();

M = zeros(m*n*p1, num_images);
for i = 1:num_images
    M(:, i) = reshape(mrgb{i}, [], 1);
end
M(isnan(M)) = 0;

k = 4;
max_iter = 5;
M_flat = M;

flow_norm_thresh = 5;
for i = 1:max_iter
    [M_flat, flow_norm] = RunCollectionFlow(M_flat, k, [m, n, p1], para);
     i
    ff = norm(flow_norm)
    if( ff < flow_norm_thresh)
        break;
    end
    k = k + 1;
end


for i = 1:30
    I = reshape(M_flat(:, i), [m, n, p1]);
    I_orig = reshape(M(:, i), [m, n, p1]);
    figure;
    subplot(1, 2, 1);
    imshow(I_orig);
    subplot(1, 2, 2);
    imshow(I);
end
return;

k1 = 25;
k2 = 15;
I_original = reshape(M(:, k1), [m, n, p1]);
I_rank_k = reshape(M2(:, k2), [m, n, p1]);

[vx, vy, ~] = Coarse2FineTwoFrames(I_rank_k, I_original, para);
%[vx, vy, I3] = Coarse2FineTwoFrames(I_original, I_rank_k, para);
I3 = WarpColorImage(I_original, vx, vy);
%I3(isnan(I3)) = 0;

ShowImages(I_original, I3, 'f1');
ShowImages(I_original, I_rank_k, 'f1');
