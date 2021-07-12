format short
clear all
clc
tic
%Input
cost = [2 3 11 7; 1 0 5 1; 5 8 15 9]
fprintf('Supply\n');
A = [6 1 10]
fprintf('Demand\n');
B = [7 5 3 2]
%Check BALANCED/UNBALANCED
if sum(A) == sum(B)
    fprintf('Transportation Problem is Balanced\n');
else
    fprintf('Unbalanced\n');

    if sum(A) < sum(B)
        cost(end + 1, :) = zeros(1, size(A, 2));
        A(end + 1) = sum(B) - sum(A);
    elseif sum(B) < sum(A)
        cost(:, end + 1) = zeros(1, size(A, 2))
    end

end

x = zeros(size(cost));
[m, n] = size(cost);
BFS = m + n - 1;
i = 1;
j = 1;
l = 0;

while (l < BFS)

    if A(i) <= B(j)
        x(i, j) = A(i);
        B(j) = B(j) - A(i);
        i = i + 1;
        l = l + 1;
    elseif B(j) <= A(i)
        x(i, j) = B(j);
        A(i) = A(i) - B(j);
        j = j + 1;
        l = l + 1;
    else
        break;
    end

end

fprintf('Initial BFS = \n');
IB = array2table(x);
disp(IB);
TotalBFS = length(nonzeros(x));

if TotalBFS == BFS
    1

    if sum(A) == sum(B)
        fprintf('Transportation Problem is Balanced\n');
    else
        fprintf('Unbalanced\n');

        if sum(A) < sum(B)
            cost(end + 1, :) = zeros(1, size(A, 2));
            A(end + 1) = sum(B) - sum(A);
        elseif sum(B) < sum(A)
            cost(:, end + 1) = zeros(1, size(A, 2))
        end

    end

    x = zeros(size(cost));
    [m, n] = size(cost);
    BFS = m + n - 1;
    i = 1;
    j = 1;
    l = 0;

    while (l < BFS)

        if A(i) <= B(j)
            x(i, j) = A(i);
            B(j) = B(j) - A(i);
            i = i + 1;
            l = l + 1;
        elseif B(j) <= A(i)
            x(i, j) = B(j);
            A(i) = A(i) - B(j);
            j = j + 1;
            l = l + 1;
        else
            break;
        end

    end

    fprintf('Initial BFS = \n');
    IB = array2table(x);
    disp(IB);
    TotalBFS = length(nonzeros(x));

    if TotalBFS == BFS
        fprintf('Initial BFS is Non-Degenerate \n');
    else
        fprintf('Initial BFS is Degenerate \n');
    end

    Initialcost = sum(sum(cost .* x));
    fprintf('Initial BFS Cost = %d\n', Initialcost);
else
    fprintf('Initial BFS is Degenerate \n');
end

Initialcost = sum(sum(cost .* x));
fprintf('Initial BFS Cost = %d\n', Initialcost);
Elapsed_time = toc
fprintf('Ishan Gupta-19BCE7467')
