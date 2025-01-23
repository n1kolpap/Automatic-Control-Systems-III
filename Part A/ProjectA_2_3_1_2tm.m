y = [-2, 1, 0, 2, 2.5, 1.1];
y_dot = [0, 0, 0.5, 2, -1, 2];
r = 0; 
r_dot=1.2;


e = r - y;
e_dot =r_dot -y_dot;

for i = 1:length(e)
    [t_ramp, x_ramp] = ode45(@odefun_ramp, [0 5], [e(i); e_dot(i)]);
    y_output_step = 1.2*t_ramp - x_ramp(:, 1);
    
    
    % Γράφημα για ραμπα r(t)=1.2t
    figure();
    plot(t_ramp, x_ramp(:, 1), t_ramp, x_ramp(:, 2), t_ramp, y_output_step, t_ramp, r_dot.*t_ramp);
    title(['Απόκριση για ραμπα (x_0 = [', num2str(e(i)), ', ', num2str(e_dot(i)), '])']);
    legend('x1 ', 'x2 ', 'y ', 'r');
    xlabel('t');
    grid on;
    
    % Φασικό διάγραμμα
    figure();
    plot(x_ramp(:, 1), x_ramp(:, 2));
    hold on;
    scatter(x_ramp(:, 1), x_ramp(:, 2));
    title(['Φασικό Διάγραμμα (x_0 = [', num2str(e(i)), ', ', num2str(e_dot(i)), '])']);
    xlabel('x1');
    ylabel('x2');
    grid on;
end

function dx = odefun_ramp(t,x)
        K = 5; 
        T = 0.2; 
        a = 0.05;
        if(abs(x(1))<=0.2)
        dx = [x(2); -(1/T)*x(2) - (a*K/T)*x(1)+1.2/T];
        else
            dx = [x(2); -(1/T)*x(2) - (K/T)*x(1)+1.2/T];
        end
end