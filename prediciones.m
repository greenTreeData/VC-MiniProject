
prompt= 'Entra el nom de la imatge a predir: ';
name=input(prompt, 's');
name
try
    
    %leer la imagen
    %cargar el modelo en un archivo .mat
    %dar la predicion
    
catch
   fprintf('No existeix el archiu %s \n', name);
   
end
