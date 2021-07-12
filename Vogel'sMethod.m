clc
clear all
close all
tic
%Input
Cost = [2 3 11 7; 1 0 6 1; 5 8 15 9];
Supply = [6; 1; 11];
Demand = [7 5 3 2];
C1 = Cost;
D1 = Demand;
fprintf('Cost matrix for the given inputs is: \n');
disp(Cost)
SumofSD = sum(Supply);
%Check BALANCED/UNBALANCED
if sum(Supply) == sum(Demand)
    fprintf('The above Transportation Problem has Balanced Supply and Demand.\n');
else
    fprintf('The above Transportation Problem has Unbalanced Supply and Demand.\n');

    if sum(Supply) < sum(Demand)
        Cost(end + 1, :) = zeros(1, size(Supply, 2));
        Supply(end + 1) = sum(Demand) - sum(Supply);
    elseif sum(Demand) < sum(Supply)
        Cost(:, end + 1) = zeros(1, size(Supply, 2));
        Demand(end + 1) = sum(Supply) - sum(Demand);
    end

end

D1 = [Demand, SumofSD];
C1 = [Cost, Supply; D1];
fprintf('Balanced Cost Matrix: \n');
disp(C1)
% Vogel's Method
cost = Cost;
X = zeros(size(Cost));
[m, n] = size(Cost);
BFS = m + n - 1;
%Penalty
for i = 1:m * n
    Col = sort(Cost, 1);
    Row = sort(Cost, 2);
    penrow = Row(:, 2) - Row(:, 1);
    pencol = Col(2, :) - Col(1, :);
    R = max(penrow);
    C = max(pencol);
    Rmax = find(penrow == max(R, C));
    Cmax = find(pencol == max(R, C));
    Cr = Cost(Rmax, :); % %Pnealty rows
    Cc = Cost(:, Cmax); % %penalty cols

    if max(penrow) ~= max(pencol)

        if max(penrow) > max(pencol)
            [rowind, colind] = find(min(min(Cr)) == Cost(Rmax, :));
            row1 = Rmax(rowind);
            col1 = colind;
        else
            [rowind, colind] = find(min(min(Cc)) == Cost(:, Cmax));
            row1 = rowind;
            col1 = Cmax(colind);
        end

        x11 = min(Supply(row1), Demand(col1));
        [val, ind] = max(x11);
        ii = row1(ind);
        jj = col1(ind);
    else
        [rowind1, colind1] = find(min(min(Cr)) == Cost(Rmax, :));
        row1 = Rmax(rowind1);
        col1 = colind1;
        C1 = Cost(row1, col1);
        [rowind2, colind2] = find(min(min(Cc)) == Cost(:, Cmax));
        row2 = rowind2;
        col2 = Cmax(colind2);
        C2 = Cost(row2, col2);

        if C1 < C2
            x11 = min(Supply(row1), Demand(col1));
            [val, ind] = max(x11);
            ii = row1(ind);
            jj = col1(ind);
        else
            x11 = min(Supply(row2), Demand(col2));
            [val, ind] = max(x11);
            ii = row2(ind);
            jj = col2(ind);
        end

    end

    y11 = min(Supply(ii), Demand(jj));
    X(ii, jj) = y11;
    Supply(ii) = Supply(ii) - y11;
    Demand(jj) = Demand(jj) - y11;
    Cost(ii, jj) = inf;
end

%Printing BFS
fprintf('Initial BFS = \n');
IB = array2table(X);
disp(IB);
totalBFS = length(nonzeros(X))

if totalBFS == BFS
    fprintf('The Initial BFS is non-degenerate \n');
else
    fprint('The Initial BFS is degenerate \n');
end

initialCost = sum(sum(cost .* X)) - 1;
fprintf('Initial BFS Cost = %d\n', initialCost);
Elapsed_time = toc
disp("Ishan Gupta-19BCE7467")
