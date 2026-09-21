function C = multiply_while(A, B)
% Exercise 4: same computation with explicitly advanced loop counters.
validateattributes(A, {'numeric'}, {'2d','real','finite','nonempty'});
validateattributes(B, {'numeric'}, {'2d','real','finite','nonempty'});
C = [];
if size(A,2) ~= size(B,1)
    disp('Incompatible dimensions.');
    return
end
A = double(A); B = double(B);
C = zeros(size(A,1), size(B,2));
i = 1;
while i <= size(A,1)
    j = 1;
    while j <= size(B,2)
        k = 1;
        while k <= size(A,2)
            C(i,j) = C(i,j) + A(i,k) * B(k,j);
            k = k + 1;
        end
        j = j + 1;
    end
    i = i + 1;
end
end
