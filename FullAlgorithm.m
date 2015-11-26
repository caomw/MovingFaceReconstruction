% Load Point Cloud, images and do pose estimation

f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;
GetS_t;

 im = imread('lfw/George_HW_Bush/George_HW_Bush_0003.jpg');
 [I2, ~, Iz] = MakeFrontalFace(im, templateFiduc, locs);
 sx = size(I2,1);
 sy = size(I2,2);

 db = load('ghw_bush_images_fiducs.mat');
for i = 1:10
    i
    %load M_GeorgeBush.mat
    GetS_t;
    [M] = GetMMatrix(db.db_images, templateFiduc, locs);
    
    [L,S] = InitialLightAndShapeEstimation(M);
    [S_est] = LocalSurfaceNormalEstimation(M,L,S);
    [L,S] = AmbiguityRecovery(M,S_est, S_t);
    [Z_true] = Integration(S,sx,sy);
    [locs] = ChangeTemplate(locs,Z_true,Iz);
    
end
%
% % N = 10;
% % p = 10000;
% % sx = 100; % Size in X direction
% % sy = 100; % Size in Y direction
% % M = rand(N,p);
% % 
% % 
% % normal = pcnormal(ptcloud);
% % 
% % [L,S] = LightAndShapeEstimation(M);
% % 
% % [S_est] = SurfaceNormalEstimation(M,L,S);
% % 
% % % img is a pX36x3 where the second dimension is the patch and third is
% % % [x,y,z]
% % 
% % img = rand(p,36,3);
% [normals] =  computeNormals(img);

% [L,S] = AmbiguityRecovery(M,S, normals);
%
% [Z_true] = Integration(S,sx,sy);


