function [ y ] = LLrPredict( nn,x )
   
    nn.testing =1;   
    nn = nnff(nn, x, zeros(size(x,1), nn.size(end)));
    nn.testing = 0;
    y = nn.a{end};


end

