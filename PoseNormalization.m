function [s_estimated, R_estimated, t_estimated] = PoseNormalization(q, Q)
% Recover scale, Rotation adn Translation given q and Q.
%   Inputs:
%  q = 2 x num_fiduc (image coordinates).
%  Q = 3 x num_fiduc (regular cartesian coordinates).

[p, q_bar] = MeanNormalize(q);
[P, Q_bar] = MeanNormalize(Q);
A = (p*P')*inv(P*P');

t_estimated = q_bar - A*Q_bar;

A_prime = zeros(3, 3);
A_prime(1:2, :) = A;
A_prime(3, :) = cross(A(1,:), A(2,:));
[u, d, v] = svd(A_prime);
R_estimated = u*(v');
s_estimated = A*(R_estimated');
end


