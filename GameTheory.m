clc
tic
a = [48 24 32; 52 35 55; 54 10 42]
maxi = max(a)
maximin = min(maxi)
b = transpose(a)
mini = min(b)
minimax = max(mini)

if (minimax == maximin)
    row = find(mini == minimax);
    col = find(maxi == maximin);
    disp('Saddle point exist');
    disp('The value of the game for A is:');
    disp(row);
    disp('The value of the game for B is:');
    disp(col);
    disp('The value of the game is:');
    disp(minimax)
else
    disp('The value of the game is 0');
end

Elapsed_time = toc
disp("Ishan Gupta-19BCE7467")
