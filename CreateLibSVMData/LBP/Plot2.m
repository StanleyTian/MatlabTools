%% ����ͬ���ݿ������ϻ�ͼ

% �������ݿ�
%data1=load('D:\ayh\CT_KLPP\Results\BrodatzFea2(2)_svm.mat');%Brodatz����(23/234/2345)
data1=load('E:\Contourlet\BHSlab_klpp51_SVM.mat');%Slab����
data2=load('E:\Contourlet\BHSlab_Contourlet_svm.mat');
data3=load('E:\Contourlet\BHSlab_Wavelet_svm.mat');
% data4=load('D:\ayh\CT_KLPP\Results\AluminumFea2(345)_svm(4).mat');
%data5=load('D:\ayh\CT_KLPP\Results\SlabFea2(2345)_svm.mat');

% ��ȡ���Լ���ʶ����
TestAccurate1=data1.TestAccurate;
% TrainAccurate1 =data1.TrainAccurate;
TestAccurate2=data2.TestAccurate;
TestAccurate3=data3.TestAccurate;
% TestAccurate4=data4.TestAccurate;
%TestAccurate5=data5.TestAccurate;





% ����ͬ���ݿ��е����ݴ洢��һ�����ݿ���
    %save('CombFea_KLPP.mat','TestAccurate1','TestAccurate2','TestAccurate3','TestAccurate4','TestAccurate5');
    %save('CombFea_KLPP+NONE.mat','TestAccurate1','TestAccurate2');

% ��ͼ 
gammar=0.01:0.01:4.0;
%gammar1=0.1:0.1:6.0;
plot(gammar,TestAccurate1(1:1:end),'r-','LineWidth',1);hold on;
% plot(gammar,TrainAccurate1(1:1:end),'k-.','LineWidth',1);hold on;
plot(gammar,TestAccurate2(1:1:end),'b-.','LineWidth',1);hold on;
plot(gammar,TestAccurate3(1:1:end),'k--','LineWidth',1);hold on;
% plot(gammar,TestAccurate4(1:10:end),'m-d','LineWidth',1);hold on;
%plot(gammar,TestAccurate5,'c-');hold on;


xlim([0 4]);
%ylim([70 95]);
%Title('The recognition rates under different features');
%Title('The recognition rates under different decomposition levels');
%grid on
%legend('NONE','KLPP','Location','SouthEast');
% set(gcf,'Units','centimeters','Position',[12 12 10.5 8]);%����ͼƬ��СΪ7cm��5cm
 set(gca, 'fontname', 'Times', 'fontsize', 10)     % �޸���������������ΪTimes����С12pt
 xlabel('Parameter  \gamma', 'fontsize', 10);      % ���������СΪ12pt
 ylabel('Classification rate (%)', 'fontsize', 10);      % ���������СΪ12pt
 set(get(gca,'XLabel'),'FontSize',10);%ͼ������Ϊ8 point��С5��
 set(get(gca,'YLabel'),'FontSize',10);%ͼ������Ϊ8 point��С5��
 %g_legend=legend('[4]','[4,8]','[4,8,16]','[4,8,16,32]','Location','SouthEast');   % ����legend����ȡ�þ��
 g_legend=legend('Contourlet-KLPP','Contourlet','Wavelet') %'GLCP','Wavelet','Contourlet','CT-KLPP','Location','SouthEast');
 set(g_legend, 'fontsize', 7.5)     % �޸�legend�������СΪ10pt�����������ͼ̳�gca����Times
 
 
 
 %set(gca, 'color', 'none')      % ȥ��������ı���ɫ
 %set(gcf, 'color', 'none')       % ȥ��ͼ��ı���ɫ
 %set(g_legend, 'color', 'w')     % �ָ�legend�ı���ɫΪ��ɫ��������ͼ�񱳾����ͻ



