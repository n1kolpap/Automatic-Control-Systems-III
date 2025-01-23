x1_0 = [0.1, 0.4, 0.8, -0.4];
x2_0 = [0.1, 0.4, 0.8, 1];

syms x1 x2
ellipse_eq = 0.2*x1^2 - 0.2*x1*x2 + 0.3*x2^2 - 0.01057;

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
    scatter(x(:,1), x(:,2), 'r.');
    hold on;
    fimplicit(ellipse_eq, [-1, 1, -1, 1],'LineWidth', 1.5);
    title(['Φασικό διάγραμμα με x_0 = [', num2str(x1_0(i)), ', ', num2str(x2_0(i)), ']']);
    xlabel('x_1');
    ylabel('x_2');
    legend('', '', 'Πεδίο Έλξης');
    grid on;
end

function dx = odefun(t, x)
    dx = [-x(1) + x(2); -x(1) + x(1)*x(2) + 0.5*x(2)^2];
end
