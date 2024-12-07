%% Shape parameter extraction

clear,clc;
%Oriimage = 'D:\matlabproject\cottonboll\data'; 
Oriimage = 'D:\matlabproject\cottonboll';                                  % For testing
selected_folder = uigetdir(Oriimage);                                      % Directory where the files to be read are stored

Ori = selected_folder;
orifile = '.jpg';                                                          % Suffix of the files to be read
Dfiles = dir(fullfile(Ori, strcat('*', orifile)));
A = []; B = [];
for file_j = 1 : length(Dfiles)
    disp(file_j);                                                          % Display the current file number being processed
    oriName = Dfiles(file_j).name;
    noSuffixName = oriName(1:end-4);
    oriName1 = Dfiles(file_j).name;
    pathOriImgName = sprintf('%s%s%s', Ori, '\', oriName1);
    figure(1);
    imgOri = imshow(imread(pathOriImgName));                               % Read the image
    % Method 1
    roi = drawrectangle;                          
    if roi.Position(3) <= roi.Position(4)
        w = roi.Position(3);
        h = roi.Position(4); 
    else                                                                   % Ensure w < h
        w = roi.Position(4);
        h = roi.Position(3);
    end 
    % Method 2: roi = imcrop(imgOri);
    num = input('Enter the calculation parameter type (0 or 1):');
    if num == 0                                                            % Calculate parameters for front view
        [k, e, ~, sf] = para(h, w);
        A = [A; k e sf];
    else if num == 1                                                       % Calculate parameters for top view
            [k, e, q2, sf] = para(h, w);
            B = [B; k e q2 sf];
        end
    end 
end                                                                        % Path and file name to save

% Split the path using the directory separator
folderParts = strsplit(selected_folder, filesep);

% File name index
folderName = folderParts{end};
folderName1 = folderParts{end-1};

% File name prefix
fileNamePrefix = 'figure';

% Construct the file name
fileName = sprintf('%s%s.xlsx', fileNamePrefix, folderName);

% Save the data matrix to the specified path and automatically name the file
% filePath = fullfile(selected_folder, fileName);
% define_folder = 'D:\AAA文献\棉铃\data';
% filePath1 = fullfile(define_folder, folderName1, fileName);
% writematrix(A, filePath, 'Sheet', 1, 'Range', 'A2')
% writematrix(B, filePath, 'Sheet', 2, 'Range', 'A2')
% writematrix(A, filePath1, 'Sheet', 1, 'Range', 'A2')
% writematrix(B, filePath1, 'Sheet', 2, 'Range', 'A2')

%% Parameter Function
function [k, e, q2, sf] = para(h, w)
   c = abs(h - w);                                                         % Difference
   k = 1 - w / h;                                                          % Ellipticity (roundness)
   e = sqrt(1 - (w^2 / h^2));                                              % Eccentricity
   m = w * h;                                                              % Area of the detection box
   sf = k / e;
   %s1 = pi * w * h;                                                       % The original data used this function, resulting in pi
   %s1 = pi * w * h / 4;
   s2 = pi * ((w + h) / 2)^2;                                              % Fitted circle area (fullness)
   %q1 = s1 / m; Ellipse area ratio, this value is constant and not meaningful to extract
   q2 = s2 / m;                                                            % Circle area ratio
   if c < 0
      error('Incorrect relationship between length and width') 
   end
end
