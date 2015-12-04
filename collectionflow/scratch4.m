f = load('../gwbush_M_300.mat');
M = f.m_300;
bad_rows = f.bad_rows;
good_rows = true(size(M, 1), 1);
good_rows(bad_rows) = false;
% Need to be in columns for collection flow.
M = M(good_rows, :)';

para = get_default_cflow_para();
M2 = RunCollectionFlow(M, 3, 150, para);

for i = 1:10
    I1 = reshape(M(:, i), 150, []);
    I2 = reshape(M2(:, i), 150, []);
    figure;
    subplot(1, 2, 1);
    imshow(I1);
    subplot(1, 2, 2);
    imshow(I2);
    
end