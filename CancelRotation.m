function [R2] = CancelRotation(R)
% Given a rotation matrix, create a new rotation matrix with yaw, pitch and
% roll cancelled.

alpha = atan2(R(2,1), R(1,1));
beta = atan2(-R(3,1), norm([R(3,2) R(3,3)]));
gamma = atan2(R(3,2), R(3,3));
%R2 = R*CreateRotation(pi/2 -alpha, -beta, 2*pi/10 -gamma);
R2 = CreateRotation(0, 0, 0);
end



