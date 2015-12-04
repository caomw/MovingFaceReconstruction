function [S_est] = LocalSurfaceNormalEstimation(M,L,S)

%% Function to estimate surface normals at each pixel in the 3D model


thresh = 0.001; % Play around with this threshold
S_est = zeros(size(S));
count = 0;
for i = 1:size(M,2)
    
    M_train = [];
    L_train = [];
    dist = (M(:,i) - L*S(:,i)).^2;
    su = sum(dist);
    if sum(dist) == 0
        su = 1;
    end
    dist = dist./su;
    idx = find(dist < thresh)
    size(idx)/500
    L_train = L(idx,:);
    M_train = M(idx,i);
    if size(idx,1) < 4
        idx = find(dist < 1)
         L_train = L(idx,:);
        M_train = M(idx,i);
    end
%     for j = 1:size(M,1)
%         
%         M_j = M(j,i);
%         S_j = S(:,i);
%         L_j = L(j,:);
%         dist = (M_j - L(j,:)*S_j)^2;
%         
%         if dist < thresh
%             % Add image to the training set
%             M_train = [M_train;M_j];
%             L_train = [L_train;L_j];
%            
%         end
%     end
    % Estimate S_j over these images
    S_est(:,i) = (L_train'*L_train + diag([-1;1;1;1]))\(L_train'*M_train);
    
end

end