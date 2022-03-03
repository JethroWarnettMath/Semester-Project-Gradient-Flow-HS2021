function [a_rec, b_rec, loss_rec] = rr(seed,n,k,omega,alpha,lambda,sigma,a_real,b_real,num_steps, theta)
%RR Solve ridge regression using the discrete gradient descent method
%   seed        ~ The random number generator seed
%   n           ~ The size of the dataset 
%   k           ~ The dimension
%   omega       ~ A function handle with parameters (n,k) 
%                 that yields random X
%   alpha       ~ The step size
%   lambda      ~ User define parater for ridge regression
%   sigma       ~ Error variance
%   a_real      ~ The true parameter a
%   b_real      ~ The true parameter b
%   num_steps   ~ The number of iteration in the algorithm
%   theta       ~ A function handle with parameter (k)
%                 that yields initial weights (a,b)

    % Set a random seed
    rng(seed);

    % Generate random samples X and Y
    X = omega(n,k);
    Y = X * a_real + b_real + normrnd(0,sigma,[n,1]);

    % Initialize an initial value for parameters a and b
    [a,b] = theta(k);

    % ------------------------------------
    % Algorithm: Discrete Gradient Descent
    % ------------------------------------

    % Record the values
    a_rec = zeros(k, num_steps + 1);
    b_rec = zeros(1,num_steps + 1);
    loss_rec = zeros(1,num_steps + 1);

    a_rec(:,1) = a;
    b_rec(1) = b;
    loss_rec(1) = dot(Y - X * a - b,Y - X * a - b) / (2 * n);

    % Learn the parameters a and b
    for i = 1:num_steps
        % Remember previous weights
        a_0 = a;
        b_0 = b;

        % Update weights
        a = a_0 - alpha * (lambda * a_0 - sum(repmat(Y - X * a_0 - b_0, [1,k]) .* X, 1)' / n);
        b = b_0 - alpha * (lambda * b_0 - sum(Y - X * a_0 - b_0) / n);

        % Keep track of weights (a,b) and record current loss
        a_rec(:,i+1) = a;
        b_rec(i+1) = b;
        loss_rec(i+1) = dot(Y - X * a_0 - b_0,Y - X * a_0 - b_0) / (2 * n);
    end
end