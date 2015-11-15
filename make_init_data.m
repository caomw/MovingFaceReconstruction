f = load('init_model_Q.mat');
templateFiduc = f.Q';
ptcloud = pcread('./faceplys/face_mesh_000306.ply');
locs = UpsamplePtCloud(ptcloud);
save('init_face_data1.mat', 'ptcloud', 'locs', 'templateFiduc')