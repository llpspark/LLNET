%%  gamma ~uniform[2,5];
function [ dstImg ] = imgDarken( srcImg ,gamma)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
       dstImg = imadjust(srcImg,[0.0,1.0],[0.0,1.0],gamma);

end

