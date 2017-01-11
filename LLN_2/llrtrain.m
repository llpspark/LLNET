function [ llr] = llrtrain( llr,x,y,opts )

     for i = 1 : numel(llr.ae);
        disp(['Training AE ' num2str(i) '/' num2str(numel(llr.ae))]);
        llr.ae{i} = nntrain(llr.ae{i}, x, y, opts);
        t = nnff(llr.ae{i}, x, y);
        x = t.a{2};
        %remove bias term
        x = x(:,2:end);
        y=x;
    end    

end

