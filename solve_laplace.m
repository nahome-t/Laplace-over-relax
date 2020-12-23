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

% Will store the historical values over each iteration of the top left box,
% middle box and bottom box (WARNING: Requires grid to be nxn where n is odd 
% so that there exists a single box in the middle of the grid)
hist_values = zeros(N_iter, 3);

% Contains data on what co-ordinates are tracked (in this case 2, 2
tracked_values = [2, 2; 4, 4; 6, 6];
% Psi value to be iterated over
psi = init_psi; 
for x=1:N_iter %
    for i=2:maxI-1
        for j = maxJ-1:-1:2 %Iterates backwards as we're starting from top
            % Right corner
            
            % Iterates over all the tracked values, if the coordinates
            % match up it'll add the value of psi during that iteration on
            % to the historical values array, where each column corresponds
            % to a coordinate whose vakue is being tracked
            
            for k = 1:3
                if all([i, j] == tracked_values(k, :))
                    hist_values(x, k) = psi(i, j);
                end
            end
            
            % Calculates the residue and adds it on to the value for 
            % psi(i, j) in order to find a better approximation for psi
            R = psi(i, j+1)+psi(i, j-1) + psi(i+1, j)+ psi(i-1, j)-4*psi(i, j);
            psi(i, j) = psi(i, j) + alpha*R/4;
        end
    end
end


