function [I2, I, Iz] = MakeFrontalFace(im, im_fiducs, templateFiduc, locs, R2, t2)
% Args:
% im: Image.
% im_fiducs: 2d locations of fiducs in image.
% templateFiduc: 3d locations of fiducs in image.
% locs: 3d point cloud.

% Returns:
%   I2, I, Iz 

%[DETS,PTS,DESCS] = getFiducial(im);

[s_estimated, R_estimated, t_estimated] = PoseNormalization(...
    im_fiducs, templateFiduc);


q_img = s_estimated*R_estimated*locs';
q_img = q_img + repmat(t_estimated, 1, size(q_img, 2));

pixel_interp = GetImagePixelValues(im, q_img);

%R2 = CreateRotation(pi/2, 0, pi/9);
%s2 = [0.7 0 0; 0 0.7 0];
s2 = [1 0 0; 0 1 0];
z2 = abs(R2*locs');
q_img_2 = s2*z2;
%t2 = [0; 60];
q_img_2 = q_img_2 + repmat(t2, 1, size(q_img_2, 2));
z2 = locs';

% This is slow!! (Takes 5-6 seconds per image).
[I2, I, Iz] = DebugProjectedImage(im, pixel_interp, q_img_2, z2);
end