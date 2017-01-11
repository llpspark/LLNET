addpath(genpath('/home/hf/Downloads/DeepLearnToolbox-master'));
load img.mat;
patche_size=17;
stride=[3,3];

%将指定的图片img切成patchs;
%注意这里的img2patchs与生成训练样本时的img2patchs函数切的方式不同
patchs=[];
[rows,cols]=size(img);
pos_x=(1:stride(1):cols-patche_size+1);
pos_y=(1:stride(2):rows-patche_size+1);
row_num =numel(pos_y);
col_num =numel(pos_x);
for j=1:row_num
    for i=1:col_num
        medi_patch=img(pos_y(1,j):pos_y(1,j)+patche_size-1,pos_x(1,i):pos_x(1,i)+patche_size-1);
        medi_patchs=reshape(medi_patch,1,patche_size*patche_size);
        patchs=[patchs;medi_patchs];
        
    end
end
%call the corrupt2reconstruct to recover the patchs
filetred_patchs= corrupt2reconstruct( nn,double(patchs) );



%调用patchs2img 将训练后的patchs还原成img
recon_img=patchs2img(filetred_patchs,pos_x,pos_y,rows,cols,patche_size);
figure,imshow(img),title('original');
figure,imshow(recon_img),title('reconstructed');
