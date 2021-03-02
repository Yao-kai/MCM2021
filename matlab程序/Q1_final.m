%分解率随时间变化
clc;clear all;
%少的
T=26;theta=0.6;
t=0:0.1:5;
Kw=5 ;Nw =2 ; B=0.84;
KT=exp(B*100*(1/20-1./T));
Ktheta=Kw*theta.^Nw./(1+Kw*theta.^Nw);
KPH=1/(1+(6-5.5)^2);
K=0.15*KT*Ktheta*KPH;
y1=exp(-K*t);
plot(t,y1,'b-','linewidth',2);
hold on

%多的,红
T=26;theta=0.6;
t=0:0.1:5;
Kw=5 ;Nw =2 ; B=0.82;
KT=exp(B*100*(1/20-1./T));
Ktheta=Kw*theta.^Nw./(1+Kw*theta.^Nw);
KPH=1/(1+(6-5.5)^2);
K=0.22*KT*Ktheta*KPH;
y2=exp(-K*t);
plot(t,y2,'r-','linewidth',2);
hold on

y=0.29*y1+0.71*y2;
plot(t,y,'k-.','linewidth',2);
xlabel('time(year)','FontSize',12,'FontWeight','bold');
ylabel('remaining rate','FontSize',12,'FontWeight','bold');
legend('Red Belt Only','Pouch Fungus Only','Cosidering Interaction');
axis([0 5 0 1]);