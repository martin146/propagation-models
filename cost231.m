function [PL] = cost231(bs_height, ue_height, f, start, stop, step, mode)

dist = start:step:stop;

PL = zeros(2, length(dist));
PL(1, :) = dist;


C = 3;	
lRxH = log10(11.75 * ue_height);
C_H = 3.2 * (lRxH * lRxH) - 4.97;	% Large city (conservative)
c0 = 69.55;
cf = 26.16;
 
if (f > 1500)
    c0 = 46.3;
    cf = 33.9;
end

if (mode == 2)
    C = 0;		% Medium city (average)
    lRxH = log10(1.54 * ue_height);
    C_H = 8.29 * (lRxH * lRxH) - 1.1;
end

if (mode == 3)
    C = -3;		% Small city (Optimistic)
    C_H = (1.1 * log10(f) - 0.7) * ue_height - (1.56 * log10(f)) + 0.8;
end

logf = log10(f);
PL(2, :) = c0 + (cf * logf) - (13.82 * log10(bs_height)) - C_H + (44.9 - 6.55 * log10(bs_height)) * log10(dist) + C;

end

