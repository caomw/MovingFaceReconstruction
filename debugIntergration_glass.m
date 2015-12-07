
sx = size(Iz_temp,1);
sy = size(Iz_temp,2);
z = reshape(Z_true,sx,sy);
color = zeros(sx,sy,3);
Iz_temp1 = Iz_temp;
for i = 1:sx
    for j = 1:sy
        
        Iz_temp1(i,j,1) = i;
        Iz_temp1(i,j,2) = j;
        Iz_temp1(i,j,3) = z(i,j,1);
        Iz_temp(i,j,3) = z(i,j,1);
        color(i,j,:) = im(i,j,:);
    end
end

pcloud = pointCloud(Iz_temp);
figure, showPointCloud(Iz_temp,color);