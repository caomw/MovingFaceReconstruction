function [I2, I, Iz] = MakeFrontalFace(im, templateFiduc, locs)

[DETS,PTS,DESCS] = getFiducial(im);
[s_estimated, R_estimated, t_estimated] = PoseNormalization(...
    PTS, templateFiduc);

q_img = s_estimated*R_estimated*locs';
q_img = q_img + repmat(t_estimated, 1, size(q_img, 2));
pixel_interp = GetImagePixelValues(im, q_img);

R2 = CreateRotation(pi/2, 0, pi/9);
%R2 = CancelRotation(R_estimated);
s2 = [0.7 0 0; 0 0.7 0];
z2 = R2*locs';
q_img_2 = s2*z2;
t2 = [0; 60];
q_img_2 = q_img_2 + repmat(t2, 1, size(q_img_2, 2));
[I2, I, Iz] = DebugProjectedImage(im, pixel_interp, q_img_2, z2);
end