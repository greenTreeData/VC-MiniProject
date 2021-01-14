function tableRow = calcCaracteristicas(lable, img, BW)
    targetSize = [90,90]; %funcion de ejemplo, de momento.
    BW = imresize(BW, targetSize);
    img = imresize(img, targetSize);
    %color
    [iRed, iBlue, iYellow, iWhite, iBlack] = calcColors(img);
    
    %circularitat
    stats = regionprops("table", BW,"all");
    [~,maxidx] = max(stats.Area);
    circularidad = stats.Circularity(maxidx);
    
    %hogs - necessita una extensió: Visual Computation 
    [features,~] = extractHOGFeatures(img);
    tabl = array2table(features);
    
    %Paraleles
    paraleles = calcParaleles(img);

    %ocr
    txt = ocr(img);
    
    
    %fer taula
    tableRow = table(lable, iRed, iBlue, iYellow, circularidad, paraleles, txt);
    tableRow = [tableRow tabl];
end
