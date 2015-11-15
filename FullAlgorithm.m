% Load Point Cloud, images and do pose estimation


%
N = 10;
p = 10000;
sx = 100; % Size in X direction
sy = 100; % Size in Y direction
M = rand(N,p);


normal = pcnormal(ptcloud);

[L,S] = LightAndShapeEstimation(M);

[S_est] = SurfaceNormalEstimation(M,L,S);

% img is a pX36x3 where the second dimension is the patch and third is
% [x,y,z]

img = rand(p,36,3);
[normals] =  computeNormals(img);

[L,S] = AmbiguityRecovery(M,S, normals);

[Z_true] = Integration(S,sx,sy);


