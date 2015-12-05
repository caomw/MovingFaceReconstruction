addpath('OpticalFlow');
f = load('sample.mat');
para = [0.01 0.7500 60 5 1 10];
Im1 = f.I_original;
Im2 = f.I_rank_k;
%[vx,vy,warpI2] = Coarse2FineTwoFrames(Im1,Im2,para);
