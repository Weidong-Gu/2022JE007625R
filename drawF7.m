% We use irfu codes in these codes, please import irfu codes and run irf.m before run these codes

% All Juno and Galileo data presented here are publicly available from NASAs Planetary Data System (https://pds-ppi.igpp.ucla.edu/). 
% The Juno-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519711
% The Juno-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519708 
% The Galileo-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519668 
% The Galileo-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519683.

clear all

% mp is the data of the location of satellites crossing the magnetopause in every event.

load('mp.mat');

theta=-0.9*pi:0.01*pi:0.9*pi;

rmp0=76.*((2./(1.+cos(theta))).^0.559);
rbs0=100.*(1.74./(1.+0.74.*cos(theta)));
xmp0=rmp0.*cos(theta);
ymp0=rmp0.*sin(theta);
xbs0=rbs0.*cos(theta);
ybs0=rbs0.*sin(theta);

rmp1=58.*((2./(1.+cos(theta))).^0.427);
rbs1=84.*(1.722./(1.+0.722.*cos(theta)));
xmp1=rmp1.*cos(theta);
ymp1=rmp1.*sin(theta);
xbs1=rbs1.*cos(theta);
ybs1=rbs1.*sin(theta);

rmp2=90.*((2./(1.+cos(theta))).^0.596);
rbs2=118.*(1.754./(1.+0.754.*cos(theta)));
xmp2=rmp2.*cos(theta);
ymp2=rmp2.*sin(theta);
xbs2=rbs2.*cos(theta);
ybs2=rbs2.*sin(theta);

xmp=mp(:,1).*cos((12-mp(:,2)).*pi/12);
ymp=-mp(:,1).*sin((12-mp(:,2)).*pi/12);

f=figure('Position',[200 30 500 750]);

h1=axes('Position',[0.25 0.1 0.6 0.8]);
plot(h1,xmp0,ymp0,'g');hold on;
plot(h1,xmp1,ymp1,'r');hold on;
plot(h1,xmp2,ymp2,'m');hold on;
scatter(h1,1,1,100,'k','filled')
scatter(h1,xmp,ymp,9,'b','filled')
text(xmp(20),ymp(20),' Galileo t3','FontSize',8);
text(xmp(21),ymp(21),' Galileo t4','FontSize',8);
text(xmp(28),ymp(28),' Galileo t11(1)','FontSize',8);
text(xmp(29),ymp(29),' Galileo t11(2)','FontSize',8);
text(xmp(4),ymp(4),' Juno t4(1)','FontSize',8);
text(xmp(5),ymp(5),' Juno t4(2)','FontSize',8);
legend('solar wind P_{d}=0.090nPa','solar wind P_{d}=0.360nPa','solar wind P_{d}=0.045nPa','Jupiter','Location of MP Crossing')
xlim([-100 100])
ylim([-200 200])
xlabel('x/R_{j}')
ylabel('y/R_{j}','Position',[-120,0])
title('MP Crossings','Fontsize',12)
