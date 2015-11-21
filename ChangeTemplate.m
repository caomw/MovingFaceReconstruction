function [locs_new] = ChangeTemplate(locs,z, Iz)

    locs_new = locs;
    sx = size(Iz,1);
    sy = size(Iz,2);
    z = reshape(z,sx,sy);
    for i = 1:sx
        for j = 1:sy
            
            temp = find((locs(:,1) == Iz(i,j,1)) & (locs(:,2) == Iz(i,j,2)));

            if temp
                locs_new(temp,3) = z(i,j);
            end

            
        end
    end
end