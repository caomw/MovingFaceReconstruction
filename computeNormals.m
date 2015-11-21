function [normals] =  computeNormals(img)


sx = size(img,1);
sy = size(img,2);

normals = zeros(sx,sy,3);

for i = 1:sx-1        
    for j = 1:sy-1
        
        nx = (img(i+1,j,3) - img(i,j,3));
        normals(i,j,1) = nx;
        ny = img(i,j+1,3) - img(i,j,3);
        normals(i,j,2) = ny;
        normals(i,j,3) = -1;
        normals(i,j,:) = normals(i,j,:)./sqrt(nx^2 + ny^2 + 1);
    end
end


% img is p x 36 x 3 ( I am assuming 6x6 patch )
% pcnormals works only in R2015b
%NormalsAll = pcnormals(ptCloud); 
% N = size(img,1);
% normals = zeros(N,3);
% %for i = 1:N
%     
% %    im = zeros(size(img,2),size(img,3));
%     im(:,:) = img(i,:,:);
%     normals(i,:) = normnd(im);
%     
% end

end