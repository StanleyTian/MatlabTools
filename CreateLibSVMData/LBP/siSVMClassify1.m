%©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥
% File Name:   siSVMClassify.m
% Parameters:  None
% Description: Classify via SVM algorithm.
% Affiliation: National Engineering Research Center for Advanced Rolling,
%              University of Science and Technology Beijing, Beijing,
%              China.
% Author:      Xiuyong Wu(wxy0588@163.com,co-supervised by Jinwu Xu,Ke Xu).
% Date Time:   2009-09-08
% Last Modify: 2010-01-15
%©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥

function [TrainAccurate,TestAccurate,BestGammar,ConfuseMatrix]=...
                                siSVMClassify1(TrainSet, TestSet, gammar)

TrainAccurate=zeros(length(gammar),1);
TestAccurate=zeros(length(gammar),1);

for g=1:length(gammar)
    libsvm_options=['-s 0 -t 2 -g ' num2str(gammar(g))];
    model = svmtrain(TrainSet.Labels, TrainSet.Feature, libsvm_options);
    [PredictLabel, accuracy1] = svmpredict(TrainSet.Labels, TrainSet.Feature,model);
    %disp(num2str([gammar(g); accuracy]'));
    TrainAccurate(g)=accuracy1(1);
    [PredictLabel, accuracy2] = svmpredict(TestSet.Labels, TestSet.Feature,model);
    TestAccurate(g)=accuracy2(1);
    
    strMsg = sprintf('%8.4f',gammar(g));
    strMsg = [strMsg blanks(5)  num2str(accuracy1') blanks(15) num2str(accuracy2')];
    disp(strMsg);    
    
    [ConfuseMatrix, str, strDisplay] = ComputeConfusion(TestSet.Labels,PredictLabel);
end
[Val,Idx]=max(TestAccurate);
BestGammar=gammar(Idx(1));
BestIndex=Idx(1);