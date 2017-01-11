function [ patchs,pos_x,pos_y ] = img2patchs( img,patche_size ,patchs_num)
%将指定的图片img切成patchs
%   Detailed explanation goes here
[rows,cols]=size(img);
pos_x=randi([1,cols-patche_size+1],patchs_num,1);
pos_y=randi([1,rows-patche_size+1],patchs_num,1);
  for i=1:patchs_num
    patch=img(pos_y(i,1):pos_y(i,1)+patche_size-1,pos_x(i,1):pos_x(i,1)+patche_size-1);
    %将每个pache reshape成行向量，并把所有patch按行组成patches
    patchs(i,:)=reshape(patch,1,patche_size*patche_size);
  end
  return;
end

