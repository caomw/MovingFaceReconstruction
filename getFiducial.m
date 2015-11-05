function [DETS,PTS,DESCS] = getFiducial(im)
addpath './CLASS_facepipe_VJ_29-Sep-08b'
run('./CLASS_facepipe_VJ_29-Sep-08b/init');
[DETS,PTS,DESCS]=extfacedescs(opts,im,false);
%run('./CLASS_facepipe_VJ_29-Sep-08b/demo');

end