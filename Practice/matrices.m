% Array / matrices
clc, clearvars;

matrix = 1:10;
transpose = matrix'; % transpose of x

% Arrays or 1D-matrix using linspace
x = linspace(1,10,10);

y = [1,2,5,9];      % commas or space same thing
z = [3 6  7 -8  9]; % commas or space same thing

% 2D- matrix
A = [1,2; 4,6; 8, 9];     % semicolon end the row and starts from next row so 2D matrix
A = A + 2;                % Adds 2 to every element of the matrix
C = A .^2;                % squaring every elements of matrix

% Matrix multiplication
% A = A*A;  % Results into error (column of first should be equal to row of second)
% A = A^2   % Results the same error, squaring matrix (matrix multiplication)
B = A* A';  % take transpose and then multiply using matrix multiplication rules

