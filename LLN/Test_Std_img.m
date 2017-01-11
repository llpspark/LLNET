%% --------- load fine-trained NN to test and predict  ----------- %%  
 addpath(genpath('D:\MATLAB\DeepLearnToolbox-master\DeepLearnToolbox-master'));
stride = [3 3];
patch_size = 17;
load model_09_16.mat;
path ='D:\std_img\';
dst_path ='D:\MATLAB\DeepLearnToolbox-master\DeepLearnToolbox-master\LLN\test\';
imgList = dir(strcat(path,'*.pgm'));
nums = length(imgList);

for i =1:nums
     imgName = imgList(i).name;
     imgPath = strcat(path,imgName);
     img = imread(imgPath);
     [img,noiseImg,restoreImg]=testRebuild( nn,img,stride,patch_size );
     name = imgName(1:end-4);
     std_path = strcat(dst_path,'std\std_',name,'.jpg');
     noise_path = strcat(dst_path,'noise\noise_',name,'.jpg');
     restore_path = strcat(dst_path,'rebuild\restore_',name,'.jpg');
     imwrite(img,std_path);
     imwrite(noiseImg,noise_path);
     imwrite(restoreImg,restore_path);
end