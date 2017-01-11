%% predict the entire enhanced-image
function [ y ] = LLrRebuild( nn,x,stride,patch_size)
   
   horizontal_stride =stride(1);
   vertical_stride = stride(2);
   [height,width] = size(x);
   slice_x = 1:horizontal_stride:(width -  patch_size+1);
   slice_y = 1: vertical_stride:(height - patch_size+1);
   pos_x = repmat(slice_x,1,numel(slice_y));
   pos_y = reshape(repmat(slice_y,numel(slice_x),1),1,numel(slice_x)*numel(slice_y));
   
   num = numel(pos_y);
   patches = zeros(patch_size*patch_size,num);
   for i=1:num
       patches(:,i)=reshape( x(pos_y(i):(pos_y(i)+patch_size-1),pos_x(i):(pos_x(i)+patch_size-1)),patch_size*patch_size,1);
   end
  
   for i =1:num
       predictPatches(:,i)= LLrPredict( nn,patches(:,i)')';
   end
   
  y =  imageRebuild(predictPatches,pos_x,pos_y,patch_size, height,width);
end

