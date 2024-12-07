%% Clear variables
clear,clc;

%% Import image data

Oriimage = 'D:\matlabproject\cottonboll';                                  % Main folder
%Oriimage = 'D:\matlabproject\cottonboll\Test';                            % Test path
Ori = uigetdir(Oriimage);                                                  % Custom subfolder
orifile='.jpg';                                                            % Suffix of the files to be read
Dfiles = dir(fullfile(Ori, strcat('*', orifile)));                         % Import images, usually not too many

%% CPVS program
CV = [];                                                                   % Store volume
CA1 = [];                                                                  % Store surface area
CA2 = [];
Th = [];                                                                   % Store length and width
num = [];
for file_j = 1 : length(Dfiles)
    oriName = Dfiles(file_j).name;
    pathOriImgName = sprintf('%s%s%s',Ori,'\',oriName);
    figure(1);
    imgOri = imshow(imread(pathOriImgName));                               % Read images

    %----------------------------------------------------------------------
    % SaE module of CPVS
    %----------------------------------------------------------------------

    roi = drawrectangle;
    roi.Color = [165, 42, 42]/255;                                         % ormalize RGB color
    roi.LineWidth = 0.5;                                                   % Reduce line width to 0.5
    % Create a button to confirm the selection
    uicontrol('String', '确认框选', 'Position', [100 100 100 40], 'Callback', 'uiresume(gcbf)');
    
    % Wait for the user to click the confirm selection button
    uiwait(gcf);
    if roi.Position(3)<=roi.Position(4)
        w = roi.Position(3);
        h = roi.Position(4); 
    else                                                                   % Ensure w < h
        w = roi.Position(4);
        h = roi.Position(3);
    end
    close(gcf);
    num = [num; file_j];

    %----------------------------------------------------------------------
    % SPC and PPE modules of CPVS
    % Mainly by calling Calvolume
    %----------------------------------------------------------------------

    [CV1,CA11,CA21,len_pre1,wid_pre1] = Calvolume(w, h);                   
    [CV2,CA12,CA22,~,~] = Po_fun(w, h);                                    % Since the length-width estimation algorithm is the same, 
    [CV3,CA13,CA23,~,~] = Geo_fun(w,h);                                    % this parameter is omitted later
    [CV4,CA14,CA24,~,~] = Ter_fun(w, h);
    [CV5,CA15,CA25,~,~] = Bin_fun(w, h);
    CV = [CV;CV1 CV2 CV3 CV4 CV5];                                         % Results from all volume models
    CA1 = [CA1;CA11 CA12 CA13 CA14 CA15];                                  % Results from surface area model 1 for different volumes
    CA2 = [CA2;CA21 CA22 CA23 CA24 CA25];                                  % Results from surface area model 2 for different volumes
    Th = [Th;len_pre1 wid_pre1];

end

%% Integrated calculation results
T_CV = table(num, CV(:,1), CV(:,2), CV(:,3), CV(:,4), CV(:,5), ...
    'VariableNames', {'FileJ', 'CV1', 'CV2', 'CV3', 'CV4', 'CV5'});
T_CA1 = table(num, CA1(:,1), CA1(:,2), CA1(:,3), CA1(:,4), CA1(:,5), ...
    'VariableNames', {'FileJ', 'CA11', 'CA12', 'CA13', 'CA14', 'CA15'});
T_CA2 = table(num, CA2(:,1), CA2(:,2), CA2(:,3), CA2(:,4), CA2(:,5), ...
    'VariableNames', {'FileJ', 'CA21', 'CA22', 'CA23', 'CA24', 'CA25'});
T_Th = table(num, Th(:,1), Th(:,2), ...
    'VariableNames', {'FileJ', 'LengthPre1', 'WidPre1'});

[~, lastOriName] = fileparts(Ori);
                                                                           % Combine with the new file name
newFileName = sprintf('%s_Parameter_Result.xlsx', lastOriName);
newFilePath = 'D:\matlabproject\cottonboll\Test_Result';
                                                                           % Construct the full new file path
fullNewFilePath = fullfile(newFilePath, newFileName);

writetable(T_CV, fullNewFilePath, 'Sheet',1);
writetable(T_CA1, fullNewFilePath, 'Sheet',2);
writetable(T_CA2, fullNewFilePath, 'Sheet',3);
writetable(T_Th, fullNewFilePath, 'Sheet',4);

% Note: If the file already exists, writetable will overwrite the file by default.
