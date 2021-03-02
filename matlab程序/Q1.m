clc;clear;
t=122/365;
load("T.mat");
load("AT.mat");
load("BT.mat");
load("AWC.mat");
load("BWC.mat");
load("WC.mat");

T=21:1:35;
M=10:5:75;
% M=10:75;
% Kw=10 ;Nw = 0.1 ; B=1.351;theta=0.55;
% KT=exp(B*(1/20-23./T));
% Ktheta=Kw*theta^Nw/(1+Kw*theta^Nw);
% KPH=1/(1+(6-5.5)^2);
% K=KT*Ktheta*KPH;
% y=exp(-1.5*K*t);
% ydata1 = y + 0.015*randn(size(T));%size函数求矩阵大小
% plot(T,ydata1,'ko',T,y,'r-','linewidth',2);
% hold on
% % legend('A_Data','A_Fitted curve');
% 
% Kw=20 ;Nw = 0.001 ; B=1.351;theta=0.55;
% KT=exp(B*(1/20-23./T));
% Ktheta=Kw*theta^Nw/(1+Kw*theta^Nw);
% KPH=1/(1+(6-5.5)^2);
% K=KT*Ktheta*KPH;
% y=exp(-2.5*K*t);
% ydata2 = y + 0.015*randn(size(T));%size函数求矩阵大小
% plot(T,ydata2,'kp',T,y,'b-','linewidth',2);
% hold off
% xlabel('Temperature(°C)','FontSize',12,'FontWeight','bold');
% ylabel('remaining rate','FontSize',12,'FontWeight','bold');
% % title('relative relationship(A/B)','FontSize',12,'FontWeight','bold');
% set(gca,'linewidth',1);
% legend('Red Belt Fungus','Red Belt Fungus','Pouch Fungus','Pouch Fungus');
% % legend('A Data','A Fitted curve','B Data','B Fitted curve');

T=28.5;
theta=0.01*M;
 Kw=100 ;Nw = 2 ; B=1.351;
KT=exp(B*(1/20-1./T));
Ktheta=Kw*theta.^Nw./(1+Kw*theta.^Nw);
KPH=1/(1+(6-5.5)^2);
K=KT*Ktheta*KPH;
y=exp(-K*t);
ydata1 = y + 0.005*randn(size(M));%size函数求矩阵大小
plot(M,ydata1,'ko',M,y,'r-','linewidth',2);
% plot(M,y,'b-','linewidth',2);
hold on
% legend('A_Data','A_Fitted curve');

Kw=500 ;Nw =2 ; B=1.351;
KT=exp(B*(1/20-1./T));
Ktheta=Kw*theta.^Nw./(1+Kw*theta.^Nw);
KPH=1/(1+(6-5.5)^2);
K=KT*Ktheta*KPH;
y=exp(-K*t);
ydata2 = y + 0.005*randn(size(M));%size函数求矩阵大小
plot(M,ydata2,'kp',M,y,'b-','linewidth',2);
% plot(M,y,'b-','linewidth',2);
hold off
xlabel('Mositure(%)','FontSize',12,'FontWeight','bold');
ylabel('remaining rate','FontSize',12,'FontWeight','bold');
% title('relative relationship(A/B)','FontSize',12,'FontWeight','bold');
set(gca,'linewidth',1);
legend('Red Belt Fungus','Red Belt Fungus','Pouch Fungus','Pouch Fungus');