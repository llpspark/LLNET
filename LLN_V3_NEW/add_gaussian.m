function [ noise_patch ] = add_gaussian( patch,mu,sigma )
%UNTITLED7 Summary of this function goes here
%   在给定的patch上添加高斯噪声
noise_patch=imnoise(patch,'gaussian',mu,sigma);
end

