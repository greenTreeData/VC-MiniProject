%Dada una <creo que imagen> añadimos los campos estadisticos:
function data = preProcesing(data)
    targetSize = [100,200]; %funcion de ejemplo, de momento.
    data = imresize(data, targetSize);
    
    hsvImage = rgb2hsv(data);
    hChannel = hsvImage(:, :, 1);
    sChannel = hsvImage(:, :, 2);
    vChannel = hsvImage(:, :, 3);
    
    meanV = mean2(vChannel);
    
    %Ver iluminación
    if meanV < 0.8
        %newV = meanV + 1.5 * (vChannel - meanV); % Increase contrast by factor of 1.5
        vChannel = double(vChannel) / double(max(max(vChannel)));
        newV = arrayfun(@(x) sqrt(x),vChannel);
        newHSVImage = cat(3, hChannel, sChannel, newV);
        newRGBImage = hsv2rgb(newHSVImage);
    else
        %Deberia oscurecer
        vChannel = double(vChannel) / double(max(max(vChannel)));
        newV = arrayfun(@(x) -sqrt(x),vChannel);
        newHSVImage = cat(3, hChannel, sChannel, newV);
        newRGBImage = hsv2rgb(newHSVImage);
    end

    %Ver factor borroso, se puede usar la funcion que hay en blurMetric.m
    
    %Aplicar filtre
    
    filt1 = imdiffusefilt(I(:,:,1));
    filt2 = imdiffusefilt(I(:,:,2));
    filt3 = imdiffusefilt(I(:,:,3));
    
    I(:,:,1) = filt1
    I(:,:,2) = filt2
    I(:,:,3) = filt3
    
    %Binaritzar
    
    binaryImage = I(:,:,1) < 200;
end