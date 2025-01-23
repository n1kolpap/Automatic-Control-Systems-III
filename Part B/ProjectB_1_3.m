x1_0 = [11];
x2_0 = [1];
theta = [1];


for i = 1:length(x1_0)
    [t, x] = ode45(@odefun, [0 10], [x1_0(i); x2_0(i);theta]);
    figure();
    plot(t, x(:,1), t,x(:,2),t,x(:,3));
    title(['x_0 = [', num2str(x1_0(i)), ', ', num2str(x2_0(i)), ']']);
    legend('x_1', 'x_2','θ');
    xlabel('t');
    grid on;
end

function dx = odefun(t, x)
    dx = [-x(1) + x(2); -x(1)+(0.5-x(3))*(x(2)^2);-2*x(1)*(x(2)^2)+5*x(2)^3];
end