function [M3, flow_norm] = RunCollectionFlowIkI1Inv(M_orig, k, m, para)
% Run the collection flow algorithm.
%   M_orig: Original M matrix (num_pixels x num_images) matrix.
%   k: The k to perform rank-k approximization.
%   m: Each column is a vectorized image of dim m x [x].
%   para: The parameters for Coarse2FineTwoFrames.

% In OpticalFlow.cpp, Coarse2FineTwoFrames(Im1, Im2) -> Im1 = frame 1, Im2
% -> frame 2, warpI2 is frame2 warped using the flow. So warpI2 should be
% the "inverse warp" mentioned in the paper.

fprintf('running svd...\n');
tic
[u, s, v] = svd(M_orig);
u = u(:, 1:k);
s = s(1:k, 1:k);
v = v(:, 1:k);
M_k = u*s*v';
toc

num_images = size(M_orig, 2);
M3 = zeros(size(M_orig));
flow_norm = zeros(num_images, 1);
fprintf('Starting flow...\n');
tic
for i = 1:num_images
    I_original = M_orig(:, i);
    I_original = reshape(I_original, m, []);
    
    I_rank_k = M_k(:, i);
    I_rank_k = reshape(I_rank_k, m, []);
    
    [vx, vy, I3] = Coarse2FineTwoFrames(I_rank_k, I_original, para);
    %[vx, vy, I3] = Coarse2FineTwoFrames(I_original, I_rank_k, para);
    I3 = WarpImage(I_original, vx, vy);
    I3(isnan(I3)) = 0;
    
    M3(:, i) = reshape(I3, [], 1);
    flow_norm(i) = norm(vx(:)) + norm(vy(:));
    if (mod(i, 100) == 1)
        fprintf('i=%d of %d (%2.4f%%)\n', i, num_images, 100*i/num_images);
    end
end
toc

end

