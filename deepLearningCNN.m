getDataSet

perm = randperm(10000,20);
for i = 1:20
    subplot(4,5,i);
    imshow(train.Files{perm(i)});
end

labelcount = countEachLabel(train);
%https://es.mathworks.com/help/vision/ug/object-detection-using-deep-learning.html