function [A, T] = readImages(folderName, numberOfInputImages, numOfFolders)
%READIMAGES Summary of this function goes here
%   Detailed explanation goes here

% A - macierz zawierajaca zwektoryzowane obrazy
A = zeros(numberOfInputImages * numOfFolders, 10304);
% T - wektor przechowujacy klasy poszczegolnych obrazow
T = zeros(numberOfInputImages * numOfFolders, 1);

for j=1:numOfFolders
    for i=1:numberOfInputImages
        path = strcat(folderName, num2str(j), '/',num2str(i),'.pgm');

        b = imread(path);
        imageId = i + (j - 1) * numberOfInputImages;
        A(imageId, :) = reshape(b,1,numel(b)); 
        % oznaczenie klasy obrazu
        T(imageId, 1) = j;
    end
end

end

