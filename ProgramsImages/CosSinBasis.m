function [y,p] = CosSinBasis(s,x)
y = cos((2*pi*ceil(s/2))*x - mod(s,2)*(pi/2));
p = 1;
return
