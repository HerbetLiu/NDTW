function [y,Xpara] = signalmodel(varargin)
%使用最小二乘方法拟合得到信号模型，包括两种方法，稳态拟合、叠加信号拟合
%稳态拟合
%f = acoustic_frequency       信号频率varargin{1}
%t = select_time_data+time_delay 时间 = 采样时间+时延varargin{2}
%b = Amplitude                信号幅值varargin{3}
%输出y拟合信号；Xpara，拟合信号参数
narginchk(3,5);
if nargin==3
t = varargin{2};
f = varargin{1};
b = varargin{3};
if size(t,2)~=1
    t = t';
end
if size(b,2)~=1
    b = b';
end
A1 = sin(2*pi*f*t);
A2 = cos(2*pi*f*t);
A3 = ones(length(t),1);
A = [A1 A2 A3];
Xpara = inv(A'*A)*A'*b;   %最小二乘方法拟合
y = A*Xpara;

hold on;
plot(t/(t(2)-t(1))/40,y,'--r','linewidth',1.5)

else if nargin==4
% 叠加拟合    正向过零点
%f = acoustic_frequency       信号频率varargin{1}
%t = select_time_data+time_delay 时间 = 采样时间+时延varargin{2}+varargin{4}
%b = Amplitude                信号幅值varargin{3}
%输出y拟合信号；Xpara，拟合信号参数
t = varargin{2};
t = t-t(1)+varargin{4};
time_step = t(2)-t(1);
f = varargin{1};
b = varargin{3};
if size(b,2)~=1
    b = b';
end
%% 寻找过零点
d=1;
for a=1:length(b)-1 
    if (b(a+1)>b(a)) && (b(a+1)>0) && (b(a)<0)
        point1_y=b(a);
        point1_x=a;
        point2_y=b(a+1);
        point2_x=a+1;
        line_gradient=(point2_y-point1_y)/(point2_x-point1_x);
        zero_point=(line_gradient*point1_x-point1_y)/line_gradient;
        zero_crossings(d)=zero_point;
        d=d+1;
    end
end
ti=zero_crossings*time_step+varargin{4};
size_ti=length(ti);
for i=1:size_ti
    T(i,:) = sign(t-ti(i));
end
T(T==0) = 1;
T(T<0) = 0;

d=1;
for i=1:size_ti
A(d,:) = sin(2*pi*f*(t-ti(i)));
A(d+1,:) = cos(2*pi*f*(t-ti(i)));
A(d+2,:) = ones(length(t),1);
d=d+3;
end
d=1;
for i=1:size_ti
A(d,:) = A(d,:).*T(i,:);
A(d+1,:) = A(d+1,:).*T(i,:);
A(d+2,:) = A(d+2,:).*T(i,:);
d=d+3;
end
Xpara = inv(A*A')*A*b;   %最小二乘方法拟合
y = A'*Xpara;

hold on;
plot(t+varargin{2}(1)-varargin{4},y,'--r','linewidth',1.5)

else 
% 叠加拟合  反向过零点
%f = acoustic_frequency       信号频率varargin{1}
%t = select_time_data+time_delay 时间 = 采样时间+时延varargin{2}+varargin{4}
%b = Amplitude                信号幅值varargin{3}
%输出y拟合信号；Xpara，拟合信号参数
t = varargin{2};
t = t-t(1)+varargin{4};
time_step = t(2)-t(1);
f = varargin{1};
b = varargin{3};
if size(b,2)~=1
    b = b';
end
%% 寻找过零点
d=1;
for a=1:length(b)-1 
    if (b(a+1)<b(a)) && (b(a+1)<0) && (b(a)>0)
        point1_y=b(a);
        point1_x=a;
        point2_y=b(a+1);
        point2_x=a+1;
        line_gradient=(point2_y-point1_y)/(point2_x-point1_x);
        zero_point=(line_gradient*point1_x-point1_y)/line_gradient;
        zero_crossings(d)=zero_point;
        d=d+1;
    end
end
ti=zero_crossings*time_step+varargin{4};
size_ti=length(ti);
for i=1:size_ti
    T(i,:) = sign(t-ti(i));
end
T(T==0) = 1;
T(T<0) = 0;

d=1;
for i=1:size_ti
A(d,:) = sin(2*pi*f*(t-ti(i)));
A(d+1,:) = cos(2*pi*f*(t-ti(i)));
A(d+2,:) = ones(length(t),1);
d=d+3;
end
d=1;
for i=1:size_ti
A(d,:) = A(d,:).*T(i,:);
A(d+1,:) = A(d+1,:).*T(i,:);
A(d+2,:) = A(d+2,:).*T(i,:);
d=d+3;
end
Xpara = inv(A*A')*A*b;   %最小二乘方法拟合
y = A'*Xpara;

hold on;
plot(t+varargin{2}(1)-varargin{4},y,'--r','linewidth',1.5)
end
end