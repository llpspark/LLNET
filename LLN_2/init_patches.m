%%  --- darken and addnoise for patches,and show polluted image  --- %%
load stdPatches;
num = length(data);
% num =1;
for i =1:num
    patches = data{i}.patches;
    [dim,samples] =size(patches);
    gamma = 2+ 3*rand(1,samples);
    for j = 1:samples
        patches(:,j) = imgDarken(patches(:,j),gamma(j));
    end
    data{i}.darken = patches;
     beta = rand(1,samples);
     delta =sqrt(beta*(25/255)^2);
    for j= 1:samples
       patches(:,j) = imgAddNoise(patches(:,j),0,delta(j));
    end
    data{i}.noised = patches;
end 
    
save ('SNDpatches.mat', 'data','-v7.3');



