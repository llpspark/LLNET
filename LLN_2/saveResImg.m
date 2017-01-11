function [ ] = saveResImg( path )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    load SNDpatches.mat;
    num = length(data);
        for i = 1:num
        imgCell = data{i};
        imgName = data{i}.name;
        [std_img,noise,darken ] = showTrndata( imgCell);
        std_path = strcat(path,'std\std_',imgName(1:end-4),'.jpg');
        noise_path = strcat(path,'noise\noise_',imgName(1:end-4),'.jpg');
% %        figure,imshow(std_img);
% %       figure, imshow(noise);
% %        figure,imshow(darken);
        imwrite(std_img,std_path);
        imwrite(noise,noise_path);
    end
        

end

