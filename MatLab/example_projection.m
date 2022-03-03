f = @(x) log((1+x)./(1-x)); 

n = 100;

x = linspace(-1,1,n+2);
x = x(2:end-1);



for i=-3:2
    y = 2^i * f(x)+ x;
    plot(y,x)
    hold on;
end

plot(x,x)

xlim([-5,5])

print -deps projection_example