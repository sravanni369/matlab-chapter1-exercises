function message = temperature_switch(current, target)
% Exercise 2: classify before selecting a switch branch.
validateattributes(current, {'numeric'}, {'scalar','real','finite'});
validateattributes(target, {'numeric'}, {'scalar','real','finite'});
state = (current > target + 2) - (current < target - 2);
switch state
    case -1
        message = 'Heating ON';
    case 1
        message = 'Cooling ON';
    otherwise
        message = 'Heating OFF, Temperature is OK';
end
end
