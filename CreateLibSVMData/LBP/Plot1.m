
%% ��Ͼ����ڲ�ͬ�˺����������·����������
%r = 3;  %rȡ1��2��3���ֱ������ά��LPP��ά��KLPP��ά��������µõ��ķ�����

%���ط���������
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
legend('ѵ������','��������','Location','SouthEast');
saveas(gcf,strcat(folder,'���ͼ.bmp'));
saveas(gcf,strcat(folder,'���ͼ.fig'));