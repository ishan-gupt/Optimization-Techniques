tic
clc
clear all
Vars = {'X_1', 'X_2', 'S_1', 'S_2', 'A_1', 'A_2', 'sol'};
M = 100000;
C = [-15 -16 0 0 -M -M 0]
A = [5 8 -1 0 1 0 100; 6 12 0 -1 0 1 120]
bv = [];
s = eye(size(A, 1));

for j = 1:size(s, 2)

    for i = 1:size(A, 2)

        if A(:, i) == s(:, j)
            bv = [bv i];
        end

    end

end

B = A(:, bv);
A = inv(B) * A;
ZjCj = C(bv) * A - C
ZCj = [ZjCj; A];
SimpTable = array2table(ZCj);
SimpTable.Properties.VariableNames(1:size(ZCj, 2)) = Vars
ZC = ZjCj(:, 1:end - 1);

if any(ZC < 0)
    fprintf('\n Currently it is not optimal \n');
else
    fprintf('\Currently it is optimal\n');
end

Elapsed_time = toc
fprintf('Ishan Gupta-19BCE7467')
