function [imgBW, imgPre]= myBinarize(imgRGB)
%MYBINARIZE Entra una imatge RGB d'una senyal
%   La sortida es una imatge binària on els tons vermells, grocs i blaus es
%   converteixen en blanc
    
    
    


    %kmeans:
    [FILA, COL, chan]=size(imgRGB);
    
    Nclusters=3;
    
    LAB = rgb2lab(imgRGB);
    ab = LAB(:,:,2:3);
    vect2 = reshape(ab, FILA*COL, 2);
    
    [cluster_idx, cluster_center] = kmeans(vect2,Nclusters,'distance','cityblock');
    eti2 = reshape(cluster_idx,FILA,COL);
    %figure,imshow(eti2,[]),colormap(colorcube), title('imatge etiquetada');
    
    imgBW = eti2;
    
    imgPre = LAB;
end

