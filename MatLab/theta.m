function [a,b] = theta(k)
%theta Provide uniform random initial weights from [-10,10]^3
%   k ~ the dimension
a = 20*rand(k,1)-10;
b = 20*rand()-10;
end

