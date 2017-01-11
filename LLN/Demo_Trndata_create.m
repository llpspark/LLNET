%% ------------------- Demo_Trndata_create ---------------------%%
samples =10000;
patch_size =17;

img =imread('47.pgm');

%img = double(img);
% ------ normalize procedure pixels was mapped into [0,1]; --------%
%img = patchNormalize(img);
figure,imshow(img),title('original');
[patches,pos_x,pos_y] = patchAcquire(img,patch_size,samples);
patches = patchNormalize(patches);
 %save girl_1.mat patches pos_x pos_y;
 train_y =patches;
 
 % ---------  darken processing  
 gamma = 2+3*rand(1,samples);
 for i=1:samples
     patches(:,i) = imgDarken(patches(:,i),gamma(i));
 end
 % --------  Gaussian noise pollution
 beta = rand(1,samples);
 delta =sqrt(beta*(25/255)^2);
 for i = 1:samples
 patches(:,i) = imgAddNoise(patches(:,i),0,delta(i));
 end    
 train_x= patches;
 save dataset.mat train_x train_y;