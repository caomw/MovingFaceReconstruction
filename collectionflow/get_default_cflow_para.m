function [para] = get_default_cflow_para()
%UNTITLED66 Summary of this function goes here
%   Detailed explanation goes here


alpha = 0.012;
ratio = 0.75;
minWidth = 60; %20;
nOuterFPIterations = 5; %7;
nInnerFPIterations = 1;
nSORIterations = 50;

para = [alpha,ratio,minWidth,nOuterFPIterations,nInnerFPIterations,nSORIterations];

end

