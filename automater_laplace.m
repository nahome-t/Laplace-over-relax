% Purpose of script is to generate an initial value for psi such that the
% it satisfies all the wanted boundary conditions, additionally the result
% is then plotted on a 2D heat map along with a plot of the historical
% values against itr

% For the case in which we have the b.c as sin(x)sinh(1) for y = 1, 0<x<1
% and sin(1)sinh(y), we can trivially spot that the solution to this
% differential equation is sin(x)sinh(y) taking the second derivative with
% respect to x clearly negates the expression and as sin(x) -> cos(x) ->
% -sin(x) and 

init_psi = zeros(n);
n = 7; % Gives dimensions for grid, using square 7x7 currently
max_itr = 30; % Stores maximum number of iterations done 
alpha = 1.01; % Over relaxation constant

% As we're calculating sln on a 1 by 1 area and so width/length of box =
% 1/n
d = 1/n; 


for k=1:n
    % B.c for top is that psi = sin(x)sinh(1) and as each box corresponds
    % to a width/length of d. x = d*j, y =1-d*i
    init_psi(1, k) = sin(d*k)*sinh(1);
    init_psi(k, end) = sin(1)*sinh(1-d*k);
end

[psi, hist_values] = solve_laplace(init_psi, 1.5, max_itr);

disp(hist_values)
% Generates the expected value for psi (in order to verify that the method
% correctly estimates the solution
exp_psi = zeros(7);
for i = 1:n
    for j=1:n
        exp_psi(i, j) = sin(d*j)*sinh(1-i*d);
    end
end

%heatmap(psi)
%figure;
%heatmap(exp_psi)
%figure;
scatter(1:max_itr, hist_values(:, 1))
scatter(1:max_itr, hist_values(:, 2))
scatter(1:max_itr, hist_values(:, 3))

