function [ img ] = imageRebuild( patches,pos_x,pos_y,patch_size, rows,cols)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
             pixel_sum = zeros(rows,cols);
             pixel_iter= zeros(rows,cols);
             [patch_length,patch_num] = size(patches);
             for i =1:patch_num
                 patch = reshape(patches(1:end,i),patch_size,patch_size);
                 pixel_sum(pos_y(i):(pos_y(i)+patch_size -1),pos_x(i):(pos_x(i)+patch_size -1))= patch + pixel_sum(pos_y(i):(pos_y(i)+patch_size -1),pos_x(i):(pos_x(i)+patch_size -1));
                 pixel_iter(pos_y(i):(pos_y(i)+patch_size -1),pos_x(i):(pos_x(i)+patch_size -1)) = pixel_iter(pos_y(i):(pos_y(i)+patch_size -1),pos_x(i):(pos_x(i)+patch_size -1))+1;
             end
             pixel_iter(find(pixel_iter ==0)) =1;
             img = pixel_sum./pixel_iter;
            
                 


end

