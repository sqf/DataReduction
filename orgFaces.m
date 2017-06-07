clear all
J = 10;
numberOfInputImages = 10;
numOfFolders = 3;
folderName = 'faces/s';

[A, T] = readImages(folderName, numberOfInputImages, numOfFolders);

[V, X, D] = customPca(A', J);
% V - twarze wlasne
% X - cechy zredukowane (ka�dego z obraz�w)
% D - wartosci wlasne
eigenface = reshape(V(:, 1), 112, 92);

imagesc(eigenface)
colormap('gray')

% klasyfikacja pelna przestrzen
Mdl = fitcknn(A,T); %'CrossVal','on');
cvmodel = crossval(Mdl,'KFold',5);
cvmdlloss = kfoldLoss(cvmodel)
predict(Mdl,A(23,:));
% klasyfikacja przestrzen zredukowana
MdlR = fitcknn(X',T);
cvmodelR = crossval(MdlR,'KFold',5);
cvmdllossR = kfoldLoss(cvmodelR);


% wynik klasyfikacji

idxR = kmeans(X',numOfFolders);
AccMeasure(T,idxR)

idx = kmeans(A,numOfFolders);
AccMeasure(T,idx)
