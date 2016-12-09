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

function [TrainAccurate,TestAccurate,BestGammar,BestIndex]=...
                                siSVMClassify(TrainSet, TestSet, gammar)

TrainAccurate=zeros(length(gammar),1);
TestAccurate=zeros(length(gammar),1);

for g=1:length(gammar)
    model = fitcsvm(TrainSet.Feature,TrainSet.Labels,'KernelFunction','rbf','KernelScale',gammar(g)); 
    train_scores= predict(model,TrainSet.Feature);
    test_scores = predict(model,TestSet.Feature);
     
    train_accuracy = 100*(size(train_scores)-sum(abs(train_scores - TrainSet.Labels)))/size(train_scores);
    test_accuracy = 100*(size(test_scores)-sum(abs(test_scores - TestSet.Labels)))/size(test_scores);
    TrainAccurate(g)=train_accuracy;
    TestAccurate(g)=test_accuracy;
    
    strMsg = sprintf('%8.4f',gammar(g));
    strMsg = [strMsg blanks(5)  num2str(train_accuracy) blanks(15) num2str(test_accuracy)];
    disp(strMsg);    
    
%     [ConfuseMatrix, str, strDisplay] = ComputeConfusion(TestSet.Labels,
%     PredictLabel);
end
[Val,Idx]=max(TestAccurate);
BestGammar=gammar(Idx(1));
BestIndex=Idx(1);