function [ data] = loadData( path,size_patch,num_patch )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
imgList = dir(strcat(path,'*.pgm'));
numImg = length(imgList);
data =cell(1,numImg);
for i=1:numImg
   
    imgName = imgList(i).name;
    % fprintf(imgName);
    elem.name = imgName;
    img = imread(strcat(path,elem.name));
    [rows,cols] = size(img);
    [patches ,pos_x,pos_y] = patchAcquire( img ,size_patch,num_patch);
    elem.patches =double(patches)/255.0;
    elem.pos_x=pos_x;
    elem.pos_y = pos_y;
    elem.rows = rows;
    elem.clos = cols;
    data{1,i}= elem;

end
% % save  stdImg.mat;
% % num=length(data);
% % patches =[];
% % for i= 1:num
% %     elem = data{1,i};
% %     patches = [patches elem.patches];
% % end
% % sum_patch = size(patches,2);
% % index = randperm(sum_patch);
% % patches= patches(:,index);
% % save pSet.mat patches;
