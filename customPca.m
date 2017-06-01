function [V, X, D] = customPca(x,J)
% x =  [2.5 0.5 2.2 1.9 3.1  2.3 2 1 1.5 1.1;
%     2.4 0.7 2.9 2.2 3 2.7 1.6 1.1 1.6 0.9];

% avgVector = mean(x,2);              
% xDeviations = x - avgVector;               % macierz odchyleñ

xDeviations = bsxfun(@minus, x, mean(x,2));
 
C = (1/numel(x)) * (xDeviations * xDeviations'); % macierz kowariancji
[V,D] = eigs(C, J);                         %
[D, order] = sort(diag(D), 'descend');
V = V(:, order);
X = V'*xDeviations;

% hold on
% plot(x(1,:),x(2,:), 'xb')
end

% plot(y(1,:),y(2,:), 'xr')
% 
% plot(linspace(0, V(1,1),100),linspace(0, V(2,1),100), 'b')
% plot(linspace(0, V(1,2),100),linspace(0, V(2,2),100), 'b')

