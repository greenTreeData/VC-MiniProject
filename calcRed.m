function RED = calcRed(img)

    HSV = rgb2hsv(img);

    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);

    RED = abs(H-0.5) > 0.45 & S > 0.5 & V > 0.3;
        
end