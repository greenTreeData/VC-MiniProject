function imgBW= myBinarize(imgRBG)
%MYBINARIZE Entra una imatge RGB d'una senyal
%   La sortida es una imatge binària on els tons vermells, grocs i blaus es
%   converteixen en blanc
    
    [red, blue, yellow] = calcColors(imgRGB);
    

    imgBW = imgRGB
end

