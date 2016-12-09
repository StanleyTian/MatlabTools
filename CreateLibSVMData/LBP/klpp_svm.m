%% ��ά�����SVM����
%����ѵ�����Ͳ��Լ�������
clear all;
TotalTime = cputime;  %��ʼ��ʱ
SelSet.Feature=[];
folder = 'F:\Tdevelop\Learning\Matlab-backup\Samples\';

%����ѵ�����Ͳ��Լ�����
TrainSet = load(strcat(folder,'img_lbp_train.mat'));% ѵ��������
TestSet = load(strcat(folder,'img_lbp_test.mat'));%���Լ�����

%���ý�ά����
DimReduceTime = 0;
timer1 = cputime;
            
%svm����
[Feature1, PS] = mapminmax(TrainSet.Feature');            %��һ��
[Feature2] = mapminmax('apply',TestSet.Feature',PS);
TrainSet.Feature = Feature1';
TestSet.Feature = Feature2';
           
gammar = 0.01:0.01:10.0;
[TrainAccurate,TestAccurate,BestGammar]=...          
                    siSVMClassify(TrainSet, TestSet, gammar);      %SVM����

TotalTime = cputime-TotalTime; %�����������ʱ��
% ���潵ά����µ�svm���                            
save(strcat(folder,'svm_result.mat'),'TrainAccurate','TestAccurate','BestGammar','TotalTime','DimReduceTime'); 

%����÷���Ч��ʱ�Ļ�������
% gammar = 3;
% [TrainAccurate,TestAccurate,BestGammar0,ConfuseMatrix]=...          
%                                 siSVMClassify1(TrainSet, TestSet, gammar); % SVM����,
% save('.\BHSlab_lbpu2_confuse.mat','ConfuseMatrix','TrainAccurate','TestAccurate','gammar');



                             
                             
                             