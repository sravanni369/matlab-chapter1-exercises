% Select an exercise and provide the inputs requested by the book.
choice = input('Exercise number (1-7): ');
switch choice
    case {1,2}
        current = input('Current temperature (C): ');
        target = input('Setpoint (C): ');
        if choice == 1
            disp(temperature_if(current,target));
        else
            disp(temperature_switch(current,target));
        end
    case {3,4}
        A = input('Matrix A: '); B = input('Matrix B: ');
        if size(A,2) ~= size(B,1)
            disp('Incompatible dimensions.'); return
        end
        if choice == 3
            disp(multiply_for(A,B));
        else
            disp(multiply_while(A,B));
        end
    case 5
        lo = input('Lower bound: '); hi = input('Upper bound: ');
        N = input('Number of primes: '); T = input('Non-prime threshold: ');
        [values,status] = find_primes(lo,hi,N,T);
        disp(status); disp(values);
    case 6
        n = input('Square matrix size: ');
        validateattributes(n, {'numeric'}, {'scalar','integer','positive','<=',1000});
        scale = input('Scalar multiplier: ');
        rng(42); disp(norm_scaling(randn(n),scale));
    case 7
        A = input('Group A IDs: '); B = input('Group B IDs: ');
        disp(compare_ids(A,B));
    otherwise
        error('Choose an integer from 1 to 7.');
end
