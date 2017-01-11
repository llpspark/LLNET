function [ filetred_patchs ] = corrupt2reconstruct( nn,patchs )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
for i=1:size(patchs,1)
filetred_patchs(i,:)=llnetpredict(nn, patchs(i,:));

end

end

