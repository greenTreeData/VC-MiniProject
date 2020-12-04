function BLUE = calcBlue(img)
%HUE: Value from 0 to 1 that corresponds to the color’s position on a color wheel. 
% As hue increases from 0 to 1, the color transitions from red to orange, yellow, green, 
% cyan, blue, magenta, and finally back to red. 
% Blue around 0.8333

    HSV = rgb2hsv(img);

    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);

    BLUE =  H >= 0.5 & H <= 0.7 & S > 0.5 & V > 0.3;
        
end
