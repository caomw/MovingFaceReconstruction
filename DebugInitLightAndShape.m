k = [205,206,246];

%for k = 1:3%:10
%    j = i(k);
    %L = L_all{j};
    %S = S_all{j};
    M_rec = L*S;
figure, 
for j = 1:3size(M_rec,1)
   i = k(j) 
    im = reshape(M_rec(i,:),sx,[]);
    imshow(im);
    waitforbuttonpress;
end
%end