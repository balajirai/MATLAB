function [final_z] = fun1(initial_z)
z = initial_z;

while(z > initial_z/2)
    z = z-1;
end

final_z = z;
end