% Load Point Cloud, images and do pose estimation

f = load('init_face_data1.mat');
templateFiduc = f.templateFiduc;
locs = f.locs;
%GetS_t;
dir_name = 'lfw/George_W_Bush';

%  im = imread('lfw/George_HW_Bush/George_HW_Bush_0003.jpg');
%  [I2, ~, Iz] = MakeFrontalFace(im, templateFiduc, locs);
%  sx = size(I2,1);
%  sy = size(I2,2);
th = 0;
 db = load('gw_bush_images_fiducs.mat');
 LOCS = cell(20,1);
 L_all = cell(20,1);
 S_all = cell(20,1);
 M_all = cell(20,1);
 count = 0;

%R2 = CreateRotation(pi/2, 0, pi/9);
%t2 = [0; 60];
R2 = CreateRotation(0,0,0);
%R2(2,1) = 1;
t2 = [0;0];
load gwbush_M;
    Iz = fullIz;
    M = fullM;
    
for i = 1:10
    i
    %load M_GeorgeBush.mat
    if i > 1
    [M, Iz] = GetMMatrix(db.db_images, templateFiduc, locs, R2, t2);
    end
    %[M, Iz] = GetMMatrix(db.db_images, templateFiduc, locs);
    
    GetS_t;
    
    [L,S] = InitialLightAndShapeEstimation(M);
   % DebugInitLightAndShape;
    [S_est] = LocalSurfaceNormalEstimation(M,L,S);
    [L,S] = AmbiguityRecovery(M,S_est, S_t);
   % DebugInitLightAndShape;
    [Z_true] = Integration(S,sx,sy);
    z = reshape(Z_true,sx,sy);
    Mflat = LoadAsParts('flat_rgb_gbush');
    im = reshape(Mflat(:,58),[150,116,3]);
    
    %fiduc = [[63;101;-27.93],[57;68;-45.59],[59;49;-43.65],[59;22;-32.59],[91;76;-41.6],[85;59;-55.65],[90;45;-45.44],[116;80;-35.97],[112;34;-36.59]];
    fiduc = [[63;101;z(63,101)],[57;68;z(57,68)],[59;49;z(59,49)],[59;22;z(59,22)],[91;76;z(91,76)],[85;59;z(85,59)],[90;45;z(90,45)],[116;80;z(116,80)],[112;34;z(112,34)]];
    fiduc = fiduc + [zeros(1,9);zeros(1,9);50*ones(1,9)];
    templateFiduc = fiduc;
   %  tem = templateFiduc(2,:);
   %  templateFiduc(2,:) = templateFiduc(1,:);
   %I  templateFiduc(1,:) = tem;
    load Fiduc_Glass.mat %loads variable fiduc_grass 3x4
    % Estimate sRT, then add the transformed co-ordinates onto it.
    debugIntegration_glass
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


