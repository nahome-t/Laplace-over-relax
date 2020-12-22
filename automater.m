% Purpose of script is to generate an initial value for psi such that the
% it satisfies all the wanted boundary conditions, additionally the result
% is then plotted on a 2D heat map along with a plot of the historical
% values against itr

% For the case in which we have the b.c as sin(x)sinh(1) for y = 1, 0<x<1
% and sin(1)sinh(y), we can trivially spot that the solution to this
% differential equation is sin(x)sinh(y) taking the second derivative with
% respect to x clearly negates the expression and as sin(x) -> cos(x) ->
% -sin(x) and 

init_psi = zeros(40);
n = size(init_psi, 1); % Gives dimensions for grid, using square 7x7 currently
% So should return 7

% As we're calculating sln with x and y going from 0 to 1 and the grid is
% split into a nxn grid then we know that the width andlength of each box 
% is 1/n
d = 1/size(init_psi, 1); 
for k=1:n
    % B.c for top is that psi = sin(x)sinh(1) and as each box corresponds
    % to a width/length of d. x = d*j, y =1-d*i
    init_psi(1, k) = sin(d*k)*sinh(1);
    init_psi(k, end) = sin(1)*sinh(1-d*k);
end
h = heatmap(init_psi);
psi = solve_laplace(init_psi, 1.5, 30);

exp_psi = zeros(7);
for i = 1:n
    for j=1:n
        exp_psi(i, j) = sin(d*j)*sinh(1-i*d);
    end
end

heatmap(psi)
figure;
heatmap(exp_psi)
