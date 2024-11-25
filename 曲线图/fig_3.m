close all
NDTW=[0.194 0.715 1.027];
DTW=[0.00045 0.00084 0.00163];
ED=[0.0013 0.0034 0.0062];
PSNR=[122.0 111.7 105.6];
MSE=[6.3e-13 6.7e-12 2.5e-11];
XCORR=[1.000 1.000 0.998];
MAHAL=[2.200 2.309 2.279];
PEARSON=[1.000 1.000 0.998];
TANIMOTO=[1.000 0.999 0.996];
x=[50 100 150];
scatter(x,TANIMOTO,'o','LineWidth',1.5)
hold on 
scatter(x,NDTW,'r','*','LineWidth',1.5)
hold on 
scatter(x,DTW*1e3,'diamond','LineWidth',1.5)
hold on 
scatter(x,ED*1e2,'square','LineWidth',1.5)
hold on 
scatter(x,PSNR/1e2,'^','LineWidth',1.5)
hold on 
scatter(x,MSE*1e11,'v','LineWidth',1.5)
hold on 
scatter(x,XCORR,'<','LineWidth',1.5)
hold on 
scatter(x,MAHAL,'>','LineWidth',1.5)
hold on 
scatter(x,PEARSON,'pentagram','LineWidth',1.5)
legend('TANIMOTO','NDTW','DTW*1e3','ED*1e2','PSNR/1e2','MSE*1e11','XCORR','MAHAL','PEARSON')
xlabel('Frequency(kHz)')