clc;clear;
% x=0:0.1:10;
% % y=gaussmf(x,[4 0]);
% % y=1./(0.3.*x.^2+1);
% % y=exp(1./x);
% y=1./((x-5).^2+1);
% plot(x,y);
load("WC.mat");
load("T.mat");
load("AWC.mat");
load("BWC.mat");
load("AT.mat");
load("BT.mat");

% AWC=100-AWC;BWC=100-BWC;
% AT=100-AT;BT=100-BT;

t=122/365;
k=-log(0.01*AT)./t;
% T=Temperature;

%非线性曲线 拟合
rng default % for reproducibility
xdata =T;
ydata = k;%size函数求矩阵大小
lb = [0.1,0.1,0.1];
ub = [10 10 10];
theta=0.55;
fun = @(x,xdata)(x(1)*theta^x(2)*exp(x(3)*(0.05-23./xdata)))/((1+x(1)*theta^x(2))*(1+(6-5.5)^2));
x0 = [2 2 2];
x = lsqcurvefit(fun,x0,xdata,ydata,lb,ub)
plot(xdata,ydata,'ko',xdata,fun(x,xdata),'b-')
legend('Data','Fitted exponential')
title('Data and Fitted Curve')
