function [RED, BLUE, YELLOW, most]= calcColors(img)
%calcColors: entra una imatge RGB, hi surten les imatges binàries que
%localitzen els colors vermell, blau i groc.

    HSV = rgb2hsv(img);

    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);
    
    RED = abs(H-0.5) > 0.45 & S > 0.5 & V > 0.3;
    
    %BLUE: 240/360 =    0.666 (+-)
    BLUE = H >= 0.5 & H <= 0.7 & S > 0.5 & V > 0.3;
    
    %YELLOW: 60/360 =   0.166 (+-)
    YELLOW = H >= 0.15 & H <= 0.20 & S > 0.5 & V > 0.3;
    
    
end