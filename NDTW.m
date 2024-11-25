clear;
close all;
Bragg_cell = 40e+6;
optical_wavelength= 632.8e-9;
%% 仿真
[filename,pathname]=uigetfile('*.mat', 'Pick a data file');
str=[pathname filename];
measurement_data = load(str);
measurement_data = measurement_data.simin;
acoustic_frequency = str2num(filename(1:(length(filename)-5)))* 1000;
%% 实测
% [filename,pathname]=uigetfile('*.csv', 'Pick a data file');
% str=[pathname filename]
% measurement_data=csvread(str,5,0);
% acoustic_frequency = str2num(filename(5:(length(filename)-14)))* 1000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time_data=measurement_data(:,1);
time_data=time_data-time_data(1);
time_data=time_data(1:0.7*length(time_data)); 
signal_data=measurement_data(:,2);
signal_data=signal_data(1:0.7*length(signal_data)); 
%% 初始化
total_points=size(signal_data,1);
time_step=time_data(2)-time_data(1);
fs = 1/time_step;
time_span=total_points.*time_step-time_step;
sampling_rate = 1/(time_step);
Nyquist_frequency = sampling_rate/2;
size_signal_data=size(signal_data);
size_signal_data=size_signal_data(1);
DC_offset=mean(signal_data);
signal_data=signal_data-DC_offset;
time_axis=(0:time_step:time_span);
%% 寻找过零点
b=1;
for a=1:size_signal_data-1
    if (signal_data(a+1)>signal_data(a)) && (signal_data(a+1)>0) && (signal_data(a)<0)
        point1_y=signal_data(a);
        point1_x=a;
        point2_y=signal_data(a+1);
        point2_x=a+1;
        line_gradient=(point2_y-point1_y)/(point2_x-point1_x);
        zero_point=(line_gradient*point1_x-point1_y)/line_gradient;
        zero_crossings(b)=zero_point;
        b=b+1;
    end
 end
ti=zero_crossings*time_step;
size_ti=size(ti);
size_ti=size_ti(2);
d=1;
for c=1:size_ti-1
    dti(d)=ti(c+1)-ti(c);
    d=d+1;
end
%
f=1;
for e=1:size_ti-1
    ti_star(f)=((ti(e+1)-ti(e))./2)+ti(e);
    f=f+1;
end
size_ti_star=size(ti_star);
size_ti_star=size_ti_star(2);
h=1;
for g=1:size_ti_star-1
    dti_star(h)=ti_star(g+1)-ti_star(g);
    h=h+1;
end
dfi_star=1./dti_star;
vti_star=(optical_wavelength./2).*dfi_star;
DC_offset_vti_star=mean(vti_star);
vti_star=vti_star-DC_offset_vti_star;
t=0:1/Bragg_cell:1/Bragg_cell*length(vti_star)-1/Bragg_cell;t=t*1e6;

figure(3);plot(t,vti_star)
title('Velocity signal')
xlabel('Time (s)')
ylabel('Velocity (m/s)')
%% 滤波
filter_bandwidth=0.0;    %初始滤波带宽设置为0
filter_order = 4;
upper_cutoff=acoustic_frequency+(acoustic_frequency*filter_bandwidth);
lower_cutoff=acoustic_frequency-(acoustic_frequency*filter_bandwidth);
size_vti_star=size(vti_star);
size_vti_star=size_vti_star(2);
Nyquist_frequency_filter=(size_vti_star./time_span)/2;
[k,l] = butter(filter_order,lower_cutoff/Nyquist_frequency_filter,'high');
filt_vti_star_h = filter(k,l,vti_star);
[k,l] = butter(filter_order,upper_cutoff/Nyquist_frequency_filter,'low');
filt_vti_star = filter(k,l,filt_vti_star_h);
filt_vti_star = filt_vti_star-mean(filt_vti_star);
filt_vti_star = 2*filt_vti_star;%仿真弥补幅度损失
figure(6)    %原始信号滤波后作过零点解调结果
plot(t,filt_vti_star*1e3,'linewidth',1.2)
xlabel('Time (μs)')
ylabel('Velocity (mm/s)')
% title('Filtered vti*')
title([num2str(acoustic_frequency/1000),' kHz'])
grid on;
xlim([0 300])
%% 截取有声信号
[x,y] = ginput(2);
i0=max([1,round(x(1)*Bragg_cell/1e6)]);
i1=min([length(filt_vti_star),round(x(2)*Bragg_cell/1e6)]);
select_filt_vti_star=filt_vti_star(i0:i1);
select_ti_star=ti_star(i0:i1);
hold on;
plot(t(i0:i1),select_filt_vti_star*1e3, '--r','linewidth',1.5);
grid on;ylim([-0.5 0.5]);yticks([-0.5:0.1:0.5]);
legend('demodulate signal','selected signal')
figure(7)     %选择的有声信号
plot(select_ti_star*1e6,select_filt_vti_star*1e3,'linewidth',1.5)
xlabel('Time (μs)')
ylabel('Velocity (mm/s)')
title([num2str(acoustic_frequency/1000),' kHz'])
grid on;ylim([-0.5 0.5]);yticks([-0.5:0.1:0.5]);
[y,Xpara] = signalmodel(acoustic_frequency,select_ti_star,select_filt_vti_star*1e3);% 信号模型方法
legend('selected signal','fitting signal')
velocity_mm_sine=sqrt(Xpara(1)^2+Xpara(2)^2);
% clipboard('copy',velocity_mm_sine);

%% 评价指标
if size(select_filt_vti_star)~=size(y)
    y=y'/1000;
end
dtw_step = 10000;

if length(select_filt_vti_star)>dtw_step
    n = fix(length(select_filt_vti_star)/dtw_step);
    for i=1:n
        edtw(i) = dtw(select_filt_vti_star((i-1)*dtw_step+1:i*dtw_step),y((i-1)*dtw_step+1:i*dtw_step));
    end
    edtw(end+1) = dtw(select_filt_vti_star((n-1)*dtw_step+1:end),y((n-1)*dtw_step+1:end));
    edtw=sum(edtw);
else
    edtw = dtw(select_filt_vti_star,y);
end
ED= norm(select_filt_vti_star - y);     %Euclidean Distance
NDtw = log10(edtw/length(y)/velocity_mm_sine*1000*1000);
Ssimval = ssim(select_filt_vti_star,y);
Peaksnr = psnr(select_filt_vti_star,y);
MSE = immse(select_filt_vti_star,y);
[r,lags]=xcorr(select_filt_vti_star,y, 'coeff');  %互相关系数
xcor=max(r);
d2 = mahal(select_filt_vti_star',y');  %Mahalanobis Distance  马氏距离
d2=max(d2);
rho = corr(y',select_filt_vti_star','Type','Pearson');%Pearson correlation coefficient  皮尔逊相关系数在夹角为0的情况下等于余弦相似度
% cos_sim = dot(select_filt_vti_star, y) / (norm(select_filt_vti_star) * norm(y));  % 计算余弦相似度
tanimoto_coeff = dot(select_filt_vti_star, y) / (norm(select_filt_vti_star)^2 + norm(y)^2 - dot(select_filt_vti_star, y));% 计算 Tanimoto 系数