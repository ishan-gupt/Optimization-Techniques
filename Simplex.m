clear all;
clc;
format long;
%input-----------
no_of_variables = 3;
C = [-1 3 2];
M = [3 -1 2 1 0 0; -2 4 0 0 1 0; -4 3 8 0 0 1];
b = [7; 12; 10];
%-------------
A = [M, b];
[m, n] = size(A);
cost = zeros(1, n);
cost(1:3) = C;
cost_BV = cost(no_of_variables + 1:end - 1)
%return;
zjcj = cost_BV * A - cost

%pivot column
zc = zjcj(1:end - 1);
[min_value, pvt_col] = min(zc)

%pivot row
if all(A(:, pvt_col) <= 0)
    error('LPP is unbounded');
else
    sol = A(:, end);
    column = A(:, pvt_col);

    for i = 1:m

        if column(i) > 0
            ratio(i) = sol(i) / column(i);
        else
            ratio(i) = inf;
        end

    end

end

Elapsed_time = toc
fprintf('Ishan Gupta-19BCE7467')
