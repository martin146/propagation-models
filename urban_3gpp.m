function [PL] = urban_3gpp(bs_height_rooftop, f, start, stop, step)

dist = start:step:stop;

PL = zeros(2, length(dist));
PL(1, :) = dist;

PL(2, :) = 40*(1 - 4e-3 * bs_height_rooftop) * log10(dist) - 18 * log10(bs_height_rooftop) + 21 * log10(f) + 80;
end

