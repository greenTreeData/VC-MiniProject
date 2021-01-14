function tableRow = calcCaracteristicas(lable, img, BW)
    
    %color
    [iRed, iBlue, iYellow] = calcColors(img);
    
    %circularitat
    stats = regionprops("table", BW,"all");
    [~,maxidx] = max(stats.Area);
    circularidad = stats.Circularity(maxidx);
    
        
    targetSize = [90,90];
    img9090 = imresize(img, targetSize);
    %hogs - necessita una extensió: Visual Computation 
    [features,~] = extractHOGFeatures(img9090);
    tabl = array2table(features);
    
    %Paraleles
    paraleles = calcParaleles(img);

    
    %fer taula
    tableRow = table(lable, iRed, iBlue, iYellow, circularidad, paraleles);
    tableRow = [tableRow tabl];
end
