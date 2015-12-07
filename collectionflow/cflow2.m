%f = load('../gwbush_M_300_refined.mat');
mrgb = Loadrgbfrontalfaces();
num_images = numel(mrgb);

[m, n, k] = size(mrgb{1});
M = zeros(m*n*k, num_images);
for i = 1:num_images
    M(:, i) = reshape(mrgb{i}, [], 1);
end

para = get_default_cflow_para();

max_iter = 5;
M_orig = M;

M_iter_1 = M_orig;
k = 4;

flow_norm_thresh = 5;
S_r = 150;

for i = 1:max_iter
    tic
    [Mnew, flow_norm] = RunCollectionFlowIkI1Inv(M_iter_1, k, S_r, para);
    toc
    M_iter_1 = Mnew;
    i
    ff = norm(flow_norm)
    if( ff < flow_norm_thresh)
        break;
    end
    k = k + 1;
end

%save('gwbush_M_flat.mat', 'M', 'M_iter_1', 'S_r');

%num_images = size(M_iter_1, 2);
for i = 1:30
    I = reshape(M_iter_1(:, i),[m, n, k]);
    I_orig = reshape(M(:, i), [m, n, k]);
    figure;
    subplot(1, 2, 1);
    imshow(I_orig);
    subplot(1, 2, 2);
    imshow(I);
end