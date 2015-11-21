function [normals] =  computeNormalsIz(Iz)

albeldo = 0.6; % Assumption
[nx,ny,nz] = surfnorm(Iz(:,:,1),Iz(:,:,2),Iz(:,:,3));
sx = size(Iz,1);
sy = size(Iz,2);

normals = zeros(sx,sy,4);

for i = 1:sx
    for j = 1:sy
        
        normals(i,j,1) = albeldo;
        normals(i,j,2) =  albeldo*nx(i,j);
        normals(i,j,3) = albeldo*ny(i,j);
        normals(i,j,4) = albeldo*nz(i,j);
        
    end
end

end