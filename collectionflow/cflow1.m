
alpha = 0.012;
ratio = 0.75;
minWidth = 20;
nOuterFPIterations = 7;
nInnerFPIterations = 1;
nSORIterations = 30;

para = [alpha,ratio,minWidth,nOuterFPIterations,nInnerFPIterations,nSORIterations];

max_iter = 6;
M_orig = M;
M_k = M2;

M_iter_1 = M_orig;
k = 4;

flow_norm_thresh = 50;
S_r = 150;

for i = 1:max_iter
    tic
    [Mnew, flow_norm] = RunCollectionFlow(M_iter_1, k, S_r, para);
    toc
    M_iter_1 = Mnew;
    i
    ff = norm(flow_norm)
    if( ff < flow_norm_thresh)
        break;
    end
    k = k + 1;
end

num_images = size(M_iter_1, 2);
for i = 1:num_images
    I = reshape(M_iter_1(:, i), S_r, []);
    I_orig = reshape(M(:, i), S_r, []);
    figure;
    subplot(1, 2, 1);
    imshow(I_orig);
    subplot(1, 2, 2);
    imshow(I);
end