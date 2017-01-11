function [ img,noiseImg,restoreImg ] = testRebuild( nn,x,stride,patch_size )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
h_slide = stride(1);
v_slide = stride(2);
[height,width] =size(x);
x = double(x)/255.0;
img = x;
slice_x = 1:h_slide:(width -  patch_size+1);
slice_y = 1:v_slide:(height - patch_size+1);
 pos_x = repmat(slice_x,1,numel(slice_y));
 pos_y = reshape(repmat(slice_y,numel(slice_x),1),1,numel(slice_x)*numel(slice_y));
 num = numel(pos_y);
 dim = (patch_size)*(patch_size);
 patches = zeros(dim,num);
 for i=1:num
    patches(:,i)=reshape( x(pos_y(i):(pos_y(i)+patch_size-1),pos_x(i):(pos_x(i)+patch_size-1)),patch_size*patch_size,1);
 end
  gamma = 2+3*rand(1,num);
  for j = 1:num
        patches(:,j) = imgDarken(patches(:,j),gamma(j));
  end
   beta = rand(1,num);
   delta =sqrt(beta*(25/255)^2);
   for j= 1:num
       patches(:,j) = imgAddNoise(patches(:,j),0,delta(j));
   end
    noiseImg = imageRebuild( patches,pos_x,pos_y,patch_size, height,width);
      for i =1:num
       predictPatches(:,i)= LLrPredict( nn,patches(:,i)')';
      end
     restoreImg =  imageRebuild(predictPatches,pos_x,pos_y,patch_size, height,width);
end

