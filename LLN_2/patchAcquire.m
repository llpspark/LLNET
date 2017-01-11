function  [ patches,pos_x,pos_y]= patchAcquire( img ,size_patch,num_patch)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[rows,cols] =size(img);
if(rows<=size_patch||cols<=size_patch)
%     result = false;
    return;
end

    pos_x= randi([1,cols - size_patch],1,num_patch);
    pos_y= randi([1,rows- size_patch],1,num_patch);
    for i =1:num_patch
    patch =  img(pos_y(1,i):(pos_y(1,i)+size_patch-1),pos_x(1,i):(pos_x(1,i)+size_patch-1));
%     file_name = strcat(path_save,int2str(i),'.bmp');
%     imwrite(patch,file_name);
    patches(:,i) =reshape(patch,size_patch*size_patch,1);
    end
    
return ;
end

