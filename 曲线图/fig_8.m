close all;clear;

% PSNR = [95.853961 93.808758 96.661059 92.106676 102.394304 99.626547 97.054081 99.307888 101.341296 105.769515 103.700864 100.775955 103.091245 101.716395 99.933193 100.648596 ];
% MSE = [2.60E-10 4.16E-10 2.16E-10 6.16E-10 5.76E-11 1.09E-10 1.97E-10 1.17E-10 7.34E-11 2.65E-11 4.26E-11 8.36E-11 4.91E-11 6.74E-11 1.02E-10 8.61E-11];
% 
% DTW = [0.012649 0.022043 0.013295 0.014898 0.006696 0.005418 0.010366 0.011019 0.010407 0.005882 0.005994 0.010656 0.007763 0.007833 0.011179 0.011069 ];
% ED = [0.076938 0.126708 0.071842 0.080497 0.028731 0.032876 0.043747 0.048775 0.031371 0.023830 0.025750 0.042721 0.031803 0.030307 0.046613 0.039930 ];
% 
% NDTW = [0.935221 0.851389 0.695306 0.856530 0.764397 0.647800 0.886477 0.883864 0.953941 0.957998 1.083238 1.267239 1.247208 1.457488 1.443999 1.703797 ];
% t = [30:10:180];
% % 创建图形并设置第一个纵轴
% figure(1);
% yyaxis left; % 左轴
% scatter(t, PSNR,'d','MarkerFaceColor',[0, 0.45, 0.74]);
% ylabel('PSNR');
% hold on
% scatter(t(11:end), PSNR(11:end),'d','MarkerFaceColor','r','MarkerEdgeColor','r');
% % 设置第二个纵轴
% yyaxis right; % 右轴
% scatter(t, MSE,'MarkerFaceColor',[0.85, 0.33, 0.1]);
% ylabel('MSE');
% hold on
% scatter(t(11:end), MSE(11:end), 'MarkerFaceColor','r','MarkerEdgeColor','r');
% % 添加标题和标签
% title('PSNR and MSE values');
% xlabel('Frequence(kHz)');
% xlim([30, 180]);
% xticks([30:10:180]);
% legend('PSNR','','MSE')
% figure(2);
% yyaxis left; % 左轴
% scatter(t, DTW, 'd','MarkerFaceColor',[0, 0.45, 0.74]);
% ylabel('DTW');
% hold on
% scatter(t(11:end), DTW(11:end), 'd','linewidth',1.2,'MarkerFaceColor','r','MarkerEdgeColor','r');
% % 设置第二个纵轴
% yyaxis right; % 右轴
% scatter(t, ED, 'MarkerFaceColor',[0.85, 0.33, 0.1]);
% ylabel('ED');
% hold on
% scatter(t(11:end), ED(11:end), 'MarkerFaceColor','r','MarkerEdgeColor','r');
% % 添加标题和标签
% title('DTW and ED values');
% xlabel('Frequence(kHz)');
% xlim([30, 180]);
% xticks([30:10:180]);
% legend('DTW','','ED')
% figure(3);
% scatter(t, NDTW, 'MarkerFaceColor',[0, 0.45, 0.74]);
% hold on
% scatter(t(11:end), NDTW(11:end), 'MarkerFaceColor','r');
% % 添加标题和标签
% title('NDTW values');
% xlabel('Frequence(kHz)');ylabel('NDTW');
% xlim([30, 180]);
% xticks([30:10:180]);

% PSNR0 = [98.062939 95.105824 93.722519 90.006526 106.798858 102.706997 97.364375 94.999531 101.622360 100.862479 101.291215 96.668310 98.957037 99.157058 99.192162 93.571871 ];
% MSE0 = [1.56E-10 3.09E-10 4.24E-10 9.98E-10 2.09E-11 5.36E-11 1.83E-10 3.16E-10 6.88E-11 8.20E-11 7.43E-11 2.15E-10 1.27E-10 1.21E-10 1.20E-10 4.39E-10];
% 
% DTW0 = [0.002924 0.002641 0.002584 0.005146 0.002194 0.001468 0.002640 0.003344 0.001655 0.003314 0.004339 0.007474 0.003288 0.003849 0.001753 0.003720 ];
% ED0 = [0.024964 0.031741 0.027095 0.064032 0.009782 0.008778 0.022477 0.027247 0.012070 0.016455 0.016409 0.034936 0.015657 0.013337 0.008935 0.018917 ];
% 
% NDTW0 = [0.592985 0.156572 0.458770 0.688445 0.666414 0.571587 0.724080 0.693368 0.528496 0.901037 1.224010 1.356220 1.432530 1.550564 1.181114 1.647632 ];
% t = [30:10:180];
% 
% XCORR=[0.998	1.000	0.998	0.997	0.999	0.999	0.998	0.997	0.999	0.998	0.995	0.979	0.971	0.978	0.987 0.910];
% 
% TANIMOTO=[0.996	0.999	0.997	0.995	0.999	0.999	0.997	0.993	0.998	0.997	0.989	0.958	0.943	0.957	0.974	0.828];
% MAHAL=[2.944	2.073	2.269	2.262	2.167	2.243	2.175	2.376	2.243	2.368	2.557	3.044	4.080	3.257	2.782	4.524];
% PEARSON=[0.998	1.000	0.998	0.997	0.999	0.999	0.998	0.997	0.999	0.998	0.995	0.979	0.971	0.978	0.987	0.910];
PSNR0 = [98.68	95.44	93.72	93.09	107.17	105.87	100.66	95.05	101.61	103.73	102.00	95.21	98.07	99.42	98.12	93.16 ];
MSE0 = [1.36E-10	2.86E-10	4.25E-10	4.90E-10	1.92E-11	2.59E-11	8.59E-11	3.12E-10	6.91E-11	4.24E-11	6.31E-11	3.01E-10	1.56E-10	1.14E-10	1.54E-10	4.83E-10];
DTW0 = [0.0022	0.0024	0.0028	0.0033	0.0019	0.0008	0.0023	0.0034	0.0016	0.0013	0.0038	0.0086	0.0046	0.0052	0.0026	0.0081];
ED0 = [5.52E-04	7.63E-04	8.63E-04	9.00E-04	2.10E-04	1.76E-04	3.90E-04	8.35E-04	3.41E-04	2.29E-04	3.64E-04	9.02E-04	5.60E-04	4.66E-04	4.25E-04	9.01E-04];

NDTW0 = [0.53	0.16	0.48	0.66	0.65	0.50	0.74	0.70	0.54	0.82	1.22	1.44	1.50	1.58	1.32	1.85];
t = [30:10:180];

XCORR=[1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	0.99	0.98	0.97	0.98	0.99	0.91];

TANIMOTO=[1.00	1.00	1.00	0.99	1.00	1.00	1.00	0.99	1.00	1.00	0.99	0.96	0.94	0.96	0.97	0.83];
MAHAL=[2.94	2.07	2.27	2.26	2.17	2.24	2.17	2.38	2.24	2.37	2.56	3.04	4.08	3.26	2.78	4.52];
PEARSON=[1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	0.99	0.98	0.97	0.98	0.99	0.91];

% 创建图形并设置第一个纵轴
figure;
% yyaxis left; % 左轴
% scatter(t, PSNR0, 'd','MarkerFaceColor',[0, 0.45, 0.74]);
% ylabel('PSNR');
% hold on
% scatter(t(11:end), PSNR0(11:end), 'd','MarkerFaceColor','r','MarkerEdgeColor','r');
% % 设置第二个纵轴
% yyaxis right; % 右轴
% scatter(t, MSE0, 'MarkerFaceColor',[0.85, 0.33, 0.1]);
% ylabel('MSE');
% hold on
% scatter(t(11:end), MSE0(11:end), 'MarkerFaceColor','r','MarkerEdgeColor','r');
% % 添加标题和标签
% title('PSNR and MSE values');
% xlabel('Frequence(kHz)');
% xlim([30, 180]);
% xticks([30:10:180]);
% legend('PSNR','','MSE')
% figure(5);
% yyaxis left; % 左轴
% scatter(t, DTW0, 'd','MarkerFaceColor',[0, 0.45, 0.74]);
% ylabel('DTW');
% hold on
% scatter(t(11:end), DTW0(11:end),'d', 'MarkerFaceColor','r','MarkerEdgeColor','r');
% % 设置第二个纵轴
% yyaxis right; % 右轴
% scatter(t, ED0, 'MarkerFaceColor',[0.85, 0.33, 0.1]);
% ylabel('ED');
% hold on
% scatter(t(11:end), ED0(11:end), 'MarkerFaceColor','r','MarkerEdgeColor','r');
% % 添加标题和标签
% title('DTW and ED values');
% xlabel('Frequence(kHz)');
% xlim([30, 180]);
% xticks([30:10:180]);
% legend('DTW','','ED')
% figure(6);
% scatter(t, NDTW0, 'MarkerFaceColor',[0, 0.45, 0.74]);
% hold on
% scatter(t(11:end), NDTW0(11:end), 'MarkerFaceColor','r','MarkerEdgeColor','r');
% % 添加标题和标签
% title('NDTW values');
% xlabel('Frequence(kHz)');ylabel('NDTW');
xlim([30, 180]);
xticks([30:10:180]);


scatter(t,TANIMOTO,'o','LineWidth',1.5)
hold on 
scatter(t,NDTW0,'r','*','LineWidth',1.5)
hold on 
scatter(t,DTW0*1e2,'diamond','LineWidth',1.5)
hold on 
scatter(t,ED0*1e3,'square','LineWidth',1.5)



legend('TANIMOTO','NDTW','DTW*1e2','ED*1e3')
xlabel('Frequency(kHz)')
xlim([29, 181]);
xticks([30:10:180]);

figure
scatter(t,PSNR0/1e2,'^','LineWidth',1.5)
hold on 
scatter(t,MSE0*1e10,'v','LineWidth',1.5)
hold on 
scatter(t,MAHAL,'>','LineWidth',1.5)
hold on 
scatter(t,XCORR,'<','LineWidth',1.5)

hold on 
scatter(t,PEARSON,'pentagram','LineWidth',1.5)
legend('PSNR/1e2','MSE*1E10','MAHAL','XCORR','PEARSON')
xlabel('Frequency(kHz)')
xlim([29, 181]);
xticks([30:10:180]);