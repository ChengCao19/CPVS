Oriimage = 'D:\matlabproject\cottonboll\fixed_boll_image';
%Oriimage = 'D:\matlabproject\cottonboll';        % Test-specific path
Ori = uigetdir(Oriimage);                         % Custom folder selection

orifile='.jpg';                                   % File extension of the images to be read
Dfiles = dir(fullfile(Ori, strcat('*', orifile)));

[~, selectedSubFolderName, ~] = fileparts(Ori);
modifiedFolderName = strcat('figure_', selectedSubFolderName);

A = [];B = [];                                    % Store front view parameters
W = [];H = [];                                    % Store width and height
for file_j= 1 : length(Dfiles)
    disp(file_j);                                 % Display the current file index being processed
    B = [B;file_j];
    oriName = Dfiles(file_j).name;
    noSuffixName = oriName(1:end-4);
    oriName1=Dfiles(file_j).name;
    pathOriImgName=sprintf('%s%s%s',Ori,'\',oriName1);

    figure(1);
    imgOri=imshow(imread(pathOriImgName));        % Read the image
    % Method 1
    roi = drawrectangle;
    roi.Color = [165, 42, 42]/255;                % RGB color normalization
    roi.LineWidth = 0.5;                          % Set line width to 0.5
    % Create a confirmation button for the selection
    uicontrol('String', 'Confirm Selection', 'Position', [100 100 100 40], 'Callback', 'uiresume(gcbf)');
    
    % Wait for the user to click the confirmation button
    uiwait(gcf);
    if roi.Position(3)<=roi.Position(4)
        w = roi.Position(3);
        h = roi.Position(4); 
    else                                          % Ensure w<h
        w = roi.Position(4);
        h = roi.Position(3);
    end
    close(gcf);
    W = [W;w];                                    % Save width and height
    H = [H;h];
    % Method 2: roi = imcrop(imgOri);
    [k,e,sf] = para(h,w);                         % Calculate front view parameters
    A = [A;k e sf];
end
                                                  % Generate the variety name for the custom file
varities = repmat({modifiedFolderName}, file_j, 1);
T = table(varities, W, H, A(:,1), A(:,2), A(:,3), ...
    'VariableNames', {'Varieties', 'Width', 'Height', 'K', 'E', 'SF'});
T.B = B;
% Generate the full path for storing the file
saveFileNameXLSX = fullfile(Ori, [modifiedFolderName '.xlsx']);
% Write data to the xlsx file
%writetable(T, saveFileNameXLSX);
disp(['The current variety being processed is: ' + string(selectedSubFolderName)])

%% Parameter Function
function [k,e,sf]=para(h,w)
   c = abs(h-w);                                   % Difference
   k = 1-w/h;                                      % Ellipticity (Roundness)
   e = sqrt(1-(w^2/h^2));                          % Eccentricity
   sf = k/e;
   if c<0
      error('Incorrect length and width relationship') 
   end
end
