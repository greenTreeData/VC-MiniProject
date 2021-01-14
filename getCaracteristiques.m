try
    load(['calcs' filesep 'dataSetVars.mat']);
    fprintf('Carregant el archiu de caracteristiques\n');
    
catch ME
    fprintf('Inici del càlcul del vector de caracteristiques.\n');
    dsModels = imageDatastore(['Models' filesep 'Meta' filesep '*.png']);
    dir1 = convertCharsToStrings(['Train1' filesep 'Train1' filesep]);
    dir2 = convertCharsToStrings(['Train2' filesep 'Train2' filesep]);
    ds = imageDatastore([dir1, dir2], "LabelSource","foldernames", "IncludeSubfolders",true);       
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
    nTrain = numel(train.Files)
    nTest = numel(test.Files)

    %calcularCaracteristicas train
    
    trainTransformCOLOR = transform(train, @preProcesingCOLOR);
    trainTransformBW = transform(train, @preProcesingBW);
    
%     TaulaTrain = table;
%     disp("start tablas")
%     tic
%     for n = 1:8000
%         [Icolor,infoA] = read(trainTransformCOLOR);
%         [Ibw, infoB] = read(trainTransformBW);
%         d = calcCaracteristicas(infoA.Label, Icolor, Ibw);
%         TaulaTrain = [TaulaTrain; d];    
%     end
%     elapsed = toc;
%     disp(append("elapsed ", int2str(elapsed)))
%     %guardamos si hemos entrado por el catch
%     save(append("calcs", filesep, "taula.mat"));
   % TaulaTrain.Properties.VariableNames = {'Label' 'Atb1' 'Atb2' 'Atb3'};
    
    TaulaTest = table;
    for n = 1:numel(test.Files)
        [Icolor,infoA] = read(trainTransformCOLOR);
        [Ibw, infoB] = read(trainTransformBW);
        d = calcCaracteristicas(infoA.Label, Icolor, Ibw);  
        TaulaTest = [TaulaTest; d];
    end
    save(append("calcs", filesep, "taula.mat"));
%     TaulaTest.Properties.VariableNames = {'Label' 'Atb1' 'Atb2' 'Atb3'};
%     
    
    
end