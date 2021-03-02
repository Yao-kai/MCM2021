clc;clear all;
% R=1000:1600;
% k=187;b=969;
% T=R-b/k;
% % T=20:1:35;
% Kw=100 ;Nw = 2 ; B=0.7;theta=0.55;
% t=122/365;
% KT=exp(B*70*(1/20-1./T));
% Ktheta=Kw*theta^Nw/(1+Kw*theta^Nw);
% KPH=1/(1+(6-5.5)^2);
% K=0.6*KT*Ktheta*KPH;
% y=9*exp(-1.5*K*t)+0.2;
% plot(R,y,'r-','linewidth',2);
% axis([1000 1600 0.85 0.9]);

clc
clear all
% a=[0.8888 1000;
%    0.8802 1100;
%     0.8744 1200;
%     0.8609 1300;
%     0.8641 1400;
%     0.8601 1500]
x=1000:100:1500;
y=[0.8888 0.8802 0.8744 0.8690 0.8641 0.8601];
% m = 5; n = 3;
% for i = 1:m
%     for j = 1:n
%         a(i,j) = rand(1) + (j-1)*0.7;
%     end
% end
% a=a';
b = bar3(x,y,'grouped');
zlim([0.85 0.9]);
ylabel('Richness','FontSize',12,'FontWeight','bold');
zlabel('remaining rate','FontSize',12,'FontWeight','bold');
% b(1).FaceColor = [0.1 0.5 0.9];
% b(2).FaceColor = [0.9 0.1 0.5];
% b(3).FaceColor = [0.5 0.9 0.1];
