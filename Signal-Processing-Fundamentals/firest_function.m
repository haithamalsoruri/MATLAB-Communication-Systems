function [add, sub, mul, divi, remainder] = calc_function(x, y)

add = x + y;
sub = x - y;
mul = x * y;
divi = x / y;
remainder = rem(x,y);

end