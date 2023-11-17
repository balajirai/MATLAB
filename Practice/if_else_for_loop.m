% Problem : random numbers operations
%% Section 1
% if statemetn

clc, clearvars, close all;

% A = randi(5)          % generate signle random number from 1 to 5
A = randi(5, 1, 10);    % generate 1:10 matrix of random numbers from 1 to 5

% if count of number '3' in 10 random numbers is equal or more than 3 then print "wow"
tic
num3 = sum(A==3);
timefor = toc;

fprintf('Time taken by Sum Function : %f\n' ,timefor);
if(num3 >= 3)
    disp("Wow!");
end

%% Section 2
% For Loops
clc, clearvars, close all;

A = randi(5, 1, 10);
num3 = 0;

tic
for i = 1:10
    if (A(i) == 3)
        num3 = num3 + 1;
    end
end
timefor = toc;
fprintf('Time taken by For Loop : %f\n' ,timefor);

if(num3 >= 3)
    disp("Wow!");
end