# Laplace-over-relax

This project invoves using the method of successive overrelaxation and determining its effectiveness in order to solve laplace/poissons equation in 2 dimensions. Successive relaxation is one of numerous methods that can be used in order to solve these equations, other options still being explored are monte-carlo method. In order to determine the effeciency and convergence rate.

Currently the solve_laplace function applies this to laplace's equation on a 1x1 grid with x and y ranging from 0 to 1 with dirchlet boundary conditions which stay fixed at the boundary.
