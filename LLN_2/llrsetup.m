function [ llr ] = llrsetup( size )
  for u= 2:numel(size);
    llr.ae{u-1} =  nnsetup([size(u-1) size(u) size(u-1)]);
  end

end

