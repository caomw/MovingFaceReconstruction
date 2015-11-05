im = imread('lfw/George_HW_Bush/George_HW_Bush_0010.jpg');
[DETS,PTS,DESCS] = getFiducial(im);
DebugPoint(im, PTS)