% We use irfu codes in these scripts, please import irfu codes and run irf.m before run these scripts

% All Juno and Galileo data presented here are publicly available from NASAs Planetary Data System (https://pds-ppi.igpp.ucla.edu/). 
% The Juno-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519711
% The Juno-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1520498 
% The Galileo-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/fq45-wv97
% The Galileo-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519682

clear all

% The data loaded here is managed by scripts like drawF1 and drawF2, 
% the only difference is the data loaded and chosen in these codes and time marked in xlabel changed by different event.
% gpi is PSD data of Galileo eventi, gti is periods data of Galileo eventi
% jpi is PSD data of Juno eventi, jti is periods data of Juno eventi

load('gp1.mat')
load('gp2.mat')
load('gp3.mat')
load('gp4.mat')
load('gp5.mat')
load('gp6.mat')
load('gp7.mat')
load('gp8.mat')
load('gp9.mat')
load('gp10.mat')
load('gp11.mat')

load('gt1.mat')
load('gt2.mat')
load('gt3.mat')
load('gt4.mat')
load('gt5.mat')
load('gt6.mat')
load('gt7.mat')
load('gt8.mat')
load('gt9.mat')
load('gt10.mat')
load('gt11.mat')

load('jp1.mat')
load('jp2.mat')
load('jp3.mat')
load('jp4.mat')
load('jp5.mat')
load('jp6.mat')
load('jp7.mat')
load('jp8.mat')
load('jp9.mat')
load('jp10.mat')

load('jt1.mat')
load('jt2.mat')
load('jt3.mat')
load('jt4.mat')
load('jt5.mat')
load('jt6.mat')
load('jt7.mat')
load('jt8.mat')
load('jt9.mat')
load('jt10.mat')

figure;
set(gcf,'position',[100 50 1000 600])

a1=find(jt1<6);
c1=[];x1=[];y1=[];
c1(1,1:length(a1))=jp1(a1(1):end);
c1(1,length(a1)+1)=0;
c1(2,1:length(a1)+1)=0;
x1(1,1:length(a1))=jt1(a1(1):end);
x1(1,length(a1)+1)=0;
x1(2,:)=x1(1,:);
y1(1,1:length(a1)+1)=1;
y1(2,1:length(a1)+1)=2;
subplot(23,1,1);
pcolor(x1,y1,c1);
set(gca,'position',[0.2 1-1*0.015-0.05 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t1','rotation',0,'position',[0.93 1],'FontSize',8);
title('Analysis To The Juno Data','FontSize',12)

a2=find(jt2<6);
c2=[];x2=[];y2=[];
c2(1,1:length(a2))=jp2(a2(1):end);
c2(1,length(a2)+1)=0;
c2(2,1:length(a2)+1)=0;
x2(1,1:length(a2))=jt2(a2(1):end);
x2(1,length(a2)+1)=0;
x2(2,:)=x2(1,:);
y2(1,1:length(a2)+1)=1;
y2(2,1:length(a2)+1)=2;
subplot(23,1,2);
pcolor(x2,y2,c2);
set(gca,'position',[0.2 1-2*0.015-0.05 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t2','rotation',0,'position',[0.93 1],'FontSize',8);

a3=find(jt3<6);
c3=[];x3=[];y3=[];
c3(1,1:length(a3))=jp3(a3(1):end);
c3(1,length(a3)+1)=0;
c3(2,1:length(a3)+1)=0;
x3(1,1:length(a3))=jt3(a3(1):end);
x3(1,length(a3)+1)=0;
x3(2,:)=x3(1,:);
y3(1,1:length(a3)+1)=1;
y3(2,1:length(a3)+1)=2;
subplot(23,1,3);
pcolor(x3,y3,c3);
set(gca,'position',[0.2 1-3*0.015-0.05 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t3','rotation',0,'position',[0.93 1],'FontSize',8);

a4=find(jt4<6);
c4=[];x4=[];y4=[];
c4(1,1:length(a4))=jp4(a4(1):end);
c4(1,length(a4)+1)=0;
c4(2,1:length(a4)+1)=0;
x4(1,1:length(a4))=jt4(a4(1):end);
x4(1,length(a4)+1)=0;
x4(2,:)=x4(1,:);
y4(1,1:length(a4)+1)=1;
y4(2,1:length(a4)+1)=2;
subplot(23,1,4);
pcolor(x4,y4,c4);
set(gca,'position',[0.2 1-4*0.015-0.05 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t4','rotation',0,'position',[0.93 1],'FontSize',8);

a5=find(jt5<6);
c5=[];x5=[];y5=[];
c5(1,1:length(a5))=jp5(a5(1):end);
c5(1,length(a5)+1)=0;
c5(2,1:length(a5)+1)=0;
x5(1,1:length(a5))=jt5(a5(1):end);
x5(1,length(a5)+1)=0;
x5(2,:)=x5(1,:);
y5(1,1:length(a5)+1)=1;
y5(2,1:length(a5)+1)=2;
subplot(23,1,5);
pcolor(x5,y5,c5);
set(gca,'position',[0.2 1-5*0.015-0.05 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t5','rotation',0,'position',[0.93 1],'FontSize',8);
text(0.27,1,'(a)','Color','r','FontSize',16);

a6=find(jt6<6);
c6=[];x6=[];y6=[];
c6(1,1:length(a6))=jp6(a6(1):end);
c6(1,length(a6)+1)=0;
c6(2,1:length(a6)+1)=0;
x6(1,1:length(a6))=jt6(a6(1):end);
x6(1,length(a6)+1)=0;
x6(2,:)=x6(1,:);
y6(1,1:length(a6)+1)=1;
y6(2,1:length(a6)+1)=2;
subplot(23,1,6);
pcolor(x6,y6,c6);
set(gca,'position',[0.2 1-6*0.015-0.05 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t6','rotation',0,'position',[0.93 1],'FontSize',8);

a7=find(jt7<6);
c7=[];x7=[];y7=[];
c7(1,1:length(a7))=jp7(a7(1):end);
c7(1,length(a7)+1)=0;
c7(2,1:length(a7)+1)=0;
x7(1,1:length(a7))=jt7(a7(1):end);
x7(1,length(a7)+1)=0;
x7(2,:)=x7(1,:);
y7(1,1:length(a7)+1)=1;
y7(2,1:length(a7)+1)=2;
subplot(23,1,7);
pcolor(x7,y7,c7);
set(gca,'position',[0.2 1-7*0.015-0.05 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t7','rotation',0,'position',[0.93 1],'FontSize',8);

a8=find(jt8<6);
c8=[];x8=[];y8=[];
c8(1,1:length(a8))=jp8(a8(1):end);
c8(1,length(a8)+1)=0;
c8(2,1:length(a8)+1)=0;
x8(1,1:length(a8))=jt8(a8(1):end);
x8(1,length(a8)+1)=0;
x8(2,:)=x8(1,:);
y8(1,1:length(a8)+1)=1;
y8(2,1:length(a8)+1)=2;
subplot(23,1,8);
pcolor(x8,y8,c8);
set(gca,'position',[0.2 1-8*0.015-0.05 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t8','rotation',0,'position',[0.93 1],'FontSize',8);

a9=find(jt9<6);
c9=[];x9=[];y9=[];
c9(1,1:length(a9))=jp9(a9(1):end);
c9(1,length(a9)+1)=0;
c9(2,1:length(a9)+1)=0;
x9(1,1:length(a9))=jt9(a9(1):end);
x9(1,length(a9)+1)=0;
x9(2,:)=x9(1,:);
y9(1,1:length(a9)+1)=1;
y9(2,1:length(a9)+1)=2;
subplot(23,1,9);
pcolor(x9,y9,c9);
set(gca,'position',[0.2 1-9*0.015-0.05 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t9','rotation',0,'position',[0.93 1],'FontSize',8);

a10=find(jt10<6);
c10=[];x10=[];y10=[];
c10(1,1:length(a10))=jp10(a10(1):end);
c10(1,length(a10)+1)=0;
c10(2,1:length(a10)+1)=0;
x10(1,1:length(a10))=jt10(a10(1):end);
x10(1,length(a10)+1)=0;
x10(2,:)=x10(1,:);
y10(1,1:length(a10)+1)=1;
y10(2,1:length(a10)+1)=2;
subplot(23,1,10);pcolor(x10,y10,c10);
set(gca,'position',[0.2 1-10*0.015-0.05 0.7 0.015])
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t10','rotation',0,'position',[0.93 1],'FontSize',8);
xlabel('period/h')
text(0.77,-1,'order number of events','rotation',90,'Color','k','FontSize',9);

axes('position',[0.9 0.8 0.01 0.15]);
axis off;
cc1=colorbar();caxis([0 1]);
cc1.Label.String='normalized PSD';
cc1.Label.FontSize=9;

a1=find(gt1<6);
gc1=[];gx1=[];y1=[];
gc1(1,1:length(a1))=gp1(a1(1):end);
gc1(1,length(a1)+1)=0;
gc1(2,1:length(a1)+1)=0;
gx1(1,1:length(a1))=gt1(a1(1):end);
gx1(1,length(a1)+1)=0;
gx1(2,:)=gx1(1,:);
y1(1,1:length(a1)+1)=1;
y1(2,1:length(a1)+1)=2;
subplot(23,1,11);
pcolor(gx1,y1,gc1);
set(gca,'position',[0.2 1-11*0.015-0.155 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t1','rotation',0,'position',[0.93 1],'FontSize',8);
title('Analysis To The Galileo Data','FontSize',12)

a2=find(gt2<6);
gc2=[];gx2=[];y2=[];
gc2(1,1:length(a2))=gp2(a2(1):end);
gc2(1,length(a2)+1)=0;
gc2(2,1:length(a2)+1)=0;
gx2(1,1:length(a2))=gt2(a2(1):end);
gx2(1,length(a2)+1)=0;
gx2(2,:)=gx2(1,:);
y2(1,1:length(a2)+1)=1;
y2(2,1:length(a2)+1)=2;
subplot(23,1,12);
pcolor(gx2,y2,gc2);
set(gca,'position',[0.2 1-12*0.015-0.155 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t2','rotation',0,'position',[0.93 1],'FontSize',8);

a3=find(gt3<6);
gc3=[];gx3=[];y3=[];
gc3(1,1:length(a3))=gp3(a3(1):end);
gc3(1,length(a3)+1)=0;
gc3(2,1:length(a3)+1)=0;
gx3(1,1:length(a3))=gt3(a3(1):end);
gx3(1,length(a3)+1)=0;
gx3(2,:)=gx3(1,:);
y3(1,1:length(a3)+1)=1;
y3(2,1:length(a3)+1)=2;
subplot(23,1,13);
pcolor(gx3,y3,gc3);
set(gca,'position',[0.2 1-13*0.015-0.155 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t3','rotation',0,'position',[0.93 1],'FontSize',8);

a4=find(gt4<6);
gc4=[];gx4=[];y4=[];
gc4(1,1:length(a4))=gp4(a4(1):end);
gc4(1,length(a4)+1)=0;
gc4(2,1:length(a4)+1)=0;
gx4(1,1:length(a4))=gt4(a4(1):end);
gx4(1,length(a4)+1)=0;
gx4(2,:)=gx4(1,:);
y4(1,1:length(a4)+1)=1;
y4(2,1:length(a4)+1)=2;
subplot(23,1,14);
pcolor(gx4,y4,gc4);
set(gca,'position',[0.2 1-14*0.015-0.155 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t4','rotation',0,'position',[0.93 1],'FontSize',8);

a5=find(gt5<6);
gc5=[];gx5=[];y5=[];
gc5(1,1:length(a5))=gp5(a5(1):end);
gc5(1,length(a5)+1)=0;
gc5(2,1:length(a5)+1)=0;
gx5(1,1:length(a5))=gt5(a5(1):end);
gx5(1,length(a5)+1)=0;
gx5(2,:)=gx5(1,:);
y5(1,1:length(a5)+1)=1;
y5(2,1:length(a5)+1)=2;
subplot(23,1,15);
pcolor(gx5,y5,gc5);
set(gca,'position',[0.2 1-15*0.015-0.155 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t5','rotation',0,'position',[0.93 1],'FontSize',8);

a6=find(gt6<6);
gc6=[];gx6=[];y6=[];
gc6(1,1:length(a6))=gp6(a6(1):end);
gc6(1,length(a6)+1)=0;
gc6(2,1:length(a6)+1)=0;
gx6(1,1:length(a6))=gt6(a6(1):end);
gx6(1,length(a6)+1)=0;
gx6(2,:)=gx6(1,:);
y6(1,1:length(a6)+1)=1;
y6(2,1:length(a6)+1)=2;
subplot(23,1,16);
pcolor(gx6,y6,gc6);
set(gca,'position',[0.2 1-16*0.015-0.155 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t6','rotation',0,'position',[0.93 1],'FontSize',8);
text(0.27,1,'(b)','Color','r','FontSize',16);

a7=find(gt7<6);
gc7=[];gx7=[];y7=[];
gc7(1,1:length(a7))=gp7(a7(1):end);
gc7(1,length(a7)+1)=0;
gc7(2,1:length(a7)+1)=0;
gx7(1,1:length(a7))=gt7(a7(1):end);
gx7(1,length(a7)+1)=0;
gx7(2,:)=gx7(1,:);
y7(1,1:length(a7)+1)=1;
y7(2,1:length(a7)+1)=2;
subplot(23,1,17);
pcolor(gx7,y7,gc7);
set(gca,'position',[0.2 1-17*0.015-0.155 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t7','rotation',0,'position',[0.93 1],'FontSize',8);

a8=find(gt8<6);
gc8=[];gx8=[];y8=[];
gc8(1,1:length(a8))=gp8(a8(1):end);
gc8(1,length(a8)+1)=0;
gc8(2,1:length(a8)+1)=0;
gx8(1,1:length(a8))=gt8(a8(1):end);
gx8(1,length(a8)+1)=0;
gx8(2,:)=gx8(1,:);
y8(1,1:length(a8)+1)=1;
y8(2,1:length(a8)+1)=2;
subplot(23,1,18);
pcolor(gx8,y8,gc8);
set(gca,'position',[0.2 1-18*0.015-0.155 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t8','rotation',0,'position',[0.93 1],'FontSize',8);

a9=find(gt9<6);
gc9=[];gx9=[];y9=[];
gc9(1,1:length(a9))=gp9(a9(1):end);
gc9(1,length(a9)+1)=0;
gc9(2,1:length(a9)+1)=0;
gx9(1,1:length(a9))=gt9(a9(1):end);
gx9(1,length(a9)+1)=0;
gx9(2,:)=gx9(1,:);
y9(1,1:length(a9)+1)=1;
y9(2,1:length(a9)+1)=2;
subplot(23,1,19);
pcolor(gx9,y9,gc9);
set(gca,'position',[0.2 1-19*0.015-0.155 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t9','rotation',0,'position',[0.93 1],'FontSize',8);

a10=find(gt10<6);
gc10=[];gx10=[];y10=[];
gc10(1,1:length(a10))=gp10(a10(1):end);
gc10(1,length(a10)+1)=0;
gc10(2,1:length(a10)+1)=0;
gx10(1,1:length(a10))=gt10(a10(1):end);
gx10(1,length(a10)+1)=0;
gx10(2,:)=gx10(1,:);
y10(1,1:length(a10)+1)=1;
y10(2,1:length(a10)+1)=2;
subplot(23,1,20);
pcolor(gx10,y10,gc10);
set(gca,'position',[0.2 1-20*0.015-0.155 0.7 0.015])
set(gca,'xticklabel','')
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t10','rotation',0,'position',[0.93 1],'FontSize',8);

a11=find(gt11<6);
gc11=[];gx11=[];y11=[];
gc11(1,1:length(a11))=gp11(a11(1):end);
gc11(1,length(a11)+1)=0;
gc11(2,1:length(a11)+1)=0;
gx11(1,1:length(a11))=gt11(a11(1):end);
gx11(1,length(a11)+1)=0;
gx11(2,:)=gx11(1,:);
y11(1,1:length(a11)+1)=1;
y11(2,1:length(a11)+1)=2;
subplot(23,1,21);
pcolor(gx11,y11,gc11);
set(gca,'position',[0.2 1-21*0.015-0.155 0.7 0.015])
set(gca,'yticklabel','')
xlim([1 6])
ylabel('t11','rotation',0,'position',[0.93 1],'FontSize',8);
xlabel('period/h')
text(0.77,-0.5,'order number of events','rotation',90,'Color','k','FontSize',9);

axes('position',[0.9 0.53 0.01 0.165]);
axis off;
cc2=colorbar();caxis([0 1]);
cc2.Label.String='normalized PSD';
cc2.Label.FontSize=9;

subplot(23,1,22);
plot(x1(1,:),c1(1,:),x2(1,:),c2(1,:),x3(1,:),c3(1,:),x4(1,:),c4(1,:),x5(1,:),c5(1,:),x6(1,:),c6(1,:),x7(1,:),c7(1,:),x8(1,:),c8(1,:),x9(1,:),c9(1,:),x10(1,:),c10(1,:))
hold on;plot([1 6],[1 1],'k')
xlim([1 6])
legend('t1','t2','t3','t4','t5','t6','t7','t8','t9','t10','0.95 confidence')
legend('Position',[0.705 0.29 0.24 0.12])
legend('NumColumns',3)
set(gca,'position',[0.2 0.29 0.5 0.12])
xlabel('period/h')
text(0,1,'(c)','Color','r','FontSize',16);
ylabel('normalized PSD','Position',[0.755 1])
title('Analysis To The Juno Data','FontSize',12)

subplot(23,1,23);
plot(gx1(1,:),gc1(1,:),gx2(1,:),gc2(1,:),gx3(1,:),gc3(1,:),gx4(1,:),gc4(1,:),gx5(1,:),gc5(1,:),gx6(1,:),gc6(1,:),gx7(1,:),gc7(1,:),gx8(1,:),gc8(1,:),gx9(1,:),gc9(1,:),gx10(1,:),gc10(1,:),gx11(1,:),gc11(1,:))
hold on;plot([1 6],[1 1],'k')
xlim([1 6])
legend('t1','t2','t3','t4','t5','t6','t7','t8','t9','t10','t11','0.95 confidence')
legend('Position',[0.705 0.06 0.24 0.12])
legend('NumColumns',3)
set(gca,'position',[0.2 0.06 0.5 0.12])
xlabel('period/h')
text(0,1,'(d)','Color','r','FontSize',16);
ylabel('normalized PSD','Position',[0.755 1])
title('Analysis To The Galileo Data','FontSize',12)