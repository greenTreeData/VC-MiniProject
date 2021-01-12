%Donada una imatge, la retornem preprocesada
function data = preProcesing(data)
    targetSize = [100,200]; %funcion de ejemplo, de momento.
    %data = imresize(data, targetSize);
  
    dataNormalized = normalizeImage(data);
    normalize      = rgb2gray(dataNormalized);
    level          = graythresh(normalize);
    BW             = imbinarize(normalize,level);
    data           = BW;
   % data           = dataNormalized;
end
