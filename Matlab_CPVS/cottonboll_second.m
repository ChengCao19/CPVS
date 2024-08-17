%% 计算棉铃长、宽
clear,clc;
Oriimage = 'D:\matlabproject\cottonboll\fixed_boll_image';
%Oriimage = 'D:\matlabproject\cottonboll';        % 测试专用路径
Ori = uigetdir(Oriimage);                         % 自定义文件夹

orifile='.jpg';                                   % 被读取的文件名后缀
Dfiles = dir(fullfile(Ori, strcat('*', orifile)));

[~, selectedSubFolderName, ~] = fileparts(Ori);
modifiedFolderName = strcat('figure_', selectedSubFolderName);

A = [];B = [];                                    % 存储正视图参数
W = [];H = [];                                    % 存储宽与高
for file_j= 1 : length(Dfiles)
    disp(file_j);                                 % 显示当前处理的文件序号
    B = [B;file_j];
    oriName = Dfiles(file_j).name;
    noSuffixName = oriName(1:end-4);
    oriName1=Dfiles(file_j).name;
    pathOriImgName=sprintf('%s%s%s',Ori,'\',oriName1);

    figure(1);
    imgOri=imshow(imread(pathOriImgName));        % 读入图像
    % 法1
    roi = drawrectangle;
    roi.Color = [165, 42, 42]/255;                % RGB颜色归一化
    roi.LineWidth = 0.5;                          % 减小线宽为0.5
    % 创建一个确认框选的按钮
    uicontrol('String', '确认框选', 'Position', [100 100 100 40], 'Callback', 'uiresume(gcbf)');
    
    % 等待用户点击确认框选按钮
    uiwait(gcf);
    if roi.Position(3)<=roi.Position(4)
        w = roi.Position(3);
        h = roi.Position(4); 
    else                                          % 始终使得w<h
        w = roi.Position(4);
        h = roi.Position(3);
    end
    close(gcf);
    W = [W;w];                                    % 保存长与宽
    H = [H;h];
    % 法2: roi = imcrop(imgOri);
    [k,e,sf] = para(h,w);                         % 计算正视图参数
    A = [A;k e sf];
end
                                                  % 生成自定义文件的品种名称
varities = repmat({modifiedFolderName}, file_j, 1);
T = table(varities, W, H, A(:,1), A(:,2), A(:,3), ...
    'VariableNames', {'Varieties', 'Width', 'Height', 'K', 'E', 'SF'});
T.B = B;
% 生成存储文件的完整路径
saveFileNameXLSX = fullfile(Ori, [modifiedFolderName '.xlsx']);
% 将数据写入xlsx文件
%writetable(T, saveFileNameXLSX);
disp(['当前执行品种为: ' + string(selectedSubFolderName)])

%% 参数函数
function [k,e,sf]=para(h,w)
   c = abs(h-w);                                   % 差
   k = 1-w/h;                                      % 椭圆度(圆度)
   e = sqrt(1-(w^2/h^2));                          % 离心率
   sf = k/e;
   if c<0
      error('长和宽关系错误') 
   end
end