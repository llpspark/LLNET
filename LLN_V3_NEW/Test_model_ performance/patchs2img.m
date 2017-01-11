function [img]=patchs2img(patchs,pos_x,pos_y,rows,cols,patche_size)
[patchs_num,~]=size(patchs);
img=zeros(rows,cols);
iter=zeros(rows,cols);
img_media=zeros(rows,cols);
col_patchs_num=numel(pos_x);
%col_patchs_num=numel(pos_y);
for i=1:patchs_num
    a=ceil(i/col_patchs_num);
    if mod(i,col_patchs_num)==0
        b=col_patchs_num;
    else
        b=mod(i,col_patchs_num);
    end
    img_media(pos_y(a):pos_y(a)+patche_size-1,pos_x(b):pos_x(b)+patche_size-1)=reshape(patchs(i,:),patche_size,patche_size);
  
    for j=pos_y(a):pos_y(a)+patche_size-1
        for k=pos_x(b):pos_x(b)+patche_size-1
          iter(j,k)=iter(j,k)+1;
        end
    end
     
    img=img+img_media;
    img_media=zeros(rows,cols);
end
img=img./iter;


end
