%Dada una <creo que imagen> añadimos los campos estadisticos:
function data = preProcesing(data)
    targetSize = [100,200]; %funcion de ejemplo, de momento.
    data = imresize(data, targetSize);
end