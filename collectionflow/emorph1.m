addpath('OpticalFlow');
f = load('gwbush_M_flat.mat');
M = f.M;
Mflat = f.M_iter_1;
S_r = 150;
para = get_default_cflow_para();

k1 = 25;
I1 = reshape(M(:, k1), S_r, []);
I1f = reshape(Mflat(:, k1), S_r, []);

k2 = 57;
I2 = reshape(M(:, k2), S_r, []);
I2f = reshape(Mflat(:, k2), S_r, []);

ShowImages(I1, I2, 'morph input');
mv = MakeMorphVideo(I1, I1f, I2, I2f, 35);


implay(mv);

return;

ShowImages(I2, I2f, 'orig');
ShowImages(I2, I3, 't1');
return;

% 1. alpha = 0.012;
% 2. ratio = 0.75;
% 3. minWidth = 20;
% 4. nOuterFPIterations = 7;
% 5. nInnerFPIterations = 1;
% 6. nSORIterations = 30;

a1_iter = linspace(0.05, 0.02, 5);
a2_iter = [0.75];
a3_iter = round(linspace(45, 90, 5));
a4_iter = round(linspace(3, 40, 5));
a5_iter = [1, 2, 3];
a6_iter = round(linspace(10, 100, 5));

n1 = numel(a1_iter);
n2 = numel(a2_iter);
n3 = numel(a3_iter);
n4 = numel(a4_iter);
n5 = numel(a5_iter);
n6 = numel(a6_iter);

n = prod([n1, n2, n3, n4, n5, n6]);
comb = zeros(n + 1, 6);
c = 0;
for a1 = a1_iter
    for a2 = a2_iter
        for a3 = a3_iter
            for a4 = a4_iter
                for a5 = a5_iter
                    for a6 = a6_iter
                        para = get_default_cflow_para();
                        para(1) = a1;
                        para(2) = a2;
                        para(3) = a3;
                        para(4) = a5;
                        para(5) = a5;
                        para(6) = a6;
                        c = c + 1;
                        comb(c, :) = para;
                        if (mod(c, 10) == 1)
                        fprintf('Done with c = %d of %d (%2.2f%%)\n', c, n, 100*c/n);
                        end
                    end
                end
            end
        end
    end
end
comb = comb(1:c, :);
save('comb.mat', 'comb');

return;

M = f.M;
Mflat = f.M_iter_1;
S_r = f.S_r;



ShowImages(I1, wi, 'I1 and wi(trying to get flat)');

return;

I2 = reshape(M(:, 10), S_r, []);
I2f = reshape(Mflat(:, 10), S_r, []);

ShowImages(I1, I1f, 'I1 and normalized');
ShowImages(I2, I2f, 'I2 and normalized');



[vx2, vy2, ~] = Coarse2FineTwoFrames(I2f, I2, para);


I3 = WarpImage(w1, vx2, vy2);
ShowImages(I1, I3, 'final');
