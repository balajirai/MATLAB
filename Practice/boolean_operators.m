% boolean operators
clc;

a = input("Enter a : ");
b = input("Enter b : ");

% Boolean OR
b_or = a | b;
fprintf("Boolean OR of the two numbers is : %d\n", b_or);

% Boolean NOR
b_nor = ~(a | b);
fprintf("Boolean NOR of the two numbers is : %d\n", b_nor);

% Boolean AND
b_and = a & b;
fprintf("Boolean AND of the two numbers is : %d\n", b_and);

% Boolean NAND
b_nand = ~(a & b);
fprintf("Boolean NAND of the two numbers is : %d\n", b_nand);

% Boolean XOR
b_xor = a ^ b;
fprintf("Boolean XOR of the two numbers is : %d\n", b_xor);

% Boolean NOT
a_not = ~a;
fprintf("Boolean NOT of a numbers is : %d\n", a_not);

b_not = ~b;
fprintf("Boolean NOT of b numbers is : %d\n", b_not);