function [PL] = ecc33(bs_height, ue_height, f, start, stop, step, big_city)

dist = start:step:stop;

PL = zeros(2, length(dist));
PL(1, :) = dist;

f = f/1000;

gr = 0.759 * ue_height - 1.862;
afs = 92.4 + 20 * log10(dist) + 20 * log10(f);
abm = 20.41 + 9.83 * log10(dist) + 7.894 * log10(f) + 9.56 * (log10(f) * log10(f));

gb = log10(bs_height / 200) .* (13.958 + (5.8 * log10(dist).^2));

if (big_city == false)
    gr = (42.57 + 13.7 * log10(f)) * (log10(ue_height) - 0.585);
end

PL(2, :) = afs + abm - gb - gr;
end
