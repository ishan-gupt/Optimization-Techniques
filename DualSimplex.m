clc
clear all
close all
tic
Var = {'x1', 'x2', 'x3', 'x4', 's1', 's2', 's3', 'Sol'};
C = [-3 -2 -1 -4 0 0 0 0];
A = [-2 -4 -5 -1; -3 1 -7 2; -5 -2 -1 -6];
b = [-10; -2; -15]
m = eye(size(A, 1))
W = [A m b];
BV = [];

for j = 1:size(m, 2)

    for i = 1:size(W, 2)

        if W(:, i) == m(:, j)
            BV = [BV i];
        end

    end

end

disp(BV);
Q = W(:, BV);
W = inv(Q) * W;
ZjCj = C(BV) * W - C;
Zcj = [ZjCj; W]
Dual = array2table(Zcj);
Dual.Properties.VariableNames(1:size(Zcj, 2)) = Var
RUN = true;

while RUN
    SOL = W(:, end);

    if any(SOL < 0);
        fprintf('The current BFS is not FEASIBLE \n')
        [LeaVal, pvt_row] = min(SOL);
        fprintf('Leaving Row = %d \n', pvt_row);
        ROW = W(pvt_row, 1:end - 1);
        ZJ = ZjCj(:, 1:end - 1);

        for i = 1:size(ROW, 2)

            if ROW(i) < 0
                ratio(i) = abs(ZJ(i) ./ ROW(i));
            else
                ratio(i) = inf;
            end

        end

        [minVAL, pvt_col] = min(ratio);
        fprintf('Entering Variable = %d \n', pvt_col);
        %BV
        fprintf('Basic Variables (BV) =')
        BV(pvt_row) = pvt_col;
        disp(Var(BV));
        pvt_key = W(pvt_row, pvt_col);
        W(pvt_row, :) = W(pvt_row, :) ./ pvt_key;

        for i = 1:size(W, 1)

            if i ~= pvt_row
                W(i, :) = W(i, :) - W(i, pvt_col) .* W(pvt_row, :);
            end

        end

        ZjCj = C(BV) * W - C;
        Zcj = [ZjCj; W]
        Dual = array2table(Zcj);
        Dual.Properties.VariableNames(1:size(Zcj, 2)) = Var
    else
        RUN = false;
        fprintf('The current BFS is FEASIBLE and OPTIMAL\n')
    end

end

F_BFS = zeros(1, size(W, 2));
F_BFS(BV) = W(:, end);
F_BFS(end) = sum(F_BFS .* C);
OptimalBFS = array2table(F_BFS);
OptimalBFS.Properties.VariableNames(1:size(OptimalBFS, 2)) = Var
Elapsed_time = toc
fprintf('Ishan Gupta-19BCE7467')
