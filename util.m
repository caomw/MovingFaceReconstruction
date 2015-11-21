Iz_temp = Iz;
for i = 1:size(Iz,1)
    for j = 1:size(Iz,2)
    
        Iz_temp(i,j,1) = i;
        Iz_temp(i,j,2) = j;
        
    end
    
end