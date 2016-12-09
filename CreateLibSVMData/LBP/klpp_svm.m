%% 降维后进行SVM分类
%加载训练集和测试集的特征
clear all;
TotalTime = cputime;  %开始计时
SelSet.Feature=[];
folder = 'F:\Tdevelop\Learning\Matlab-backup\Samples\';

%加载训练集和测试集特征
TrainSet = load(strcat(folder,'img_lbp_train.mat'));% 训练集样本
TestSet = load(strcat(folder,'img_lbp_test.mat'));%测试集样本

%调用降维函数
DimReduceTime = 0;
timer1 = cputime;
            
%svm分类
[Feature1, PS] = mapminmax(TrainSet.Feature');            %归一化
[Feature2] = mapminmax('apply',TestSet.Feature',PS);
TrainSet.Feature = Feature1';
TestSet.Feature = Feature2';
           
gammar = 0.01:0.01:10.0;
[TrainAccurate,TestAccurate,BestGammar]=...          
                    siSVMClassify(TrainSet, TestSet, gammar);      %SVM分类

TotalTime = cputime-TotalTime; %计算分类所用时间
% 保存降维情况下的svm结果                            
save(strcat(folder,'svm_result.mat'),'TrainAccurate','TestAccurate','BestGammar','TotalTime','DimReduceTime'); 

%求最好分类效果时的混淆矩阵
% gammar = 3;
% [TrainAccurate,TestAccurate,BestGammar0,ConfuseMatrix]=...          
%                                 siSVMClassify1(TrainSet, TestSet, gammar); % SVM分类,
% save('.\BHSlab_lbpu2_confuse.mat','ConfuseMatrix','TrainAccurate','TestAccurate','gammar');



                             
                             
                             