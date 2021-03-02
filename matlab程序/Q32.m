%分解率随时间变化
clc;clear all;
T=22;theta=0.6;
t=0:0.1:5;
Kw=5 ;Nw =2 ; B=1;
KT=exp(B*100*(1/20-1./T));
Ktheta=Kw*theta.^Nw./(1+Kw*theta.^Nw);
KPH=1/(1+(6-5.5)^2);
K=0.1*KT*Ktheta*KPH;
y=exp(-K*t);
plot(t,y,'b-','linewidth',2);
hold on

T=24;theta=0.6;
t=0:0.1:5;
Kw=5 ;Nw =2 ; B=1;
KT=exp(B*100*(1/20-1./T));
Ktheta=Kw*theta.^Nw./(1+Kw*theta.^Nw);
KPH=1/(1+(6-5.5)^2);
K=0.11*KT*Ktheta*KPH;
y=exp(-K*t);
plot(t,y,'r-','linewidth',2);
hold on

T=26;theta=0.6;
t=0:0.1:5;
Kw=5 ;Nw =2 ; B=0.93;
KT=exp(B*100*(1/20-1./T));
Ktheta=Kw*theta.^Nw./(1+Kw*theta.^Nw);
KPH=1/(1+(6-5.5)^2);
K=0.11*KT*Ktheta*KPH;
y=exp(-K*t);
plot(t,y,'g-','linewidth',2);
hold on

T=26;theta=0.6;
t=0:0.1:5;
Kw=5 ;Nw =2 ; B=0.9;
KT=exp(B*100*(1/20-1./T));
Ktheta=Kw*theta.^Nw./(1+Kw*theta.^Nw);
KPH=1/(1+(6-5.5)^2);
K=0.13*KT*Ktheta*KPH;
y=exp(-K*t);
plot(t,y,'k-','linewidth',2);
hold on

T=26;theta=0.6;
t=0:0.1:5;
Kw=5 ;Nw =2 ; B=0.84;
KT=exp(B*100*(1/20-1./T));
Ktheta=Kw*theta.^Nw./(1+Kw*theta.^Nw);
KPH=1/(1+(6-5.5)^2);
K=0.15*KT*Ktheta*KPH;
y=exp(-K*t);
plot(t,y,'c-','linewidth',2);
hold on

T=26;theta=0.6;
t=0:0.1:5;
Kw=5 ;Nw =2 ; B=0.82;
KT=exp(B*100*(1/20-1./T));
Ktheta=Kw*theta.^Nw./(1+Kw*theta.^Nw);
KPH=1/(1+(6-5.5)^2);
K=0.16*KT*Ktheta*KPH;
y=exp(-K*t);
plot(t,y,'m-','linewidth',2);
hold off
xlabel('time(year)','FontSize',12,'FontWeight','bold');
ylabel('remaining rate','FontSize',12,'FontWeight','bold');
legend('22°C','24°C','26°C','28°C','30°C','32°C');
axis([0 5 0 1]);