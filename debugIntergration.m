
locs_z = [];

sx = size(Iz_temp,1);
sy = size(Iz_temp,2);
z = reshape(Z_true,sx,sy);
color = zeros(sx,sy,3);
color1 = [];
temp = zeros(1,3);
for i = 1:sx
    for j = 1:sy
        temp(1) = im(i,j,1);
        temp(2) = im(i,j,2);
        temp(3) = im(i,j,3);
        locs_z = [locs_z;i j z(i,j,1)];
        color1 = [color1;temp];
        Iz_temp(i,j,3) = z(i,j,1);
        color(i,j,:) = im(i,j,:);
    end
end

pcloud = pointCloud(Iz_temp);
figure, showPointCloud(Iz_temp,color);