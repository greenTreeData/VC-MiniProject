%entra una imagen en RGB, salen las rectas encontradas por el algoritmo de
%hough
%por defecto, se buscan hasta 4 picos
function rectas = buscarRectas(img, display, hPeaks)

    if nargin < 3
        hPeaks = 4;
    end

    BW = rgb2gray(img);
    BW = edge(BW,'canny');
    
    if display
        figure
        imshow(BW);    
    end
    
    [H,theta,rho] = hough(BW);
    if display
        figure
        imshow(imadjust(rescale(H)),[],...
               'XData',theta,...
               'YData',rho,...
               'InitialMagnification','fit');
        xlabel('\theta (degrees)')
        ylabel('\rho')
        axis on
        axis normal 
        hold on
        colormap(gca,hot)
    end
    %H: Matrix de Hough, 4: maximos a "buscar" si son iguales tmb los saca
    P = houghpeaks(H,hPeaks,'threshold',ceil(0.5*max(H(:)))); %buscar pics

    x = theta(P(:,2));
    y = rho(P(:,1));
    
    if display
        plot(x,y,'s','color','black');
    end
    lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);
    if display
        hold off
    end
    if display
        figure, imshow(img), hold on
        max_len = 0;
        for k = 1:length(lines)
           xy = [lines(k).point1; lines(k).point2];
           plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

           % Plot beginnings and ends of lines
           plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
           plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

           % Determine the endpoints of the longest line segment
           len = norm(lines(k).point1 - lines(k).point2);
           if ( len > max_len)
              max_len = len;
              xy_long = xy;
           end
        end
        % highlight the longest line segment
        plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
    end
    rectas = (lines);
end
