% Load Point Cloud, images and do pose estimation

f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;
%GetS_t;
dir_name = 'lfw/George_HW_Bush';

%  im = imread('lfw/George_HW_Bush/George_HW_Bush_0003.jpg');
%  [I2, ~, Iz] = MakeFrontalFace(im, templateFiduc, locs);
%  sx = size(I2,1);
%  sy = size(I2,2);
th = 0;
 db = load('ghw_bush_images_fiducs.mat');
 LOCS = cell(20,1);
 L_all = cell(20,1);
 S_all = cell(20,1);
 M_all = cell(20,1);
 count = 0;

R2 = CreateRotation(pi/2, 0, pi/9);
t2 = [0; 60];

for i = 1:10
    i
    %load M_GeorgeBush.mat
    [M, Iz] = GetMMatrix(db.db_images, templateFiduc, locs, R2, t2);
    GetS_t;
    
    [L,S] = InitialLightAndShapeEstimation(M);
   % DebugInitLightAndShape;
    [S_est] = LocalSurfaceNormalEstimation(M,L,S);
    [L,S] = AmbiguityRecovery(M,S_est, S_t);
   % DebugInitLightAndShape;
    [Z_true] = Integration(S,sx,sy);
    [locs] = ChangeTemplate(locs,Z_true,Iz);
    a = svd(M);
    th_old = th;
    th = a(5) + a(6);
    count = count + 1;
    LOCS{count} = locs;
    L_all{count} = L;
    S_all{count} = S;
    M_all{count} = M;
    if abs(th_old - th) < 0.001
        th_old - th
        break;
    end
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


