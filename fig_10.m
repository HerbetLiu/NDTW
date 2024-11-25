close all;clear;
PSNR = [96.58	95.58	93.99];
MSE = [2.20E-10	2.77E-10	3.99E-10];
DTW = [2.72E-03	4.42E-03	8.29E-03];
ED = [0.02	0.03	0.06];
NDTW = [0.84	0.85	0.86];
t = [  1 2 3];
PSNR0 = [104.14	97.83	97.85 ];
MSE0 = [3.85E-11	1.65E-10	1.64E-10];
DTW0 = [7.47E-04	3.63E-03	5.21E-03];
ED0 = [3.46E-03	1.60E-02	2.40E-02];
NDTW0 = [1.23	1.60	1.61];
figure
scatter(t,NDTW0,'r','*','LineWidth',1.5)
hold on 
scatter(t,NDTW,'k','*','LineWidth',1.5)
legend('180 kHz','100 kHz')
figure
scatter(t,DTW0*1e2,'diamond','r','LineWidth',1.5)
hold on 
scatter(t,DTW*1e2,'diamond','k','LineWidth',1.5)
legend('180 kHz','100 kHz')
figure
scatter(t,ED0,'square','r','LineWidth',1.5)
hold on 
scatter(t,ED,'square','k','LineWidth',1.5)
legend('180 kHz','100 kHz')
figure
scatter(t,PSNR0,'^','r','LineWidth',1.5)
hold on 
scatter(t,PSNR,'^','k','LineWidth',1.5)
legend('180 kHz','100 kHz')
figure
scatter(t,MSE0,'v','r','LineWidth',1.5)
hold on 
scatter(t,MSE,'v','k','LineWidth',1.5)
legend('180 kHz','100 kHz')