%Question2
clc;clear;
Length=100;
length=9;
L1=9;L2=9;%fungi width
Y=25;%ãÐÖµ
global Board
Board=zeros(Length);
% FgC1=rand(1,2)*97+2;
% FgC2=rand(1,2)*97+2;
x1=floor(rand*97+2);
y1=floor(rand*97+2);
x2=floor(rand*97+2);
y2=floor(rand*97+2);
x3=floor(rand*97+2);
y3=floor(rand*97+2);
x4=floor(rand*97+2);
y4=floor(rand*97+2);
L=(length-1)/2;
X11=[x1,y1];
X12=[x2,y2];
X21=[x3 y3];
X22=[x4 y4];
for i=x1-L:x1+L
    for j=y1-L:y1+L
        Board(i,j)=1;
    end
end
for i=x2-L:x2+L
    for j=y2-L:y2+L
        Board(i,j)=1;
    end
end
for i=x3-L:x3+L
    for j=y3-L:y3+L
        Board(i,j)=2;
    end
end
for i=x4-L:x4+L
    for j=y4-L:y4+L
        Board(i,j)=2;
    end
end


for t=1:100
    grow(x1,y1,2,1);
    grow(x2,y2,2,1);
    grow(x3,y3,2,2);
    grow(x4,y4,2,2);
end

for i=1:100
    for j=1:100
        if Board(i,j)~=1 && Board(i,j)~=2
            Board(i,j)=nan;
        end
    end
end
Board=Board';
M1=imagesc(Board);
set(M1,'alphadata',~isnan(Board));
set(gca,'YDir','normal');
% load mymap;
colormap;
colorbar;

function grow(x,y,v,status)
v=floor(v);
i=x;j=y;k=0;
global Board
dir=floor(rand*8+1);
% dir
if dir==1
    while(Board(i,j)==status)
        j=j+1;
        if i<1||i>100||j<1||j>100
            break;
        end
    end
    for k=j:1:j+v
        if i>=1&&i<=100&&k>=1&&k<=100
            Board(i,k)=status;
        end
    end
elseif dir==2
    while(Board(i,j)==status)
        j=j-1;
        if i<1||i>100||j<1||j>100
            break;
        end
    end
    for k=j:-1:j-v
        if i>=1&&i<=100&&k>=1&&k<=100
%             k
            Board(i,k)=status;
        end
    end
elseif dir==3
    while(Board(i,j)==status)
        i=i-1;
        if i<1||i>100||j<1||j>100
            break;
        end
    end
    for k=i:-1:i-v
        if i>=1&&i<=100&&k>=1&&k<=100
            Board(k,j)=status;
        end
    end
elseif dir==4
    while(Board(i,j)==status)
        i=i+1;
        if i<1||i>100||j<1||j>100
            break;
        end
    end
    for k=i:i+v
        if i>=1&&i<=100&&k>=1&&k<=100
            Board(k,j)=status;
        end
    end
elseif dir==5
    while(Board(i,j)==status)
        i=i-1;
        j=j+1;
        if i<1||i>100||j<1||j>100
            break;
        end
    end
    for k=i:-1:i-v
        if k>=1&&k<=100&&j>=1&&j<=100
            Board(k,j)=status;
            j=j+1;
        end
    end
elseif dir==6
    while(Board(i,j)==status)
        i=i+1;
        j=j+1;
        if i<1||i>100||j<1||j>100
            break;
        end
    end
    for k=i:i+v
        if k>=1&&k<=100&&j>=1&&j<=100
            Board(k,j)=status;
            j=j+1;
        end
    end
elseif dir==7
    while(Board(i,j)==status)
        i=i-1;
        j=j-1;
        if i<1||i>100||j<1||j>100
            break;
        end
    end
    for k=i:-1:i-v
        if k>=1&&k<=100&&j>=1&&j<=100
            Board(k,j)=status;
            j=j-1;
        end
    end
elseif dir==8
    while(Board(i,j)==status)
        i=i+1;
        j=j-1;
        if i<1||i>100||j<1||j>100
            break;
        end
    end
    for k=i:i+v
        if k>=1&&k<=100&&j>=1&&j<=100
            Board(k,j)=status;
            j=j-1;
        end
    end
end
end
