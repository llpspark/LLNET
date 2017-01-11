source_path='/home/hf/Downloads/DeepLearnToolbox-master/LLNET_NEW/LLnet-dataset/original_images/';
source_img_list=dir(strcat(source_path,'*.pgm'));%获取该文件夹中所有pgm格式的图像
img_num = length(source_img_list);%获取图像总数量
if img_num > 0 %有满足条件的图像
    for j = 1:img_num %逐一读取图像
        image_name = source_img_list(j).name;%图像名
        img =  imread(strcat(source_path,image_name));
        
        %正则化到（0，1）
        img=double(img)/255.0;
        
        %切分image to patches
        patche_size=17;
        patchs_num=2500;
        patchs=img2patchs(img,patche_size,patchs_num);
        data{j}.std=patchs;
        
        %图像暗色化
        gamma=2+3*rand(1,patchs_num);
        for i=1:patchs_num
            darken_patchs(i,:)=patch_darken(patchs(i,:),gamma(i));
        end
        data{j}.darken=darken_patchs;
        
        
        % 图像加高斯噪声
        mu=0;
        B=rand(1,patchs_num);
        sigma=sqrt(B*(25/255)^2);
        for i=1:patchs_num
            dar_noi_patchs(i,:)=add_gaussian(darken_patchs(i,:),mu,sigma(i));
        end
        data{j}.dar_noi=dar_noi_patchs;

    end
end


%重组数据结构，生成训练数据
x=[];
y=[];
for i=1:img_num

    x=[x;data{i}.dar_noi];
    y=[y;data{i}.std];
    
end
tot_pat_num=length(x);
train_x=x(1:tot_pat_num/2,:);
train_y=y(1:tot_pat_num/2,:);
test_x=x(tot_pat_num/2+1:end,:);
test_y=y(tot_pat_num/2+1:end,:);

save train_data.mat train_x train_y test_x test_y;
