function [mv] = MakeMorphVideo(I1, I1f, I2, I2f, num_steps, Irgb1)
% Get the morph video from I1 to I2.
para = get_default_cflow_para();

[vx1, vy1, ~] = Coarse2FineTwoFrames(I1, I1f, para);
[vx2, vy2, ~] = Coarse2FineTwoFrames(I2f, I2, para);

steps = linspace(0, 1, num_steps);
v_total_x = -vx2 -vx1;
v_total_y = -vy2 -vy1;

m = size(I1, 1);
n = size(I1, 2);
mv = zeros(m, n, 3, num_steps);
for i = 1:num_steps
    I3 = zeros(size(Irgb1));
    vix = v_total_x*steps(i);
    viy = v_total_y*steps(i);
    for k = 1:3
        I3(:, :, k) = WarpImage(im2double(Irgb1(:, :, k)), vix, viy);
    end
    mv(:, :, :, i) = I3;
end

end

