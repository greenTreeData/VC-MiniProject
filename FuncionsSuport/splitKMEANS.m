function [eti2, cluster_idx, cluster_center]= splitKMEANS(imgRGB,Nclusters)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [FILA, COL, chan]=size(imgRGB);
    
    
    LAB = rgb2lab(imgRGB);
    ab = LAB(:,:,2:3);
    vect2 = reshape(ab, FILA*COL, 2);
    
    [cluster_idx, cluster_center] = kmeans(vect2,Nclusters,'distance','cityblock');
    eti2 = reshape(cluster_idx,FILA,COL);
    
end

