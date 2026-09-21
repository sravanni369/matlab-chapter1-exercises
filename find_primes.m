function [values, status] = find_primes(lower, upper, N, T)
% Exercise 5: stop immediately on the T-th consecutive non-prime.
validateattributes(lower, {'numeric'}, {'scalar','real','finite','integer','>=',-1e7,'<=',1e7});
validateattributes(upper, {'numeric'}, {'scalar','real','finite','integer','>=',-1e7,'<=',1e7});
validateattributes(N, {'numeric'}, {'scalar','integer','positive','finite'});
validateattributes(T, {'numeric'}, {'scalar','integer','positive','finite'});
assert(lower <= upper, 'Lower bound must not exceed upper bound.');
values = []; streak = 0; status = 'range exhausted';
for number = double(lower):double(upper)
    if ~is_prime_trial(number)
        streak = streak + 1;
        if streak >= T
            status = 'non-prime threshold reached';
            break
        end
        continue
    end
    streak = 0;
    values(end+1) = number;
    if numel(values) == N
        status = 'requested count found';
        break
    end
end
end
