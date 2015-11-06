function [new_locations] = UpsamplePtCloud(pc)
% Given a point cloud at N points (x_i, y_i, z_i), return more points.
%  Args:
%   pc: PointCloud.
%  Returns:
%   new_locations: M x 3 matrix, where this grid will have more number of
%   points.
x_limits = pc.XLimits;
y_limits = pc.YLimits;
x1= double(linspace(x_limits(1)-1, x_limits(2) + 1, 400))';
y1 = double(linspace(y_limits(1)-1, y_limits(2) + 1, 400))';
[xq, yq] = meshgrid(x1, y1);

ll = double(pc.Location);
vq = griddata(ll(:, 1), ll(:, 2), ll(:, 3), xq, yq);

p1 = reshape(xq, [], 1);
p2 = reshape(yq, [], 1);
p3 = reshape(vq, [], 1);
new_locations = [p1 p2 p3];
end

