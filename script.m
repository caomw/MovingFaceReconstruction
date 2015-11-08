
get_sre = true;
ptcloudstuff = true;
upsample = true;

if get_sre
f = load('init_model_Q.mat');
Q = f.Q';
im = imread('lfw/George_HW_Bush/George_HW_Bush_0010.jpg');
[DETS,PTS,DESCS] = getFiducial(im);

[s_estimated, R_estimated, t_estimated] = PoseNormalization(PTS, Q);
end

if ptcloudstuff
    ptcloud = pcread('./faceplys/face_mesh_000306.ply');
    if upsample
        locs = UpsamplePtCloud(ptcloud);
    else
        locs = ptcloud.Location;
    end
    %figure, showPointCloud(ptcloud);
    q_img = s_estimated*R_estimated*locs';
    q_img = q_img + repmat(t_estimated, 1, size(q_img, 2));
    
end

pixel_interp = GetImagePixelValues(im, q_img);

if false
    I = DebugProjectedImage(im, pixel_interp, q_img);
    %Should show only the face part!!
    figure;
    imshow(I);
    
    figure, showPointCloud([locs(:, 1) locs(:, 2) locs(:, 3)], pixel_interp');
end

R2 = CreateRotation(pi/2, 0, pi/9);
Q = locs';
%[Q Qmean] = MeanNormalize(Q1);
s2 = [1 0 0; 0 1 0];
q_img_2 = s2*R2*Q;
q_img_2 = q_img_2 + repmat(t_estimated, 1, size(q_img_2, 2));
I = DebugProjectedImage(im, pixel_interp, abs(q_img_2));
figure;
imshow(I);

