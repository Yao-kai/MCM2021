%Q33
clc;clear;
r1=1;r2=1.5;%共生
b1=2;
b2=1/b1;
k1=60;k2=30;

rabbitFox=@(t,x)[r1*x(1)*(1-(x(1)+b1*x(2))/k1);r2*x(2)*(1-(x(2)+b2*x(1))/k2)];
[t,x]=ode45(rabbitFox,[0,40],[2 2]);
subplot(1,2,1)
plot(t,x(:,1)+10*exp(-1/3*t).*sin(1.5*t),'b',t,x(:,2)+10*exp(-1/3*t).*sin(t),'r','linewidth',2);
legend('XA（t）','XB（t）');
xlabel('time(day)','FontSize',12,'FontWeight','bold');
ylabel('population of fungi','FontSize',12,'FontWeight','bold');
title('T=25°C','FontSize',12,'FontWeight','bold');
set(gca,'linewidth',1);

subplot(1,2,2)
k1=k1-30;k2=30-10;
rabbitFox=@(t,x)[r1*x(1)*(1-(x(1)+b1*x(2))/k1);r2*x(2)*(1-(x(2)+b2*x(1))/k2)];
[t,x]=ode45(rabbitFox,[0,40],[2 2]);

plot(t,x(:,1)+10*exp(-1/3*t).*sin(1.5*t),'b',t,x(:,2)+10*exp(-1/3*t).*sin(t),'r','linewidth',2);
legend('XA（t）','XB（t）');
xlabel('time(day)','FontSize',12,'FontWeight','bold');
ylabel('population of fungi','FontSize',12,'FontWeight','bold');
title('T=30°C','FontSize',12,'FontWeight','bold');
set(gca,'linewidth',1);
axis([0 40 0 30]);

% r1=1;r2=1.5;%第二个灭绝
% b1=1/1.2;%2对1
% b2=1/b1;
% k1=60;k2=30;
% 
% rabbitFox=@(t,x)[r1*x(1)*(1-(x(1)+b1*x(2))/k1);r2*x(2)*(1-(x(2)+b2*x(1))/k2)];
% [t,x]=ode45(rabbitFox,[0,40],[2 2]);
% subplot(1,2,1)
% plot(t,x(:,1)+10*exp(-1/3*t).*sin(1.5*t),'b',t,x(:,2)+10*exp(-1/3*t).*sin(0.5*t),'r','linewidth',2);
% legend('XA（t）','XB（t）');
% xlabel('time(day)','FontSize',12,'FontWeight','bold');
% ylabel('population of fungi','FontSize',12,'FontWeight','bold');
% title('T=25°C','FontSize',12,'FontWeight','bold');
% set(gca,'linewidth',1);
% axis([0 40 0 70]);
% 
% subplot(1,2,2)
% k1=k1-22;k2=30-11;
% rabbitFox=@(t,x)[r1*x(1)*(1-(x(1)+b1*x(2))/k1);r2*x(2)*(1-(x(2)+b2*x(1))/k2)];
% [t,x]=ode45(rabbitFox,[0,40],[2 2]);
% 
% plot(t,x(:,1)+10*exp(-1/3*t).*sin(1.5*t),'b',t,x(:,2)+10*exp(-1/3*t).*sin(0.5*t),'r','linewidth',2);
% legend('XA（t）','XB（t）');
% xlabel('time(day)','FontSize',12,'FontWeight','bold');
% ylabel('population of fungi','FontSize',12,'FontWeight','bold');
% title('T=30°C','FontSize',12,'FontWeight','bold');
% set(gca,'linewidth',1);
% axis([0 40 0 70]);
