%Q3
% clc;clear all;
% r1=1;r2=1.5;%����
% b1=2;
% b2=1/b1;
% k1=60;k2=30;

r1=1;r2=1.5;%�ڶ������
b1=1/1.2;%2��1
b2=1/b1;
k1=60;k2=30;
% 
% r1=1;r2=2;%��һ�����
% b1=2;%2��1
% b2=1/b1;
% k1=30;k2=60;

% r1=1;r2=2;%�ȶ�����1>2
% b1=1.5;%2��1
% b2=0.4;
% k1=60;k2=30;
% 
% r1=2;r2=1;%�ȶ�����2>1
% b1=1.5;%2��1
% b2=0.4;
% k1=60;k2=30;

rabbitFox=@(t,x)[r1*x(1)*(1-(x(1)+b1*x(2))/k1);r2*x(2)*(1-(x(2)+b2*x(1))/k2)];
[t,x]=ode45(rabbitFox,[0,40],[2 2]);

subplot(1,3,1);
% plot(t,x(:,1)+10*exp(-1/3*t).*sin(1.5*t),'b',t,x(:,2)+10*exp(-1/3*t).*sin(t),'r','linewidth',2);
plot(t,x(:,1)+10*exp(-1/3*t).*sin(1.5*t),'b',t,x(:,2)+10*exp(-1/3*t).*sin(t),'r','linewidth',2);
legend('XA��t��','XB��t��');
xlabel('time(day)','FontSize',12,'FontWeight','bold');
ylabel('population of fungi','FontSize',12,'FontWeight','bold');
title('The quantitative relationship with time','FontSize',12,'FontWeight','bold');
set(gca,'linewidth',1);
grid on 

subplot(1,3,2);
plot(x(:,1)+10*exp(-1/3*t).*sin(1.5*t),x(:,2)+10*exp(-1/3*t).*sin(t),'b','linewidth',2)
xlabel('PopulationA','FontSize',12,'FontWeight','bold');
ylabel('PopulationB','FontSize',12,'FontWeight','bold');
title('The quantitative relationship','FontSize',12,'FontWeight','bold');
set(gca,'linewidth',1);
grid on

subplot(1,3,3);
plot(t,(x(:,1)+10*exp(-1/3*t).*sin(1.5*t))./(x(:,2)+10*exp(-1/3*t).*sin(t)),'r','linewidth',2);
% plot(t,(x(:,2)+10*exp(-1/3*t).*sin(t))./(x(:,1)+10*exp(-1/3*t).*sin(1.5*t)),'r','linewidth',2);
xlabel('time(day)','FontSize',12,'FontWeight','bold');
ylabel('relative relationship','FontSize',12,'FontWeight','bold');
title('relative relationship(A/B)','FontSize',12,'FontWeight','bold');
set(gca,'linewidth',1);
grid on 