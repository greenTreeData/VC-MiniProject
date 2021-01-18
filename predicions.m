%Script per llegir una imatge i predir la seva classe, 
%utilitzant un model 

prompt= 'Entra el nom de la imatge a predir: ';
nameFile=input(prompt, 's');

try
    %leer la imagen
    i = imread(nameFile);
catch
    fprintf('No existeix el archiu %s \n', nameFile);
   
end

%cargar el modelo de modelX.mat
load taula.mat knnCosine

%predecir y dar resultado:
Icolor = preProcesingCOLOR(i);
Ibw = preProcesingBW(i);
taularCar = calcCaracteristicas("noLable", Icolor, Ibw);

class = knnCosine.predictFcn(taularCar);

fprintf('Classe : %s\n', numberToName(class));

