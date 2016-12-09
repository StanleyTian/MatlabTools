clear all;clc
folder = 'F:\Tdevelop\Learning\Matlab-backup\Result data\';
data1=load(strcat(folder,'scale1'));
data2=load(strcat(folder,'scale2'));
data3=load(strcat(folder,'scale3'));
data4=load(strcat(folder,'scale4'));
data5=load(strcat(folder,'scale5'));

gammar=0.01:0.01:10.0;
plot(gammar,data1.TrainAccurate(1:1:end),'r--');hold on;
plot(gammar,data1.TestAccurate(1:1:end),'r-');hold on;
plot(gammar,data2.TestAccurate(1:1:end),'g-');hold on;
plot(gammar,data3.TestAccurate(1:1:end),'b-');hold on;
plot(gammar,data4.TestAccurate(1:1:end),'c-');hold on;
plot(gammar,data5.TestAccurate(1:1:end),'m-');hold on;
legend('训练样本','测试样本scale1','测试样本scale2','测试样本scale3','测试样本scale4','测试样本scale5','Location','SouthEast');
plot(gammar,data2.TrainAccurate(1:1:end),'g--');hold on;
plot(gammar,data3.TrainAccurate(1:1:end),'b--');hold on;
plot(gammar,data4.TrainAccurate(1:1:end),'c--');hold on;
plot(gammar,data5.TrainAccurate(1:1:end),'m--');hold on;

gammalimit_start = 1.01;
gammalimit = 2.5;
data = [data1,data2,data3,data4,data5];
for singledata = data
    [ymax,tp]=max(singledata.TestAccurate(gammalimit_start*100:gammalimit*100,1));
    plot((tp+gammalimit_start*100-1)/100.0,ymax,'o');hold on;
    text((tp+gammalimit_start*100-1)/100.0+0.05,ymax,num2str(ymax));hold on;
end

xlim([0 4]);
ylim([30 102]);
xlabel('Parameter  \gamma');
ylabel('Recognition rate (%)');
%grid on
saveas(gcf,strcat(folder,'结果图.bmp'));
saveas(gcf,strcat(folder,'结果图.fig'));