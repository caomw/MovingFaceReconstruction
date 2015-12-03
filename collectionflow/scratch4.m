f = load('../gwbush_M_300.mat');
M = f.m_300;
bad_rows = f.bad_rows;
good_rows = true(size(M, 1), 1);
good_rows(bad_rows) = false;
% Need to be in columns for collection flow.
M = M(good_rows, :)';

para = get_default_cflow_para();
M2 = RunCollectionFlow(M, 3, 150, para);