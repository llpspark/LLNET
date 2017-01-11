function llnet = llnettrain(llnet,train_x,train_y,opts)
    for i = 1 : numel(llnet.ae);
        disp(['Training AE ' num2str(i) '/' num2str(numel(llnet.ae))]);
        llnet.ae{i} = nntrain(llnet.ae{i}, train_x, train_y, opts);
        t = nnff(llnet.ae{i}, train_x, train_y);
        train_x = t.a{2};
        %remove bias term
        train_x = train_x(:,2:end);
        train_y=train_x;
    end
   

end
