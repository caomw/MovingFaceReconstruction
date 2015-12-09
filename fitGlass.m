function [] = fitGlass(locs,locs_glass,sx,sy,sz,a,b,c,tx,ty,tz,color)

templocs = [sx*locs_glass(:,1) sy*locs_glass(:,2) sz*locs_glass(:,3)];
newlocs = templocs*CreateRotation(a,b,c) + repmat([tx,ty,tz],[size(locs_glass,1),1]);

color1 = repmat([00,00,00],[size(locs_glass,1),1]);
figure, showPointCloud([locs;newlocs],[color;color1]);
title(sprintf('Rot=(%2.3f, %2.3f, %2.3f), t=(%2.3f, %2.3f, %2.3f), sx=%2.3f, sy=%2.3f, sz=%2.3f)', a, b, c, tx, ty, tz, sx, sy ,sz));
end