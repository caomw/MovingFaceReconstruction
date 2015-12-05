function [M3, flow_norm] = RunCollectionFlow(M_orig, k, im_size, para)
% Run the collection flow algorithm.
%   M_orig: Original M matrix (num_pixels x num_images) matrix.
%   k: The k to perform rank-k approximization.
%   im_size: 3-vector to un-vectorize the image.
%   para: The parameters for Coarse2FineTwoFrames.

% In OpticalFlow.cpp, Coarse2FineTwoFrames(Im1, Im2) -> Im1 = frame 1, Im2
% -> frame 2, warpI2 is frame2 warped using the flow. So warpI2 should be
% the "inverse warp" mentioned in the paper.

fprintf('running pca-approx...\n');
tic
[u, s, v] = pca_approx(M_orig, k);
M_k = u*s*v';
toc

num_images = size(M_orig, 2);
M3 = zeros(size(M_orig));
flow_norm = zeros(num_images, 1);
fprintf('Starting flow...\n');
tic
for i = 1:num_images
    I_original = M_orig(:, i);
    I_original = reshape(I_original, im_size);
    
    I_rank_k = M_k(:, i);
    I_rank_k = reshape(I_rank_k, im_size);
    
    [vx, vy, ~] = Coarse2FineTwoFrames(I_rank_k, I_original, para);
    
    I3 = WarpColorImage(I_original, vx, vy);
    I3(isnan(I3)) = 0;
    M3(:, i) = reshape(I3, [], 1);
    flow_norm(i) = norm(vx(:)) + norm(vy(:));
    
    if (mod(i, 50) == 1)
        fprintf('i=%d of %d (%2.4f%%)\n', i, num_images, 100*i/num_images);
        toc
        tic
    end
end
toc

end

