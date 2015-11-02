num_fiducials = 9;
A = rand(3, 3)*15;
[u d v] = svd(A);

Q = round(rand(3, num_fiducials)*10);
s = rand(2, 3) * 3;
R = u;
t_ = round(rand(2, 1)*3);
t = repmat(t_, 1, num_fiducials);
q = s*R*Q + t;
[s_estimated, R_estimated, t_estimated] = PoseNormalization(q, Q);
q2 = s_estimated*R_estimated*Q + repmat(t_estimated, 1, num_fiducials);