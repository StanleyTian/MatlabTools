%% ��ѵ��ͼ�񼯽��л���MBLBP������������ȡ

%% ����ѵ��ͼ������
clear all,clc;
disp('����ͼ������');
folder = 'F:\Tdevelop\Learning\Matlab\Samples\';
TotalSet=load(strcat(folder,'Slab_test.mat'));
disp('��ȡѵ��ͼ�����������');
nImageWidth=128;
scales=3;%�������С
mapping = getmapping(8,'u2');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TotalTime = 0;
TotalSet.Feature = [];
for k=length(TotalSet.Labels):-1:1
    timer = cputime;
    I = reshape(TotalSet.Sample(k,:), nImageWidth, nImageWidth);

    %Ԥ����
    gain=5;cutoff=0.5;%�Աȶ��������
    I = adjcontrast(I, gain, cutoff);%����adjcontrast������ͼ��I���Աȶ�����
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %���mblbp
    MBLBPimg=MBLBP(img,scales);%��ȡmblbpͼ
    Fea = map_a_lbp_image(MBLBPimg,mapping,'h');%��ȡ��ֱ��ͼ
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    TotalSet.Feature(k,:) = Fea;
    timer = cputime-timer;
    TotalTime = TotalTime + timer;
    strMsg = sprintf('��%4d��ͼ��,%f��', k, timer);
    disp(strMsg);
end
% Save Feature vector set
Feature = TotalSet.Feature;
Labels = TotalSet.Labels;
save(strcat(folder,'Slab_lbp81u2_test.mat'),'Feature','Labels','TotalTime');
