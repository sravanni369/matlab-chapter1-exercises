function C = multiply_for(A, B)
% Exercise 3: scalar products only; no built-in matrix multiplication.
validateattributes(A, {'numeric'}, {'2d','real','finite','nonempty'});
validateattributes(B, {'numeric'}, {'2d','real','finite','nonempty'});
C = [];
if size(A,2) ~= size(B,1)
    disp('Incompatible dimensions.');
    return
end
A = double(A); B = double(B);
C = zeros(size(A,1), size(B,2));
for i = 1:size(A,1)
    for j = 1:size(B,2)
        for k = 1:size(A,2)
            C(i,j) = C(i,j) + A(i,k) * B(k,j);
        end
    end
end
end
