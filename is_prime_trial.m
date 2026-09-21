function answer = is_prime_trial(n)
% Exact trial division for the small integer ranges used in the demo.
answer = false;
if n < 2
    return
end
for divisor = 2:floor(sqrt(n))
    if mod(n,divisor) == 0
        return
    end
end
answer = true;
end
