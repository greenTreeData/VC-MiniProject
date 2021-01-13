%Donada una imatge, la retornem preprocesada
function [BW] = preProcesingBW(data)  
    dataNormalized = normalizeImage(data);
    normalize      = rgb2gray(dataNormalized);
    level          = graythresh(normalize);
    BW             = imbinarize(normalize,level);
end
