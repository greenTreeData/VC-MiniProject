function normalized = untitled(i)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a = min(i(:));  % a: buscar el min. valor dels pixels en totes les columnes
c = min(a);     % c: buscar el min. value dels pixels en la image
b = max(i(:));  % b: buscar el max. valor dels pixels en totes les columnes
d = max(b);     % d: buscar el min. value dels pixels en la image
m = 255/(d - c);  % find the slope of line joining point (0,255) to (rmin,rmax)
normalized = (i - c) * m; % transform the image according to new slope
end

