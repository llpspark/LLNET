%gamma~uniform(2,5)
function [ patche_darken ] = patch_darken( patch_std ,gamma)
%UNTITLED6 Summary of this function goes here
%   
patche_darken=imadjust(patch_std,[0.0;1.0],[0.0;1.0],gamma);

end

