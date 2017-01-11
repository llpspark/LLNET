function [  ] =InitTrnData(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
load  SNDpatches.mat;
nums = length(data);
x= [];
y =[];
for i=1:nums
    x = [x data{i}.noised];
    y = [y data{i}.patches];
 end
train_x = x(:,1:207000)';
train_y = y(:,1:207000)';

test_x = x(:,207001:end)';
test_y = y(:,207001:end)';
save  finalstd.mat train_x train_y test_x test_y;