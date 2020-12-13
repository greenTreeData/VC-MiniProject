function r = calcParaleles(img)
%CALCPARALELES retorna el rang de valors per les rectes trobades per img
%   1. Aplica buscarRectas(img)
%   2. Calcular el rang max(linies.theta) - min(linies.theta)
%   Un resultat petit indica que les linies trobades son mitjanament
%   paral·leles
    iLines = buscarRectas(img,false, 5);
    r= range([iLines.theta]);
end

