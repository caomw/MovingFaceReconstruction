%load Iz.mat;
s1 = size(Iz,1);
s2 = size(Iz,2);
Iz_temp = Iz;
for i = 1:s1
    for j = 1:s2
        Iz_temp(i,j,1) = i;
        Iz_temp(i,j,2) = j;
    end
end

util;
Shape =  computeNormalsIz(Iz_temp);

sx = size(Iz_temp,1);
sy = size(Iz_temp,2);

S_t = [];
S_t = [S_t; reshape(Shape(:,:,1),1,[])];
S_t = [S_t; reshape(Shape(:,:,2),1,[])];
S_t = [S_t; reshape(Shape(:,:,3),1,[])];
S_t = [S_t; reshape(Shape(:,:,4),1,[])];