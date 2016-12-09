%% 对训练图像集进行基于MBLBP的纹理特征提取

%% 加载训练图像数据
clear all;
disp('加载图像数据');
folder = 'F:\Tdevelop\Learning\Matlab-backup\Samples\';
TotalSet=load(strcat(folder,'img_data_train.mat'));
disp('提取训练图像的纹理特征');
nImageWidth=128;
scales=1;%子区块大小
mapping = getmapping(8,'u2');

TotalTime = 0;
TotalSet.Feature = [];
for k=length(TotalSet.Labels):-1:1
    timer = cputime;
    I = reshape(TotalSet.Sample(k,:), nImageWidth, nImageWidth);

    %预处理
    gain=5;cutoff=0.5;%对比度拉伸参数
    I = adjcontrast(I, gain, cutoff);%调用adjcontrast函数对图像I做对比度拉伸
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %多块mblbp

    MBLBPimg=MBLBP(I,scales);%获取mblbp图
    Fea = map_a_lbp_image(MBLBPimg,mapping,'h');%获取其直方图
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    TotalSet.Feature(k,:) = Fea;
    timer = cputime-timer;
    TotalTime = TotalTime + timer;
    strMsg = sprintf('第%4d幅图像,%f秒', k, timer);
    disp(strMsg);
end
% Save Feature vector set
Feature = TotalSet.Feature;
Labels = TotalSet.Labels;
save(strcat(folder,'img_lbp_train.mat'),'Feature','Labels','TotalTime');
