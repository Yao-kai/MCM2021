%Question2
% ax = gca;
% mycmap2 = colormap(ax);
% save('MyColormaps2','mycmap2')
clc;clear;
Length=100;
length=7;
mycolormaponly=[1 0 0];
% load("Mymap.mat");
% L1=5;L2=5;%fungi width
% Y=20;%阈值
global Board
Board=zeros(Length);
% FgC1=rand(1,2)*97+2;
% FgC2=rand(1,2)*97+2;
x1=floor(rand*97+2);y1=floor(rand*97+2);
x2=floor(rand*97+2);y2=floor(rand*97+2);
L=(length-1)/2;
global X;
% X=[x1,y1,1;
%     x2,y2,1;
%     x3 y3,2;
%     x4 y4,2];
X=[53,2,1;
    35,84,1]
%     4,88,2;
%     88,10,2];
global index;
index=2;%记录几个节点
global count;
count=zeros(2,8);%记录各方向长度

init(X(1,1),X(1,2),L,1);
init(X(2,1),X(2,2),L,1);

for t=1:1000
    for i=1:index
        grow(X(i,1),X(i,2),2,X(i,3),i);
    end
    if t==50
        Board1=Board;
    elseif t==700
        Board2=Board;
    end
end

for i=1:100
    for j=1:100
        if Board1(i,j)~=1 && Board1(i,j)~=2 && Board1(i,j)>=0
            Board1(i,j)=nan;
        end
        if Board2(i,j)~=1 && Board2(i,j)~=2 && Board2(i,j)>=0
            Board2(i,j)=nan;
        end
        if Board(i,j)~=1 && Board(i,j)~=2 && Board(i,j)>=0
            Board(i,j)=nan;
        end
    end
end

countB=zeros(1,3);countR=zeros(1,3);
for i=1:100
    for j=1:100
        if Board1(i,j)==1
            countB(1)=countB(1)+1;
        elseif Board2(i,j)==2
            countR(1)=countR(1)+1;
        end
        if Board2(i,j)==1
            countB(2)=countB(2)+1;
        elseif Board2(i,j)==2
            countR(2)=countR(2)+1;
        end
        if Board(i,j)==1
            countB(3)=countB(3)+1;
        elseif Board(i,j)==2
            countR(3)=countR(3)+1;
        end
    end
end
ratioB=zeros(1,3);ratioR=zeros(1,3);
for i=1:3
    ratioB(i)=countB(i)/100;
    ratioR(i)=countR(i)/100;
end
ratioB
ratioR

subplot(1,3,1)
Board1=Board1';
M1=imagesc(Board1);
set(M1,'alphadata',~isnan(Board1));
set(gca,'YDir','normal')
ax = gca;
load('MyColormaps1','mycmap1')
% colormap(ax,mycmap1)
colormap(ax,mycolormaponly);
title('Initial period','FontSize',12,'FontWeight','bold');
% colorbar;
impixelinfo %在左下角显示像素坐标和像素值

subplot(1,3,2)
Board2=Board2';
M1=imagesc(Board2);
set(M1,'alphadata',~isnan(Board2));
set(gca,'YDir','normal')
ax = gca;
load('MyColormaps2','mycmap2')
colormap(ax,mycmap2)
title('Development period','FontSize',12,'FontWeight','bold');
% colorbar;
impixelinfo %在左下角显示像素坐标和像素值

subplot(1,3,3)
Board=Board';
M1=imagesc(Board);
set(M1,'alphadata',~isnan(Board));
set(gca,'YDir','normal')
ax = gca;
load('MyColormaps2','mycmap2')
colormap(ax,mycmap2)
title('Mature period','FontSize',12,'FontWeight','bold');
% colorbar;
impixelinfo %在左下角显示像素坐标和像素值

function grow(x,y,v,status,serial)
global Board;
global index;
global count;
global X;
v=floor(v);
p=rand;
Y=20;
M=zeros(1,8);
i=x;j=y;k=0;
compete=0.75;
% if p<0.5
    dir=floor(rand*8+1);
    if dir==1
        if count(serial,1)>=Y
        else
            while(Board(i,j)==status)
                j=j+1;
                if i<1||i>100||j<1||j>100
                    break;
                end
            end
            for k=j:1:j+v
                if i>=1&&i<=100&&k>=1&&k<=100
                    if status>Board(i,k)
                        if p>compete
                        Board(i,k)=status;
                        judge(i,k);
                        count(serial,1)=count(serial,1)+1;
                        if count(serial,1)>=Y
                            X=[X;i k status];
                            init(i,k,2,status);
                            count=[count;M];
                            index=index+1;
                            break;
                        end
                        end
%                     elseif status<Board(i,k)
%                         if p<compete   
                    end
                end
            end
        end
    elseif dir==2
        if count(serial,2)>=Y
        else
            while(Board(i,j)==status)
                j=j-1;
                if i<1||i>100||j<1||j>100
                    break;
                end
            end
            for k=j:-1:j-v
                if i>=1&&i<=100&&k>=1&&k<=100
                    if status>Board(i,k)
                        if p>compete
                        Board(i,k)=status;
                        judge(i,k);
                        count(serial,2)=count(serial,2)+1;
                        if count(serial,2)>=Y
                            X=[X;i k status];
                            count=[count;M];
                            init(i,k,2,status);
                            index=index+1;
                            break;
                        end
                        end
                    end
                end
            end
        end
    elseif dir==3
        if count(serial,3)>=Y
        else
            while(Board(i,j)==status)
                i=i-1;
                if i<1||i>100||j<1||j>100
                    break;
                end
            end
            for k=i:-1:i-v
                if i>=1&&i<=100&&k>=1&&k<=100
                    if status>Board(i,k)
                        if p>compete
                        Board(k,j)=status;
                        judge(k,j);
                        count(serial,3)=count(serial,3)+1;
                        if count(serial,3)>=Y
                            X=[X;i k status];
                            count=[count;M];
                            init(i,k,2,status);
                            index=index+1;
                            break;
                        end
                        end
                    end
                end
            end
        end
    elseif dir==4
        if count(serial,4)>=Y
        else
            while(Board(i,j)==status)
                i=i+1;
                if i<1||i>100||j<1||j>100
                    break;
                end
            end
            for k=i:i+v
                if i>=1&&i<=100&&k>=1&&k<=100
                    if status>Board(i,k)
                        if p>compete
                        Board(k,j)=status;
                        judge(k,j);
                        count(serial,4)=count(serial,4)+1;
                        
                        if count(serial,4)>=Y
                            X=[X;i k status];
                            count=[count;M];
                            init(i,k,2,status);
                            index=index+1;
                            break;
                        end
                        end
                    end
                end
            end
        end
    elseif dir==5
        if count(serial,5)>=Y
        else
            while(Board(i,j)==status)
                i=i-1;
                j=j+1;
                if i<1||i>100||j<1||j>100
                    break;
                end
            end
            for k=i:-1:i-v
                if k>=1&&k<=100&&j>=1&&j<=100
                    if status>Board(i,k)
                        if p>compete
                        Board(k,j)=status;
                        judge(k,j);
                        j=j+1;
                        count(serial,5)=count(serial,5)+1;
                        
                        if count(serial,5)>=Y
                            X=[X;i k status];
                            count=[count;M];
                            init(i,k,2,status);
                            index=index+1;
                            break;
                        end
                    end
                    end
                end
            end
        end
    elseif dir==6
        if count(serial,6)>=Y
        else
            while(Board(i,j)==status)
                i=i+1;
                j=j+1;
                if i<1||i>100||j<1||j>100
                    break;
                end
            end
            for k=i:i+v
                if k>=1&&k<=100&&j>=1&&j<=100
                    if status>Board(i,k)
                        if p>compete
                        Board(k,j)=status;
                        judge(k,j);
                        j=j+1;
                        count(serial,6)=count(serial,6)+1;
                        if count(serial,6)>=Y
                            X=[X;i k status];
                            count=[count;M];
                            init(i,k,2,status);
                            index=index+1;
                            break;
                        end
                        end
                    end
                end
            end
        end
    elseif dir==7
        if count(serial,7)>=Y
        else
            while(Board(i,j)==status)
                i=i-1;
                j=j-1;
                if i<1||i>100||j<1||j>100
                    break;
                end
            end
            for k=i:-1:i-v
                if k>=1&&k<=100&&j>=1&&j<=100
                    if status>Board(i,k)
                        if p>compete
                        Board(k,j)=status;
                        judge(k,j);
                        j=j-1;
                        count(serial,7)=count(serial,7)+1;
                        
                        if count(serial,7)>=Y
                            X=[X;i k status];
                            count=[count;M];
                            init(i,k,2,status);
                            index=index+1;
                            break;
                        end
                        end
                    end
                end
            end
        end
    elseif dir==8
        if count(serial,8)>=Y
        else
            while(Board(i,j)==status)
                i=i+1;
                j=j-1;
                if i<1||i>100||j<1||j>100
                    break;
                end
            end
            for k=i:i+v
                if k>=1&&k<=100&&j>=1&&j<=100
                    if status>Board(i,k)
                        if p>compete
                        Board(k,j)=status;
                        judge(k,j);
                        j=j-1;
                        count(serial,8)=count(serial,8)+1;
                        
                        if count(serial,8)>=Y
                            X=[X;i k status];
                            count=[count;M];
                            index=index+1;
                            init(i,k,2,status);
                            break;
                        end
                        end
                    end
                end
            end
        end
    end
end
% end

function init(x,y,L,status)
global Board;
for i=x-L:x+L
    for j=y-L:y+L
        if i>=1&&i<=100&&j>=1&&j<=100
            Board(i,j)=status;
        end
    end
end
end

function judge(x,y)
global Board;
count=0;
for i=x-1:x+1
    for j=y-1:y+1
        if i>=1&&i<=100&&j>=1&&j<=100&&x>=1&&x<=100&&y>=1&&y<=100
            if Board(i,j)==Board(x,y)
                count=count+1;
            end
        end
        if count>=5
            Board(x,y)=-10;
        end
    end
end
end