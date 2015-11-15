function [S_est] = LightAndShapeEstimation(M,L,S)

%% Function to estimate surface normals at each pixel in the 3D model


thresh = 1 % Play around with this threshold
S_est = zeros(size(S));

for i = 1:size(M,2)
    
    M_train = [];
    L_train = [];
    for j = 1:size(M,1)
        
        M_j = M(j,i);
        S_j = S(:,i);
   
        dist = (M_j - L(j,:)*S_j)^2;
        
        if dist < thresh
            % Add image to the training set
            M_train = [M_train;M_j];
            L_train = [L_train;L_j];
        end
    end
    % Estimate S_j over these images
    S_est(:,i) = inv(L_train'*L_train + diag([-1;1;1;1]))*L_train'*M_train;
end

end