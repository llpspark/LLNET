% mu was set default value 0;
% delta = sqrt((B*(25/255))^2)
function [ dstImg ] = imgAddNoise( srcImg ,mu,delta)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 dstImg = IMNOISE(srcImg,'gaussian',mu,delta) ;

end

