
x1_0 = [9 11];
x2_0 = [11 1];


for i = 1:length(x1_0)

    [t, x] = ode45(@odefun, [0 10], [x1_0(i); x2_0(i)]);
    
    figure();
    plot(t, x(:,1), t,x(:,2));
    title(['x_0 = [', num2str(x1_0(i)), ', ', num2str(x2_0(i)), ']']);
    legend('x_1', 'x_2');
    xlabel('t');
    grid on;
    
    figure();
    plot(x(:,1), x(:,2)); 
    hold on;
    scatter(x(:,1), x(:,2));
    title(['Φασικό διάγραμμα με x_0 = [', num2str(x1_0(i)), ', ', num2str(x2_0(i)), ']']);
    xlabel('x_1');
    ylabel('x_2');
    grid on;
end

function dx = odefun(~, x)
    dx = [-x(1) + x(2); -4*x(1)-5*x(2)-0.5*x(2)^2];
end