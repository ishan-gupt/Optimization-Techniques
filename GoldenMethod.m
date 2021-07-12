tic
clc
close all
syms r w;
f = 25 + r^3 - 2 * r - 9 * exp(r);
a = 0; b = 2; aw = 0; bw = 1;
r = (b - a) * w + a;
fw = subs(f, r);
k = 1;

while (k < 11)
    Lw = bw - aw;
    w1 = aw + (0.618) * Lw;
    w2 = bw - (0.618) * Lw;

    if (w1 > w2)
        temp = w2;
        w2 = w1;
        w1 = temp;
    end

    fw1 = subs(fw, w1);
    fw2 = subs(fw, w2);
    figure;

    if (fw1 < fw2)
        X = [aw, w1, w2, bw]; Y = [0, fw1, fw2, 0];
        scatter(X, Y, 'filled');
        xlabel("w");
        ylabel("f(w)");
        bw = w2;
    elseif (fw1 > fw2)
        X = [aw, w1, w2, bw]; Y = [0, fw1, fw2, 0];
        scatter(X, Y, 'filled');
        xlabel("w");
        ylabel("f(w)");
        aw = w1;
    else
        X = [aw, w1, w2, bw]; Y = [0, fw1, fw2, 0];
        scatter(X, Y, 'filled');
        xlabel("w");
        ylabel("f(w)");
        aw = w1; bw = w2;
    end

    k = k + 1;
end

X = ["The final aw and bw values are: ", aw, bw];
disp(X)
a = subs(r, w = aw);
b = subs(r, w = bw);
1
disp("Updated LB Values is: ")
disp(a)
disp("Updated UB Values is: ")
disp(b)
Elapsed_time = toc
fprintf('Ishan Gupta-19BCE7467')
