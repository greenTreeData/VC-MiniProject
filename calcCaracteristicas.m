function tableRow = calcCaracteristicas(lable, imgI, imgBW)
% !!ATENCIÓN!! , si la imagen llega preprocessada -> viene en formato BW i
% i calcColors no puede funcionar

    %colors
    
    [iRed, iBlue, iYellow, iWhite, iBlack] = calcColors(img);
    
    %circularitat
    BW = preProcesing(img); % retorna la imatge en BW
    
    stats = regionprops("table", BW,"all");
    [~,maxidx] = max(stats.Area);
    circularidad = stats.Circularity(maxidx);
    
    %hogs - necessita una extensió: Visual Computation 
    [~,hogVisualization] = extractHOGFeatures(rgbNorm);
    
    %Paraleles
    paraleles = calcParaleles(img);

    %ocr
    txt = ocr(img);
    
    %fer taula
    tableRow = table(lable, iRed, iBlue, iYellow, iWhite, iBlack, circularidad, hogVisualization, paraleles, txt);
end
