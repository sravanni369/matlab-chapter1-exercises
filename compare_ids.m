function result = compare_ids(A, B)
% Exercise 7: duplicates must not inflate unique-participant counts.
assert(isnumeric(A) && isnumeric(B), 'IDs must be numeric.');
assert(isempty(A) || isvector(A), 'A must be a vector.');
assert(isempty(B) || isvector(B), 'B must be a vector.');
ids = [A(:); B(:)];
assert(isreal(ids) && all(isfinite(ids)) && all(ids == fix(ids)), 'IDs must be finite integers.');
A = unique(A(:)); B = unique(B(:));
result.either = union(A,B);
result.common = intersect(A,B);
result.only_A = setdiff(A,B);
result.only_B = setdiff(B,A);
result.exclusive = setxor(A,B);
result.counts = [numel(A),numel(B)];
if numel(A) > numel(B)
    result.larger = 'A';
elseif numel(B) > numel(A)
    result.larger = 'B';
else
    result.larger = 'tie';
end
end
