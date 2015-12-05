function [mrgb] = Loadrgbfrontalfaces()
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

mrgb= {};
for i = 1:9
    d = load(sprintf('mrgb_part_%d.mat', i));
    mrgb(d.start_i:d.end_i) = d.images;
end

end

