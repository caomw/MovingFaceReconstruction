I_orig = reshape(M(:, 2), 150, []);
I_k = reshape(M2(:, 2), 150, []);

figure;
imshow(I_orig);
figure;
imshow(I_k);

alpha = 0.012;
ratio = 0.75;
minWidth = 20;
nOuterFPIterations = 7;
nInnerFPIterations = 1;
nSORIterations = 30;

para = [alpha,ratio,minWidth,nOuterFPIterations,nInnerFPIterations,nSORIterations];

% this is the core part of calling the mexed dll file for computing optical flow
% it also returns the time that is needed for two-frame estimation
tic;
[vx,vy,warpI2] = Coarse2FineTwoFrames(I_k,I_orig,para);
toc

clear flow;
flow(:,:,1) = vx;
flow(:,:,2) = vy;
imflow = flowToColor(flow);

figure;imshow(imflow);