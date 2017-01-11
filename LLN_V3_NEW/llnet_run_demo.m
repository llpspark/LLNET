%--------------------llnet-run-demo-----------------------
addpath(genpath('/home/hf/Downloads/DeepLearnToolbox-master'));
% --------------1.load-data------------------------------
%run the acquire file to load data
load finalstd.mat;


% --------------2. pretraining ------------------------------
%---------------2.1---init net--
llnet=llnetsetup([289,867,578,289]);%llnetsetup调用了nn的nnsetup
%以下是对nnsetup中配置的更改
llnet.ae{1}.activation_function = 'sigm';
llnet.ae{1}.learningRate=0.1;
llnet.ae{1}.weightPenaltyL2=0.01;
llnet.ae{1}.nonSparsityPenalty=0.001;

%以下是对nnsetup中配置的更改
llnet.ae{2}.activation_function = 'sigm';
llnet.ae{2}.learningRate=0.1;
llnet.ae{2}.weightPenaltyL2=0.01;
llnet.ae{2}.nonSparsityPenalty=0.001;

llnet.ae{3}.activation_function = 'sigm';
llnet.ae{3}.learningRate=0.01;
llnet.ae{3}.weightPenaltyL2=0.01;
llnet.ae{3}.nonSparsityPenalty=0.001;

opts.batchsize=125;
opts.numepochs=30;
%-------------2.2---train the llnet 
llnet=llnettrain(llnet,train_x,train_y,opts);

fprintf('----------- completing pretraining ---------\n ');


% --------------3.fine tuning ------------------------------
%---------------3.1---first fine tuning
%---------------3.1.1--init net with the w which have trained--
nn=nnsetup([289,867,578,289,578,867,289]);
nn.W{1}=llnet.ae{1}.W{1};
nn.W{2}=llnet.ae{2}.W{1};
nn.W{3}=llnet.ae{3}.W{1};
nn.W{4}=llnet.ae{3}.W{2};
nn.W{5}=llnet.ae{2}.W{2};
nn.W{6}=llnet.ae{1}.W{2};

nn.learningRate=0.1;
nn.activation_function = 'sigm';
nn.weightPenaltyL2=0.003;
opts.batchsize=125;
opts.numepochs=200;
%---------------3.1.2--fine tuning the llnet with the lable data--
nn=nntrain(nn,train_x,train_y,opts);
fprintf('----------- completing first step fine tuning ---------\n ');

%---------------3.2---second fine tuning
%---------------3.1.1--init net with the w which have trained--

nn.learningRate=0.01;
nn.numepochs=200;%这里需要改成通过控制错误率小于0.005来控制训练终止
%---------------3.1.2--fine tuning the llnet with the lable data--
nn=nntrain(nn,train_x,train_y,opts);
fprintf('----------- completing secpnd step fine tuning ---------\n ');

%[er, bad] = nntest(nn, test_x, test_y);
%assert(er < 0.005, 'Too big error');

% --------------4.test stage ------------------------------
%The trained well model is test in the file of Test_model_performance
