function [ std_img,noise,darken ] = showTrndata( imgCell)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
  patches = imgCell.patches;
  rows = imgCell.rows;
  cols = imgCell.clos;
  pos_x = imgCell.pos_x;
  pos_y = imgCell.pos_y;
  
  % -------------- standard image rebuild -------------- % 
  std_img = imageRebuild( patches,pos_x,pos_y,17,rows,cols);
   
  patches =imgCell.noised;
  noise = imageRebuild( patches,pos_x,pos_y,17,rows,cols); 
  
  patches =imgCell.darken;
  darken = imageRebuild( patches,pos_x,pos_y,17,rows,cols);
  
end

