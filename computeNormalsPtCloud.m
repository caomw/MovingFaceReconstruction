function [normals] =  computeNormalsPtCloud(ptcloud)


locs = ptcloud.Location;
sx = size(locs,1);
normals = zeros(sx,5);
for i = 1:sx
    
    normals(i,1) = locs(i,1);
    normals(i,2) = locs(i,2);
    
    if i < 6
       [nx,ny,nz] = surfnorm(locs(i:i+6,1),locs(i:i+6,2),locs(i:i+6,3));
    elseif i > sx -6
        [nx,ny,nz] = surfnorm(locs(i-6:i,1),locs(i-6:i,2),locs(i-6:i,3));
    else
        [nx,ny,nz] = surfnorm(locs(i-6:i+6,1),locs(i-6:i+6,2),locs(i-6:i+6,3));
    end
    
    
end
end