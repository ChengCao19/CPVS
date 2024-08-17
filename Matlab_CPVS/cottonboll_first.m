%% 计算棉铃长、宽
clear,clc;
%Oriimage = 'D:\matlabproject\cottonboll\data'; 
Oriimage = 'D:\matlabproject\cottonboll';        % 测试专用
selected_folder = uigetdir(Oriimage);             % 被读取文件的存放目录

Ori=selected_folder;
orifile='.jpg';                                   % 被读取的文件名后缀
Dfiles = dir(fullfile(Ori, strcat('*', orifile)));
A=[];B=[];
for file_j= 1 : length(Dfiles)
    disp(file_j);                                 % 显示当前处理的文件序号
    oriName = Dfiles(file_j).name;
    noSuffixName = oriName(1:end-4);
    oriName1=Dfiles(file_j).name;
    pathOriImgName=sprintf('%s%s%s',Ori,'\',oriName1);
    figure(1);
    imgOri=imshow(imread(pathOriImgName));        % 读入图像
    % 法1
    roi = drawrectangle;                  
    if roi.Position(3)<=roi.Position(4)
        w = roi.Position(3);
        h = roi.Position(4); 
    else                                          % 始终使得w<h
        w = roi.Position(4);
        h = roi.Position(3);
    end 
    % 法2: roi = imcrop(imgOri);
    num = input('请输入计算参数类型（0或1）：');
    if num==0                                     % 计算正视图参数
        [k,e,~,sf] = para(h,w);
        A = [A;k e sf];
        else if num==1                            % 计算俯视图参数
            [k,e,q2,sf] = para(h,w);
            B = [B;k e q2 sf];
        end
    end 
end                                               % 需要保存的文件名称及路径

% 使用目录分隔符分割路径
folderParts = strsplit(selected_folder, filesep);

% 文件名编号
folderName = folderParts{end};
folderName1 = folderParts{end-1};

% 文件名前缀
fileNamePrefix = 'figure';

% 构建文件名
fileName = sprintf('%s%s.xlsx', fileNamePrefix,folderName);

% 将数据矩阵保存到指定路径并自动命名文件
% filePath = fullfile(selected_folder, fileName);
% define_folder = 'D:\AAA文献\棉铃\data';
% filePath1 = fullfile(define_folder, folderName1,fileName);
% writematrix(A,filePath,'Sheet',1,'Range','A2')
% writematrix(B,filePath,'Sheet',2,'Range','A2')
% writematrix(A,filePath1,'Sheet',1,'Range','A2')
% writematrix(B,filePath1,'Sheet',2,'Range','A2')

%% 参数函数
function [k,e,q2,sf]=para(h,w)
   c = abs(h-w);                                   % 差
   k = 1-w/h;                                      % 椭圆度(圆度)
   e = sqrt(1-(w^2/h^2));                          % 离心率
   m = w*h;                                        % 检测框面积
   sf = k/e;
   %s1 = pi*w*h;                                   原数据使用此函数导致结果为pi
   %s1 = pi*w*h/4;
   s2 = pi*((w+h)/2)^2;                            % 拟合圆面积(饱满度)
   %q1 = s1/m; 椭圆面积占比,该值为定值，并无提取意义
   q2 = s2/m;                                      % 圆面积占比
   if c<0
      error('长和宽关系错误') 
   end
end