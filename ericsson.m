function [PL] = ericsson(bs_height, ue_height, f, start, stop, step, mode)

dist = start:step:stop;

PL = zeros(2, length(dist));
PL(1, :) = dist;

a0 = 36.2;
a1 = 30.2;
a2 = -12;
a3 = 0.1;

if (mode == 2)
    a0 = 43.2;
    a1 = 68.93;
end

if (mode == 1)
    a0 = 45.95;
    a1 = 100.6;
end

g1 = 3.2 * log10(11.75 * ue_height).^2;
g2 = 44.49 * log10(f) - 4.78 * (log10(f) * log10(f));

PL(2, :) = a0 + a1 * log10(dist) + a2 * log10(bs_height) + a3 * log10(bs_height) * log10(dist) - g1 + g2;

end

