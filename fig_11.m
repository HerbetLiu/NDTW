close all;clear;
t = [30:10:180];
Reciprocity=[-207.7 	-206.4 	-205.1 	-204.4 	-205.4 	-206.8 	-209.1 	-210.9 	-212.5 	-214.2 	-215.6 	-218.2 	-220.0 	-221.3 	-223.0 	-224.6  ];
Optical=[-208.16 	-205.94 	-204.76 	-204.67 	-204.99 	-206.37 	-208.58 	-210.40 	-212.39 	-213.99 	-214.9 	-217.03 	-218.54 	-219.90 	-221.04 	-222.25 ];
NDTW=[0.592985 	0.156572 	0.458770 	0.688445 	0.666414 	0.571587 	0.724080 	0.693368 	0.528496 	0.901037 	1.224010 	1.356220 	1.432530 	1.550564 	1.181114 	1.647632 ];
figure
plot(t, Reciprocity,'k','linewidth',1.5);
hold on;
plot(t, Optical,'r','linewidth',1.5);
err = 0.7*ones(size(Reciprocity));
errorbar(t,Reciprocity,err,'k','LineStyle','none','LineWidth', 1.5)
err = 0.5*ones(size(Reciprocity));
errorbar(t,Optical,err,'r','LineStyle','none','LineWidth', 1.5)
xlabel('Frequency (kHz)');
ylabel('Sensitivity (dB re 1V/μPa)', 'FontName', 'LucidaSanRegular');
legend('Reciprocity method','Optical method')
hold on 
yyaxis right;
scatter(t, NDTW, 'MarkerFaceColor','k','MarkerEdgeColor','k');
hold on
scatter(t(11:end), NDTW(11:end), 'MarkerFaceColor','r','MarkerEdgeColor','r');
ylabel('NDTW');
xlim([30, 180]);
xticks([30:10:180]);

