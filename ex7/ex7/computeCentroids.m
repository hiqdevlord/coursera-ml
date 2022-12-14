function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

centroids_num = zeros(K, 1);

for i=1:m
	x = X(i,:);
	id = idx(i);
                        centroids(id, :) = centroids(id, :) .+ x;
                        centroids_num(id) = centroids_num(id) + 1;
endfor

for k=1:K
	centroids(k, :) = centroids(k, :) /  centroids_num(k);
endfor	

% =============================================================

%========vectorized=============

A = zeros(m, K);
for i=1:m
	A(i,:)=zeros(1, K);
	A(i,idx(i)) = 1;
endfor;

s = A' * X

for k=1:K
	
	s(k,:) = s(k,:)  /  size(X(idx == k, :), 1);
endfor	

centroids = s;


% =============================================================


end

