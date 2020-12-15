imgs = [12, 26, 7, 34, 10];
figure;
aux = 1;
numImatges = numel(imgs);
descripcions = 4;
for iterador=1:numImatges
    iActual = imread(strcat("Models\Meta\", int2str(imgs(iterador)),'.png'));
    
    subplot(numImatges,descripcions,aux);
    imshow(iActual); title("original");
    
    subplot(numImatges,descripcions,aux+1);
    iBW = imbinarize(iActual);
    imshow(iBW(:,:,1)); title("binarize vermell")
    
    subplot(numImatges,descripcions,aux+2);
    iBW = imbinarize(iActual);
    imshow(iBW(:,:,2)); title("binarize green")
    
    subplot(numImatges,descripcions,aux+3);
    iBW = imbinarize(iActual);
    imshow(iBW(:,:,3)); title("binarize blue")
    
    aux = aux + descripcions;
end
