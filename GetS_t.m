load Iz.mat;
util;
Shape =  computeNormalsIz(Iz_temp);

sx = size(Iz_temp,1);
sy = size(Iz_temp,2);

S_t = [];
S_t = [S_t; reshape(Shape(:,:,1),1,[])];
S_t = [S_t; reshape(Shape(:,:,2),1,[])];
S_t = [S_t; reshape(Shape(:,:,3),1,[])];
S_t = [S_t; reshape(Shape(:,:,4),1,[])];