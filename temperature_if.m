function message = temperature_if(current, target)
% Exercise 1: inclusive +/-2 Celsius deadband.
validateattributes(current, {'numeric'}, {'scalar','real','finite'});
validateattributes(target, {'numeric'}, {'scalar','real','finite'});
if current < target - 2
    message = 'Heating ON';
elseif current > target + 2
    message = 'Cooling ON';
else
    message = 'Heating OFF, Temperature is OK';
end
end
