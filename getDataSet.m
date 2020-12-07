try
    load dataSetVars.mat;
    
catch ME
    
    dsModels = imageDatastore("Models\Meta\*.png");
    ds = imageDatastore(["Train1\Train1\", "Train2\Train2\"], "LabelSource","foldernames", "IncludeSubfolders",true);       
    nFiles = numel(ds.Files);

    %podemos mirar cuantos items de cada clase hay y la distribución:
    eachLable = countEachLabel(ds);
    %boxplot(eachLable.Count, nFiles);

    %De la misma manera, aplicar un ordenado aleatorio tambien es comun en los
    %preparativos para entrenar un modelo:
    ds = shuffle(ds);

    %splitDS:
    
    %numTrainFiles = 750;
    %[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');
    
    [train,test] = splitEachLabel(ds,0.8);
    nTrain = numel(train.Files);
    nTest = numel(test.Files);

    %calcularCaracteristicas
    
    trainTransform = transform(train, @preProcesing);
    %montage({read(train), read(trainTransform)});
    T = table;
    %for n = 1:10
    for n = 1:numel(train.Files)
        [I,info] = read(trainTransform);
        d = calcCaracteristicas(info.Label, I);
        T = [T; d];
    end
    T.Properties.VariableNames = {'Label' 'Atb1' 'Atb2' 'Atb3'};
    save dataSetVars.mat %guardamos si hemos entrado por el catch
    
end