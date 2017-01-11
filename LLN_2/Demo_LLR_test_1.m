 addpath(genpath('D:\MATLAB\DeepLearnToolbox-master\DeepLearnToolbox-master'));
 
% % load dataset.mat;
% % test_x =train_x(:,1:1000)';
% % test_y = train_y(:,1:1000)';
% % val_x = train_x(:,1001:2000)';
% % val_y = train_y(:,1001:2000)';
% % train_x = train_x(:,2001:3000)';
% % train_y = train_y(:,2001:3000)';

load finalstd.mat;
val_x =test_x;
val_y = test_y;
%load LLC_Data.mat;


lemda = 0.0002; %weightSparistyPenaltyL2
beta = 0.001 ; %NonSparsityPenalty
p = 0.01 ;    % Sparsity target 
stride = [3 3];
patch_size = 17;
%train_x;train_y;test_
%% ------------- LLRet pretrain with  ------------------%% 
% using 30 echo ,first and second DA's learning rate was set 0.1
%  the third DA's learning rate was set 0.01
rand('state',0);
%
llr = llrsetup([289 867 578 289]); % W and b have been initiated
llr.ae{1}.activation_function = 'sigm';
llr.ae{1}.learningRate = 0.1;
llr.ae{1}.weightPenaltyL2 = lemda;
llr.ae{1}.nonSparsityPenalty = beta;

llr.ae{2}.activation_function = 'sigm';
llr.ae{2}.learningRate = 0.1;
llr.ae{2}.weightPenaltyL2 = lemda;
llr.ae{2}.nonSparsityPenalty = beta;

llr.ae{3}.activation_function = 'sigm';
llr.ae{3}.learningRate = 0.01;
llr.ae{3}.weightPenaltyL2 = lemda;
llr.ae{3}.nonSparsityPenalty = beta;

opts.numepochs = 30;
opts.batchsize = 100;

llr =llrtrain(llr,train_x,train_y,opts);
fprintf('--------------------- finishing pretrain -----------------------\n');
save init_model.mat llr;
%% ----------------- LLRet finetuned -------------------%%
% the first 200 tune epochs the learning rate  = 0.1;
% 
% % opts.numepochs = 200;
% % beta = 0; % remove sparsity penalty
% % llr.ae{3}.learningRate = 0.1;
% % llr.ae{1}.nonSparsityPenalty = beta ;
% % llr.ae{2}.nonSparsityPenalty = beta ;
% % llr.ae{3}.nonSparsityPenalty = beta ;

%using the SDAE to initialzie a FFNN
lemda = 0.0002;
nn = nnsetup([289 867 578 289 578 867 289]);
nn.activation_function = 'sigm';
nn.learningRate = 0.1;
nn.weightPenaltyL2 = lemda;

% add pretrained weights
nn.W{1}=llr.ae{1}.W{1};
nn.W{2}=llr.ae{2}.W{1};
nn.W{3}=llr.ae{3}.W{1};
nn.W{4}=llr.ae{3}.W{2};
nn.W{5}=llr.ae{2}.W{2};
nn.W{6}=llr.ae{1}.W{2};

% Train the FFNN
opts.numepochs =200; % the first 200 epochs
opts.batchsize = 100;
nn= nntrain(nn,train_x,train_y,opts);
fprintf('--------------------- finishing fine-tune step 1 -----------------------\n');
% afterwards
opts.numepochs =200;
nn.learningRate = 0.01;
nn = nntrain(nn,train_x,train_y,opts,val_x,val_y);
fprintf('--------------------- finishing fine-tune step 2 -----------------------\n');
img =imread('47.pgm');
img = double(img)/255.0;
imgRes =LLrRebuild( nn,img,stride,patch_size);

figure,imshow(img),title('original');
figure,imshow(imgRes),title('enhanced ');
save model.mat nn;

%result test.











