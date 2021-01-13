try
    load(['calcs' filesep 'dataSetVars.mat']);
    fprintf('Carregant el archiu de caracteristiques\n');
    
catch ME
    fprintf('Inici del càlcul del vector de caracteristiques.\n');
    dsModels = imageDatastore(["Models" filesep "Meta" filesep "*.png"]);
    ds = imageDatastore(["Train1" filesep "Train1" filesep, "Train2" filesep "Train2" filesep], "LabelSource","foldernames", "IncludeSubfolders",true);       
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

    %calcularCaracteristicas train
    
    trainTransform = transform(train, @preProcesing);
    %montage({read(train), read(trainTransform)});
    TaulaTrain = table;
    %for n = 1:10
    for n = 1:numel(train.Files)
        [I,info] = read(trainTransform);
        d = calcCaracteristicas(info.Label, I);
        TaulaTrain = [TaulaTrain; d];
    end
    TaulaTrain.Properties.VariableNames = {'Label' 'Atb1' 'Atb2' 'Atb3'};
    
    %calcularCaracterisiticas test
    TaulaTest = table;
    for n = 1:numel(test.Files)
        [I,info] = read(trainTransform);
        d = calcCaracteristicas(info.Label, I);
        TaulaTest = [TaulaTest; d];
    end
    TaulaTest.Properties.VariableNames = {'Label' 'Atb1' 'Atb2' 'Atb3'};
    
    save(['calcs' filesep 'dataSetVars.mat']);%guardamos si hemos entrado por el catch
    
end