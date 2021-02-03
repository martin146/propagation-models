function [PL] = free_space(f, start, stop, step)

dist = start:step:stop;

PL = zeros(2, length(dist));
PL(1, :) = dist;

PL(2, :) = 20*log10(dist) + 20 * log10(f) + 32.44;

end

