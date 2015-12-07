function [locs_new] = ChangeTemplate(locs,z, Iz)


    sx = size(Iz,1);
    sy = size(Iz,2);
    z = reshape(z,sx,sy);
    locs_new = zeros(sx*sy,3);
    count = 0;
    
    for i = 1:sx
        for j = 1:sy
            
            %temp = find((locs(:,1) == Iz(i,j,1)) & (locs(:,2) == Iz(i,j,2)) & (locs(:,3) == Iz(i,j,3)));
            
            count = count + 1;
           % if temp
                locs_new(count,1) = j;
                locs_new(count,2) = i;
                locs_new(count,3) = z(i,j);
           % end

            
        end
    end
end