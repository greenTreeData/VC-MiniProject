function [propRED, propBLUE, propYELLOW]= calcColors(img)
%calcColors: entra una imatge RGB, retona l'area proporcional de cada color.

    HSV = rgb2hsv(img);
    [height, width, ~] = size(img);
    area = height * width;
    
    H = HSV(:,:,1);
    S = HSV(:,:,2);
    %V = HSV(:,:,3);
    
    RED = abs(H - 0.5) > 0.45 & S > 0.5;
    
    %BLUE: 240/360 =    0.666 (+-)
    BLUE = H >= 0.5 & H <= 0.7 & S > 0.5;
    
    %YELLOW: 60/360 =   0.166 (+-)
    YELLOW = H >= 0.15 & H <= 0.20 & S > 0.5;
    
    %CALC PROPORCIONES
    redPixels = sum(RED(:) == 1);    
    bluePixels = sum(BLUE(:) == 1);  
    yellowPixels = sum(YELLOW(:) == 1);  
    propRED = redPixels / area;
    propBLUE = bluePixels / area;
    propYELLOW = yellowPixels / area;
end