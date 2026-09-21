% Deterministic checks; built-ins are independent references in tests only.
diary('execution_log.txt');
fprintf('MATLAB %s\n',version);
rng(42);
for current = [17.9,18,20,22,22.1]
    a = temperature_if(current,20); b = temperature_switch(current,20);
    assert(strcmp(a,b)); fprintf('Temperature %.1f: %s\n',current,a);
end
assert(strcmp(temperature_if(18,20),'Heating OFF, Temperature is OK'));
assert(strcmp(temperature_if(22,20),'Heating OFF, Temperature is OK'));
assert(strcmp(temperature_if(17.9,20),'Heating ON'));
assert(strcmp(temperature_if(22.1,20),'Cooling ON'));
for k = 1:10
    A = randn(3,4); B = randn(4,2);
    assert(norm(multiply_for(A,B)-A*B,'fro') < 1e-12);
    assert(norm(multiply_while(A,B)-A*B,'fro') < 1e-12);
end
assert(isempty(multiply_for(ones(2,3),ones(4,2))));
assert(isempty(multiply_while(ones(2,3),ones(4,2))));
disp('Matrix demo:'); disp(multiply_for([1 2;3 4],[5 6;7 8]));
[p,s] = find_primes(2,20,5,4);
assert(isequal(p,[2 3 5 7 11]) && strcmp(s,'requested count found'));
[p,s] = find_primes(8,20,5,3);
assert(isempty(p) && strcmp(s,'non-prime threshold reached'));
[p,s] = find_primes(2,5,10,3);
assert(isequal(p,[2 3 5]) && strcmp(s,'range exhausted'));
for n = -10:200
    assert(is_prime_trial(n) == (n >= 2 && isprime(n)));
end
A = randn(4);
for scale = [-3,0,0.5,2]
    r = norm_scaling(A,scale);
    assert(all(abs(r.ratio-abs(scale)) < 1e-12));
end
disp('Norm demo, multiplier -3:'); disp(norm_scaling(A,-3));
r = norm_scaling(zeros(3),2); assert(all(isnan(r.ratio)));
r = compare_ids([1 2 2 3],[3 4]);
assert(isequal(r.either,[1;2;3;4]) && isequal(r.common,3));
assert(isequal(r.only_A,[1;2]) && isequal(r.exclusive,[1;2;4]));
assert(strcmp(r.larger,'A')); disp(r);
r = compare_ids([],[]); assert(strcmp(r.larger,'tie'));
disp('PASS: all seven exercise groups and edge-case checks.');
diary off;
