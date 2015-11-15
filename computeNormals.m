function [normals] =  computeNormals(img)


% img is p x 36 x 3 ( I am assuming 6x6 patch )
% pcnormals works only in R2015b
%NormalsAll = pcnormals(ptCloud); 
N = size(img,1);
normals = zeros(N,3);
for i = 1:N
    
    im = zeros(size(img,2),size(img,3));
    im(:,:) = img(i,:,:);
    normals(i,:) = normnd(im);
    
end

end