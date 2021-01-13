%Script per llegir una imatge i predir la seva classe, 
%utilitzant un model 

prompt= 'Entra el nom de la imatge a predir: ';
nameFile=input(prompt, 's');

try
    %leer la imagen
    imread(nameFile);
    %cargar el modelo de modelX.mat
    %load modelX.mat
    
    %predecir y dar resultado:
    class = 1; %TODO: cambiar por la funcion de predecir del modelo
    
    fprintf('Classe : %s\n', numberToName(class));
catch
    fprintf('No existeix el archiu %s \n', nameFile);
   
end

