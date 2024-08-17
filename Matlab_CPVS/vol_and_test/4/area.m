function [CA] = area(length,width,volume,number)
% These function are a series of area calculation model
% The optional values for parameter num are 1 to 9

%% Validating input parameters
if length <= 0 || width <= 0
    error('Length and width must be positive numbers.');
end

if number < 1 || number > 9 || number ~= round(number)
    warning('Formula number must be an integer between 1 and 9.');
    CA = NaN;
    return;
end
p = 1.6075;
e = sqrt(1-width^2/length^2);

switch number
    case 1
        CA = 0.55*length*width^2;
    case 2
        CA = 0.565*length*width^2;
    case 3
        CA = 0.57*length*width^2;
    case 4
        CA = 3.8505*volume^0.6314;
    case 5
        CA = 0.755*volume+10.383;
    case 6
        CA = 4.6585 + 0.6684*width^2 + 1.0951*length*width;
        %CA = (pi*width/2)*(length*asin(e)/e+width);
        %CA = 1.077*width^2+1.879*length*width+0.08*length^2;  
        %CA = (4*pi)*((1/3)*(2*(length/2)^p*(width/2)^p+(width/2)^(2*p)))^(1/p);
        %CA = (pi*(length+width)^2)/4;
end