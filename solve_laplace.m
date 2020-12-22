function [psi,hist_values] = solve_laplace(init_psi,alpha, N_iter)
% Input:
% * init_psi: 2D matrix containing the initial \psi, including boundaries.
% * alpha: the coefficient of over?relaxation.
% * N_iter: maximum number of iterations performed.

% Output:
% * psi: 2D matrix of the value of \psi after (up to) N_iter iterations.
%       represents an approximated solution to laplace's equation
% * hist_values: (N_iter x 3) matrix that contains historical values of 3 points during % the iteration (1 in the upper half, 1 in the middle, and 1 in the lower half). %
% Constraints:
% * The boundaries of \psi are kept constant during the iterations.

%Gathering maximum values for i and j
maxI = size(init_psi, 1);
maxJ = size(init_psi, 2);

% Will store the 
hist_values = zeros(N_iter, 3);


psi = init_psi; 
for x=1:N_iter %
    for i=2:maxI-1
        disp('hahahha')
        for j = maxJ-1:-1:2 %Iterates backwards
            R = psi(i, j+1)+psi(i, j-1) + psi(i+1, j)+ psi(i-1, j);
            psi = psi + alpha*R/4;
        end
    end
 
end

