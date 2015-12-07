addpath('OpticalFlow');
 
f = load('gwbush_M_flat.mat') 
%f = load('fullm_500.mat')
M = f.M;
Mflat = f.M_iter_1;
S_r = 150;
para = get_default_cflow_para();
%para = [0.1    0.7500   45.0000    1.0000    1.0000   55.0000];

k = 11
%k = 22;
I1 = reshape(M(:, k), S_r, []);
I1f = reshape(Mflat(:, k), S_r, []);

if true
    [vx1, vy1, wi] = Coarse2FineTwoFrames(I1, I1f, para);
    I3 = WarpImage(I1, -vx1, -vy1);
    ShowImages(I1, I1f, 'I1 and I1f');
    ShowImages(I1, I3, 'I1 and I3(trying to get flat)');
    return;
end

% 1. alpha = 0.012;
% 2. ratio = 0.75;
% 3. minWidth = 20;
% 4. nOuterFPIterations = 7;
% 5. nInnerFPIterations = 1;
% 6. nSORIterations = 30;

<<<<<<< Updated upstream

=======
opticFlow = opticalFlowHS;

ShowImages(I1, w1);
flow = estimateFlow(opticFlow,I2,I1);
flow1 = estimateFlow(opticFlow,I2);
vx = flow.Vx;
vy = flow.Vy;
I3 = WarpImage(I1,vx,vy);
%I3 = WarpImage(I1, vy1 , vx1 );
ShowImages(I1, I3);
>>>>>>> Stashed changes
