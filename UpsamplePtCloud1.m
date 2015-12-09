function [new_locations] = UpsamplePtCloud1(pc)
% Given a point cloud at N points (x_i, y_i, z_i), return more points.
%  Args:
%   pc: PointCloud.
%  Returns:
%   new_locations: M x 3 matrix, where this grid will have more number of
%   points.
x_limits = [min(pc(:,1));max(pc(:,1))];%pc.XLimits;
y_limits = [min(pc(:,2));max(pc(:,2))];%min(pcpc.YLimits;
x1= double(linspace(x_limits(1), x_limits(2), 800))';
y1 = double(linspace(y_limits(1), y_limits(2), 1000))';
[xq, yq] = meshgrid(x1, y1);

ll = double(pc);
vq = griddata(ll(:, 1), ll(:, 2), ll(:, 3), xq, yq);

p1 = reshape(xq, [], 1);
p2 = reshape(yq, [], 1);
p3 = reshape(vq, [], 1);
new_locations = [p1 p2 p3; ll];
end

