
%% 组合矩阵在不同核函数参数γ下分类的输出结果
%r = 3;  %r取1，2，3，分别代表不降维、LPP降维、KLPP降维三种情况下得到的分类结果

%加载分类结果数据
folder = 'F:\Tdevelop\Learning\Matlab-backup\Samples\';
load(strcat(folder,'svm_result.mat'));

gammar=0.01:0.01:10.0;
plot(gammar,TrainAccurate(1:1:end),'k--');hold on;
plot(gammar,TestAccurate(1:1:end),'r-');hold off;
xlim([0 10]);
ylim([0 102]);
xlabel('Parameter  \gamma');
ylabel('Recognition rate (%)');
%grid on
legend('训练样本','测试样本','Location','SouthEast');
saveas(gcf,strcat(folder,'结果图.bmp'));
saveas(gcf,strcat(folder,'结果图.fig'));