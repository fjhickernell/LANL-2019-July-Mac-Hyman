function [y,p] = WalshBasis(s,x)
y = ones(size(x));
numSdig = max(0,floor(log2(s)) + 1);
twok = 1;
for k = 1:numSdig
   twokm1 = twok;
   twok = 2*twok;
   if mod(floor(s/twokm1),2)
      y = y.*((-1).^floor(mod(x*twok,2)));
   end
end
p = 1;
return
