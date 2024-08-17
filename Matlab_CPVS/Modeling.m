%% 清空变量
clear,clc;

%% 选择文件夹

%Oriimage = 'D:\matlabproject\cottonboll';                                 % 主文件夹
Oriimage = 'D:\matlabproject\cottonboll\Test';                             % 测试路径
Ori = uigetdir(Oriimage);                                                  % 自定义子文件夹
orifile='.jpg';                                                            % 被读取的文件名后缀
Dfiles = dir(fullfile(Ori, strcat('*', orifile)));                         % 导入图片通常不要太多

%% 导入图像并估计长与宽
CV = [];                                                                   % 存储体积
CA1 = [];                                                                  % 存储表面积
CA2 = [];
Th = [];                                                                   % 存储长宽度
num = [];
for file_j = 1 : length(Dfiles)
    oriName = Dfiles(file_j).name;
    pathOriImgName = sprintf('%s%s%s',Ori,'\',oriName);
    figure(1);
    imgOri = imshow(imread(pathOriImgName));                               % 读入图像
    % 框选操作
    roi = drawrectangle;
    roi.Color = [165, 42, 42]/255;                                         % RGB颜色归一化
    roi.LineWidth = 0.5;                                                   % 减小线宽为0.5
    % 创建一个确认框选的按钮
    uicontrol('String', '确认框选', 'Position', [100 100 100 40], 'Callback', 'uiresume(gcbf)');
    
    % 等待用户点击确认框选按钮
    uiwait(gcf);
    if roi.Position(3)<=roi.Position(4)
        w = roi.Position(3);
        h = roi.Position(4); 
    else                                                                   % 始终使得w<h
        w = roi.Position(4);
        h = roi.Position(3);
    end
    close(gcf);
    num = [num; file_j];
    [CV1,CA11,CA21,len_pre1,wid_pre1] = Calvolume(w, h);
    [CV2,CA12,CA22,~,~] = Po_fun(w, h);                                    % 由于长宽估计算法相同，故后面该参数省略
    [CV3,CA13,CA23,~,~] = Geo_fun(w,h);
    [CV4,CA14,CA24,~,~] = Ter_fun(w, h);
    [CV5,CA15,CA25,~,~] = Bin_fun(w, h);
    CV = [CV;CV1 CV2 CV3 CV4 CV5];                                         % 所有体积模型的计算结果
    CA1 = [CA1;CA11 CA12 CA13 CA14 CA15];                                  % 不同体积下的表面积模型1结果
    CA2 = [CA2;CA21 CA22 CA23 CA24 CA25];                                  % 不同体积下的表面积模型2结果
    Th = [Th;len_pre1 wid_pre1];

end
%% 保存文件
T_CV = table(num, CV(:,1), CV(:,2), CV(:,3), CV(:,4), CV(:,5), ...
    'VariableNames', {'FileJ', 'CV1', 'CV2', 'CV3', 'CV4', 'CV5'});
T_CA1 = table(num, CA1(:,1), CA1(:,2), CA1(:,3), CA1(:,4), CA1(:,5), ...
    'VariableNames', {'FileJ', 'CA11', 'CA12', 'CA13', 'CA14', 'CA15'});
T_CA2 = table(num, CA2(:,1), CA2(:,2), CA2(:,3), CA2(:,4), CA2(:,5), ...
    'VariableNames', {'FileJ', 'CA21', 'CA22', 'CA23', 'CA24', 'CA25'});
T_Th = table(num, Th(:,1), Th(:,2), ...
    'VariableNames', {'FileJ', 'LengthPre1', 'WidPre1'});

[~, lastOriName] = fileparts(Ori);
                                                                           % 结合新的文件名
newFileName = sprintf('%s_Parameter_Result.xlsx', lastOriName);
newFilePath = 'D:\matlabproject\cottonboll\Test_Result';
                                                                           % 构造完整的新文件路径
fullNewFilePath = fullfile(newFilePath, newFileName);

writetable(T_CV, fullNewFilePath, 'Sheet',1);
writetable(T_CA1, fullNewFilePath, 'Sheet',2);
writetable(T_CA2, fullNewFilePath, 'Sheet',3);
writetable(T_Th, fullNewFilePath, 'Sheet',4);

% 注：如果文件已存在，writetable 默认会覆盖该文件。



