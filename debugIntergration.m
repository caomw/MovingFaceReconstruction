
sx = size(Iz_temp,1);
sy = size(Iz_temp,2);
z = reshape(Z_true,sx,sy);
for i = 1:sx
    for j = 1:sy
        
        Iz_temp(i,j,3) = z(i,j,1);
        
    end
end

pcloud = pointCloud(Iz_temp);
showPointCloud(pcloud);