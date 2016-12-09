%% 对训练图像集进行基于LBP的纹理特征提取

%% 加载训练图像数据
clear all,clc;
disp('加载图像数据');
folder = 'F:\Tdevelop\Learning\Matlab\Samples\';
TotalSet=load(strcat(folder,'Slab_test.mat'));
disp('提取训练图像的纹理特征');
nImageWidth=128;
mapping = getmapping(8,'u2');

%% 提取图像的 lbp特征

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
% Save Feature vector set
Feature = TotalSet.Feature;
Labels = TotalSet.Labels;
save(strcat(folder,'Slab_lbp81u2_test.mat'),'Feature','Labels','TotalTime');

