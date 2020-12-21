function [psi,hist_values] = solve_laplace(init_psi,alpha, N_iter)
% Input:
% * init_psi: 2D matrix containing the initial \psi, including boundaries.
% * alpha: the coefficient of over?relaxation.
% * N_iter: maximum number of iterations performed.

% Output:
% * psi: 2D matrix of the value of \psi after (up to) N_iter iterations.
% * hist_values: (N_iter x 3) matrix that contains historical values of 3 points during % the iteration (1 in the upper half, 1 in the middle, and 1 in the lower half). %
% Constraints:
% * The boundaries of \psi are kept constant during the iterations.

outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

