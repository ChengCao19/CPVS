function [CV] = vol_fun_a(length,width,number)
% These functions are a series of volume calculation model
% The optional values for parameter num are 1 to 9

% Validating input parameters
if length <= 0 || width <= 0
    error('Length and width must be positive numbers.');
end

if number < 1 || number > 9 || number ~= round(number)
    warning('Formula number must be an integer between 1 and 9.');
    CV = NaN;
    return;
end


switch number
    case 1
        CV = (pi/6)*length*width^2;
    case 2
        CV = (pi/6)*((length+width)/2)^2;
    case 3
        CV = (pi/6)*(length*width)^(3/2);
    case 4
        CV = (2/5)*length*width^2;
    case 5
        CV = (pi/12)*length*width^2;
    case 6
        CV = (2*pi/15)*length*width^2;
    case 7
        CV = (1/2)*length*width^2;
    case 8
        CV = (pi/3)*length^2*width;         % 该公式完全不适用
    case 9
        CV = (pi/24)*(length+width)^2*width;
end