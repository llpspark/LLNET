function llnet = llnetsetup(size)
    for u = 2 : numel(size)
        llnet.ae{u-1} = nnsetup([size(u-1) size(u) size(u-1)]);
    end
end
