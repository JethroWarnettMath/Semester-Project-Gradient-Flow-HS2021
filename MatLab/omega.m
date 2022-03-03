function X = omega(n,k)
%omega Provide uniform random dataset from [-10,10]^k
%   n ~ size of dataset
%   k ~ the dimension

X = rand(n,k) * 20 - 10;
end

