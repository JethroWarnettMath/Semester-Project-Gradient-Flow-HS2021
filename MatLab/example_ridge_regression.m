seed        = 297693725;
n           = 1000;
k           = 2;
alpha       = 0.005;
lambda      = 0.001;
sigma       = 0.05;
a_real      = [1;-1];
b_real      = 2;
num_steps   = 1000;
num_exp     = 10;

fig1 = figure('name', 'Evolution of a');
ax1 = axes('parent', fig1);
movegui(fig1,'west');
hold(ax1,'on');

fig2 = figure('name', 'Evolution of b');
ax2 = axes('parent', fig2);
movegui(fig2,'center');
hold(ax2,'on');

fig3 = figure('name', 'Evolution of loss');
ax3 = axes('parent', fig3);
movegui(fig3,'east');
hold(ax3,'on');

% Plot every parameter
for i = 1:num_exp
    [a_rec, b_rec, loss_rec] = rr(seed+i,n,k,@omega,alpha,lambda,sigma,a_real,b_real,num_steps, @theta);
    plot(ax1, a_rec(1,:), a_rec(2,:));
    plot(ax2, 1:num_steps+1, b_rec);
    plot(ax3, 1:num_steps+1, loss_rec);
end

% Evolution of a
scatter(ax1, 1, -1, 100, '*');
text(ax1, 1+0, -1+(-1), 'a_{real}');
title(ax1, 'Evolution of a_t');
saveas(fig1, 'EvolutionA', 'epsc');

% The evolution of b
yline(ax2,2,'-.b');
hold off;
title(ax2, 'Evolution of b_t');
xlim(ax2, [0,num_steps]);
saveas(fig2, 'EvolutionB', 'epsc');

% The evolution of loss
set(ax3, 'YScale', 'log');
title(ax3, 'Evolution of loss');
xlim(ax3, [0,num_steps]);
saveas(fig3, 'EvolutionLoss', 'epsc');