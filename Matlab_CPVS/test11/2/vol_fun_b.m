function [CV] = vol_fun_b(length,width,number)
% These function are a series of volume calculation model
% The optional values for parameter num are 1 to 5

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
        CV = 5/(10.5-width^2/length^2)*length*width^2;
    case 2
        CV = 0.43*length*width^2;
    case 3
        CV = 0.45*length*width^2;
    case 4
        CV = 0.47*length*width^2;
    case 5
        CV = 0.49*length*width^2;
    case 6
        CV = 0.51*length*width^2;
    case 7
        CV = 0.52*length*width^2;
end