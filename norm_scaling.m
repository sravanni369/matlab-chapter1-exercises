function result = norm_scaling(A, scale)
% Exercise 6: ||scale*A|| / ||A|| = abs(scale), for nonzero A.
validateattributes(A, {'numeric'}, {'2d','square','real','finite','nonempty'});
validateattributes(scale, {'numeric'}, {'scalar','real','finite'});
A = double(A); scale = double(scale);
labels = {'Frobenius'; '1'; '2'; 'Infinity'};
kinds = {'fro',1,2,Inf};
original = zeros(4,1); scaled = zeros(4,1);
for k = 1:4
    original(k) = norm(A,kinds{k});
    scaled(k) = norm(scale*A,kinds{k});
end
ratio = scaled ./ original;
% A zero matrix has an undefined 0/0 ratio, reported as NaN.
result = table(labels,original,scaled,ratio);
end
