%% 对训练图像集进行基于LBP的纹理特征提取

%% 加载训练图像数据
clear all,clc;
disp('加载图像数据');
TotalSet=load('F:\Tdevelop\Learning\Matlab\Samples2\Slab_train.mat');
disp('提取训练图像的纹理特征');
nImageWidth=128;
mapping = getmapping(8,'u2');

%strTempDir='D:\ayh\ContourletKLPP\Temp\Slab1\';
%if(~exist(strTempDir,'dir'))
%   mkdir(strTempDir);
%end


%% 提取图像的 contourlet特征
%for nFeaType = 15
    TotalTime = 0;
    TotalSet.Feature = [];
    for k=length(TotalSet.Labels):-1:1
        timer = cputime;
        I = reshape(TotalSet.Sample(k,:), nImageWidth, nImageWidth);
               
        %预处理
        gain=5;cutoff=0.5;%对比度拉伸参数
        I = adjcontrast(I, gain, cutoff);%调用adjcontrast函数对图像I做对比度拉伸
        
        %I = I*256;  %求灰度共生纹理时要将图像归一化到[1,256]
        
        %Fea = contourlet_moment(I, nFeaType);
        %Fea = Texture(I);
        Fea = lbp(I,1,8,mapping,'h');
        TotalSet.Feature(k,:) = Fea;
        timer = cputime-timer;
        TotalTime = TotalTime + timer;
        strMsg = sprintf('第%4d幅图像,%f秒', k, timer);
        disp(strMsg);
    end

    TotalTime;
    
    % Save Feature vector set
    Feature = TotalSet.Feature;
    Labels = TotalSet.Labels;
    save('F:\Tdevelop\Learning\Matlab\Samples2\Slab_lbp81u2_train.mat','Feature','Labels','TotalTime');
 %   strFile = fullfile(strTempDir,...
 %               ['ContourletFeature' num2str(nFeaType) '.mat']);
 %   save(strFile,'Feature','Labels');
%end
