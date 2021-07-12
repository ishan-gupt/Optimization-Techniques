%%Newton Method
clc
tic
clear all
syms x;
format long;
f = x.^2 + 54 / x % % Input the function
g = diff(f)
h = diff(g)
epsilon = 10^ - 6
%x0 = input('Entet the initial approximation:');
x0 = 1;
%input('enter the function')
for i = 1:100
    f1 = subs(g, x, x0);
    f11 = subs(h, x, x0);
    y = x0 - f1 / f11; % N-R formula
    err = abs(subs(g, x, y));

    if err < epsilon
        break
    end

    x0 = y;
end

f_value = subs(f, x, y);
fprintf('the minimum value of f at : %f \n', y);
fprintf('the minimum value of f is : %f \n', f_value);
fprintf('No. of Iterations : %d\n', i);
Elapsedtime = toc
fprintf('Ishan Gupta-19BCE7467')
