for j = 1%:10
    %L = L_all{j};
    %S = S_all{j};
    M_rec = L*S;
figure, 
for i = 1:size(M_rec,1)
   
    im = reshape(M_rec(i,:),sx,[]);
    imshow(im);
    waitforbuttonpress;
end
end