y = [-2, 1, 0, 2, 2.5, 1.1];
y_dot = [0, 0, 0.5, 2, -1, 2];
r = 0.5; 
r_dot=0;


e = r - y;
e_dot =r_dot -y_dot;

for i = 1:length(e)
    [t_step, x_step] = ode45(@odefun_step, [0 5], [e(i); e_dot(i)]);
    y_output_step = r - x_step(:, 1);
    
    
    % Γράφημα για βηματική είσοδο
    figure();
    plot(t_step, x_step(:, 1), t_step, x_step(:, 2), t_step, y_output_step, t_step, r * ones(size(t_step)));
    title(['Απόκριση για βηματική είσοδο (x_0 = [', num2str(e(i)), ', ', num2str(e_dot(i)), '])']);
    legend('x1 ', 'x2 ', 'y ', 'r');
    xlabel('t');
    grid on;
    
    % Φασικό διάγραμμα
    figure();
    plot(x_step(:, 1), x_step(:, 2));
    hold on;
    scatter(x_step(:, 1), x_step(:, 2));
    title(['Φασικό Διάγραμμα (x_0 = [', num2str(e(i)), ', ', num2str(e_dot(i)), '])']);
    xlabel('x1');
    ylabel('x2');
    grid on;
end

% Συνάρτηση για βηματική είσοδο
function dx = odefun_step(t,x)
        K = 5; 
        T = 0.2; 
        a = 0.05;
        if(abs(x(1))<=0.2)
        dx = [x(2); -(1/T)*x(2) - (K*a/T)*x(1)];
        else
            dx = [x(2); -(1/T)*x(2) - (K/T)*x(1)];
        end
end
