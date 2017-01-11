% % path ='D:\std_img\';
% % size_patch = 17;
% % num_patch = 2500;
% % data = loadData( path,size_patch,num_patch );

% % load pSet.mat;
% % patches = patches';
% % [nums,dim] = size(patches);
% % patches =double(patches)/255.0;
% % gamma = 2+3*rand(1,nums);
% % for i= 1:nums
% %       darkenPatches(i,:)=imgDarken(patches(i,:),gamma(i));
% % end;
% % 
% % beta = rand(1,nums);
% % delta =sqrt(beta*(25/255)^2);
% % for i =1:nums
% %     noisedPatches(i,:) = imgAddNoise(darkenPatches(i,:),0,delta(i));
% % end
% % rndIdx = randperm(nums);
% % save entire_patches.mat patches darkenPatches noisedPatches rndIdx;
% % 
% %   
% % X = patches(rndIdx,:);
% % Y = noisedPatches(rndIdx,:);
% % 
% % train_x = X(1:207000,:);
% % train_y = Y(1:207000,:);
% % 
% % test_x = X(207001:end,:);
% % test_y = Y(207001:end,:);
% % 
% % save LLC_Data.mat train_x train_y test_x test_y;



