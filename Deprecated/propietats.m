%Senyals del 0 al 8
i0 = imread('Models\Meta\0.png');
i39 = imread('Models\Meta\39.png');


%Detectar colors vermells
i0R = calcRed(i0);
i39R = calcRed(i39);

%Detectar colors blaus
i0B = calcBlue(i0);
i39B = calcBlue(i39);


montage({i0B,i39B,i0R,i39R});

s = regionprops(i0R, 'Circularity');
s.Circularity

%{
Propiedades utiles para discriminar las señales
- Circularidad
- Coloridad azul, roja
- Formas internas
%}