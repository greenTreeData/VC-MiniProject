function displayColors(iRed ,iBlue, iYellow, iWhite, iBlack)
%DISPLAYCOLORS Summary of this function goes here
%   Detailed explanation goes here
    figure
    subplot(1,5,1)
    imshow(iRed); title("Vermells");
    
    subplot(1,5,2)
    imshow(iBlue); title("Blaus");
    
    subplot(1,5,3)
    imshow(iYellow); title("Groc");
   
    subplot(1,5,4)
    imshow(iWhite); title("Blancs");
    
    subplot(1,5,5)
    imshow(iBlack); title("Negres");
end

