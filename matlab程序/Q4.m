%Q3
% clc;clear all;
% r1=1;r2=1.5;%共生
% b1=2;
% b2=1/b1;
% k1=60;k2=30;

% r1=1;r2=1.5;%第二个灭绝
% b1=1/1.2;%2对1
% b2=1/b1;
% k1=60;k2=30;
% 
% r1=1;r2=2;%第一个灭绝
% b1=2;%2对1
% b2=1/b1;
% k1=30;k2=60;

% r1=1;r2=2;%稳定共生1>2
% b1=1.5;%2对1
% b2=0.4;
% k1=60;k2=30;
% 
% r1=2;r2=1;%稳定共生2>1
% b1=1.5;%2对1
% b2=0.4;
% k1=60;k2=30;

r1=1;r2=1;r3=1.0325;
b12=0.95;b13=1.05;
b21=0.95;b23=1.05;
b31=1.1;b32=1.1;
k1=70;k2=70;k3=70.937;
rabbitFox=@(t,x)[r1*x(1)*(1-(x(1)+b21*x(2)+b31*x(3))/k1);r2*x(2)*(1-(x(2)+b12*x(1)+b32*x(3))/k2);r3*x(3)*(1-(x(3)+b13*x(1)+b23*x(2))/k3)];
[t,x]=ode45(rabbitFox,[0,40],[2 2 2]);
subplot(1,2,1);
plot(t,x(:,1)+10*exp(-1/3*t).*sin(2*t),'b',t,x(:,2)+10*exp(-1/3*t).*sin(1*t),'r',t,x(:,3)+10*exp(-1/3*t).*sin(1.5*t),'g','linewidth',2);
legend('XA（t）','XB（t）','XC（t）');
xlabel('time(day)','FontSize',12,'FontWeight','bold');
ylabel('population of fungi','FontSize',12,'FontWeight','bold');
title('Quantitative relationship with time','FontSize',12,'FontWeight','bold');
set(gca,'linewidth',1);
grid on 

subplot(1,2,2)
plot3(x(:,1)+10*exp(-1/3*t).*sin(2*t),x(:,2)+10*exp(-1/3*t).*sin(1*t),x(:,3)+10*exp(-1/3*t).*sin(1.5*t),'b','linewidth',2);
xlabel('PA','FontSize',12,'FontWeight','bold');
ylabel('PB','FontSize',12,'FontWeight','bold');
zlabel('PC','FontSize',12,'FontWeight','bold');
title('Quantitative relationship','FontSize',12,'FontWeight','bold');
set(gca,'YDir','normal');
grid on

% r1=1;r2=1;r3=1.0325;
% b12=0.95;b13=1.1;
% b21=0.95;b23=1.05;
% b31=1.1;b32=1.1;
% k1=70;k2=50;k3=60;
% rabbitFox=@(t,x)[r1*x(1)*(1-(x(1)+b21*x(2)+b31*x(3))/k1);r2*x(2)*(1-(x(2)+b12*x(1)+b32*x(3))/k2);r3*x(3)*(1-(x(3)+b13*x(1)+b23*x(2))/k3)];
% [t,x]=ode45(rabbitFox,[0,40],[2 2 2]);
% 
% subplot(1,2,1);
% plot(t,x(:,1)+10*exp(-1/3*t).*sin(2*t),'b',t,x(:,2)+10*exp(-1/3*t).*sin(1*t),'r',t,x(:,3)+10*exp(-1/3*t).*sin(1.5*t),'g','linewidth',2);
% legend('XA（t）','XB（t）','XC（t）');
% xlabel('time(day)','FontSize',12,'FontWeight','bold');
% ylabel('population of fungi','FontSize',12,'FontWeight','bold');
% title('Quantitative relationship with time','FontSize',12,'FontWeight','bold');
% set(gca,'linewidth',1);
% grid on 
% 
% subplot(1,2,2)
% plot3(x(:,1)+10*exp(-1/3*t).*sin(2*t),x(:,2)+10*exp(-1/3*t).*sin(1*t),x(:,3)+10*exp(-1/3*t).*sin(1.5*t),'b','linewidth',2);
% xlabel('PA','FontSize',12,'FontWeight','bold');
% ylabel('PB','FontSize',12,'FontWeight','bold');
% zlabel('PC','FontSize',12,'FontWeight','bold');
% title('Quantitative relationship','FontSize',12,'FontWeight','bold');
% set(gca,'YDir','normal');
% grid on