%-------------------------
%  Author: Xia, Huanxiong (hxia@bit.edu.cn)
%-------------------------
clear;clc;close all;
m=3; n=3;
%% hair
ahair_1 = [0.163134,2.86943,0.851007];
ahair_2 = [0.163134,2.86943,0.851007];
ahair_3 = [0.163134,2.86943,0.851007];
ahair_4 = [0.163134,2.86943,0.851007];
ahair_5 = [-0.132369,3.10981,0.876723];
ahair_6 = [-0.00630125,3.11526,0.927799];
ahair_7 = [0.209835,3.11345,0.927485];
ahair_8 = [0.294057,3.11383,0.894287];
ahair_9 = [-0.421919,3.60741,0.856838];
ahair_10= [-0.226222,3.60625,0.920154];
ahair_11= [0.209325,3.60669,0.915636];
ahair_12= [0.400957,3.60644,0.835345];
ahair_13= [-0.387513,3.81609,0.779347];
ahair_14= [-0.195505,3.81532,0.803485];
ahair_15= [0.188419,3.81528,0.802642];
ahair_16= [0.387513,3.81609,0.779347];

bhair_1 = [-0.387513,3.81609,0.779347];
bhair_2 = [-0.185911,3.8153,0.804076];
bhair_3 = [0.192591,3.81529,0.802248];
bhair_4 = [0.387513,3.81609,0.779347];
bhair_5 = [-0.330671,4.02532,0.637661];
bhair_6 = [-0.17858,4.02547,0.709973];
bhair_7 = [0.175635,4.02548,0.710924];
bhair_8 = [0.332628,4.02534,0.637642];
bhair_9 = [-0.133881,4.29765,0.254704];
bhair_10= [-0.0712524,4.29767,0.268527];
bhair_11= [0.070588,4.29761,0.268587];
bhair_12= [0.132981,4.29757,0.254834];
bhair_13= [0,4.31274,0.008834];
bhair_14= [0,4.31274,0.008834];
bhair_15= [0,4.31274,0.008834];
bhair_16= [0,4.31274,0.008834];
%% plot
figure(1)
%plot3(reshape(px,[numel(px),1]),reshape(py,[numel(py),1]),reshape(pz,[numel(pz),1]),'rs','markerfacecolor','r');
%hold on;mesh(px,py,pz,'edgecolor','k','facealpha',0);
[px1,py1,pz1]=conver_to(ahair_1,ahair_2,ahair_3,ahair_4,ahair_5,ahair_6,ahair_7,ahair_8,ahair_9,ahair_10,ahair_11,ahair_12,ahair_13,ahair_14,ahair_15,ahair_16);
[px2,py2,pz2]=conver_to(bhair_1,bhair_2,bhair_3,bhair_4,bhair_5,bhair_6,bhair_7,bhair_8,bhair_9,bhair_10,bhair_11,bhair_12,bhair_13,bhair_14,bhair_15,bhair_16);
[Sx1,Sy1,Sz1]=PSBezierMxN(px1,py1,pz1,m,n);
[Sx2,Sy2,Sz2]=PSBezierMxN(px2,py2,pz2,m,n);
surf(Sx1,Sy1,Sz1,'linestyle','-');colormap(jet);
surf(Sx2,Sy2,Sz2,'linestyle','-');colormap(jet);

function [Sx,Sy,Sz,Rm,Rn]=PSBezierMxN(px,py,pz,m,n)
    Rm=20; Rn=20;
    u=linspace(0,1,Rm)';
    w=linspace(0,1,Rn)';
    Bu=zeros([Rm,m+1]);
    Bw=zeros([Rn,n+1]);
    for i=0:m
        Bu(:,i+1)=prod(i+1:m)/prod(1:m-i)*u.^i.*(1-u).^(m-i);
    end
    for i=0:n
        Bw(:,i+1)=prod(i+1:n)/prod(1:n-i)*w.^i.*(1-w).^(n-i);
    end
    Sx=Bu*px*Bw';
    Sy=Bu*py*Bw';
    Sz=Bu*pz*Bw';
end

function [px,py,pz] = conver_to(S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16)
py = [S1(1) S2(1) S3(1) S4(1);S5(1) S6(1) S7(1) S8(1); S9(1) S10(1) S11(1) S12(1);S13(1) S14(1) S15(1) S16(1)];
pz = [S1(2) S2(2) S3(2) S4(2);S5(2) S6(2) S7(2) S8(2); S9(2) S10(2) S11(2) S12(2);S13(2) S14(2) S15(2) S16(2)];
px = [S1(3) S2(3) S3(3) S4(3);S5(3) S6(3) S7(3) S8(3); S9(3) S10(3) S11(3) S12(3);S13(3) S14(3) S15(3) S16(3)];
end
