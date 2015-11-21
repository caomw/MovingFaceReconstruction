function [L,S] = InitialLightAndShapeEstimation(M)

%% The function estimates the initial lighting and the shape matrix
% Input is an nxp matrix where n is the number of warped images and p is
% the number of pixels in each of them.
%%

[U,D,V] = svd(M);

% The best rank four approximation would mean the singular vectors
% corresponding to 1st four singular values can be considered

D1 = zeros(4,4);
D1(1,1) = D(1,1);
D1(2,2) = D(2,2);
D1(3,3) = D(3,3);
D1(4,4) = D(4,4);

D_sqrt = D1.^0.5;

L = U(:,1:4)*D_sqrt;
V = V';
S = D_sqrt*V(1:4,:);
end