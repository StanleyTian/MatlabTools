%% 将不同数据库进行组合画图

% 加载数据库
%data1=load('D:\ayh\CT_KLPP\Results\BrodatzFea2(2)_svm.mat');%Brodatz数据(23/234/2345)
data1=load('E:\Contourlet\BHSlab_klpp51_SVM.mat');%Slab数据
data2=load('E:\Contourlet\BHSlab_Contourlet_svm.mat');
data3=load('E:\Contourlet\BHSlab_Wavelet_svm.mat');
% data4=load('D:\ayh\CT_KLPP\Results\AluminumFea2(345)_svm(4).mat');
%data5=load('D:\ayh\CT_KLPP\Results\SlabFea2(2345)_svm.mat');

% 提取测试集的识别率
TestAccurate1=data1.TestAccurate;
% TrainAccurate1 =data1.TrainAccurate;
TestAccurate2=data2.TestAccurate;
TestAccurate3=data3.TestAccurate;
% TestAccurate4=data4.TestAccurate;
%TestAccurate5=data5.TestAccurate;





% 将不同数据库中的数据存储在一个数据库中
    %save('CombFea_KLPP.mat','TestAccurate1','TestAccurate2','TestAccurate3','TestAccurate4','TestAccurate5');
    %save('CombFea_KLPP+NONE.mat','TestAccurate1','TestAccurate2');

% 画图 
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
% set(gcf,'Units','centimeters','Position',[12 12 10.5 8]);%设置图片大小为7cm×5cm
 set(gca, 'fontname', 'Times', 'fontsize', 10)     % 修改坐标轴字体类型为Times，大小12pt
 xlabel('Parameter  \gamma', 'fontsize', 10);      % 设置字体大小为12pt
 ylabel('Classification rate (%)', 'fontsize', 10);      % 设置字体大小为12pt
 set(get(gca,'XLabel'),'FontSize',10);%图上文字为8 point或小5号
 set(get(gca,'YLabel'),'FontSize',10);%图上文字为8 point或小5号
 %g_legend=legend('[4]','[4,8]','[4,8,16]','[4,8,16,32]','Location','SouthEast');   % 生成legend，并取得句柄
 g_legend=legend('Contourlet-KLPP','Contourlet','Wavelet') %'GLCP','Wavelet','Contourlet','CT-KLPP','Location','SouthEast');
 set(g_legend, 'fontsize', 7.5)     % 修改legend中字体大小为10pt，而字体类型继承gca，即Times
 
 
 
 %set(gca, 'color', 'none')      % 去掉坐标轴的背景色
 %set(gcf, 'color', 'none')       % 去掉图像的背景色
 %set(g_legend, 'color', 'w')     % 恢复legend的背景色为白色，避免与图像背景相冲突



