function [PL] = hata_rural(bs_height, ue_height, f, start, stop, step)

dist = start:step:stop;

PL = zeros(2, length(dist));
PL(1, :) = dist;

a_h = 3.2 * (log10(11.75*ue_height))^2 - 4.97;
PL(2, :) = (69.55 + 26.16*log10(f) - 13.82*log10(bs_height) - a_h + (44.9 - 6.55 * log10(bs_height))*log10(dist)) - 4.78*log10(f)^2 + 18.33 * log10(f) - 40.94;
end

