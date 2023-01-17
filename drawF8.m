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

load('gp3.mat')
load('gp4.mat')
load('gp11.mat')
load('jp4.mat')

load('gt3.mat')
load('gt4.mat')
load('gt11.mat')
load('jt4.mat')

f=figure('Position',[200 100 800 500]);

jt4use=find(jt4<6);
yj4=[];xj4=[];
yj4(1,1:length(jt4use))=jp4(jt4use(1):end);
xj4(1,1:length(jt4use))=jt4(jt4use(1):end);
h1=axes('Position',[0.2 0.79 0.7 0.17]);
plot(h1,xj4,yj4,'b')
hold on;plot(h1,[1 6],[1 1],'r')
xlim([1 6])
xlabel('period/h')
ylabel('normalized PSD')
text(1.1,1.6,'Compressed State: Juno t4','FontSize',10)
text(0.3,1,'(a)','FontSize',15);

gt11use=find(gt11<6);
yg11=[];xg11=[];
yg11(1,1:length(gt11use))=gp11(gt11use(1):end);
xg11(1,1:length(gt11use))=gt11(gt11use(1):end);
h2=axes('Position',[0.2 0.55 0.7 0.17]);
plot(h2,xg11,yg11,'b')
hold on;plot(h2,[1 6],[1 1],'r')
xlim([1 6])
ylim([0 2])
xlabel('period/h')
ylabel('normalized PSD')
text(1.1,1.6,'Compressed State: Galileo t11','FontSize',10)
text(0.3,0.7,'(b)','FontSize',15);

gt3use=find(gt3<6);
yg3=[];xg3=[];
yg3(1,1:length(gt3use))=gp3(gt3use(1):end);
xg3(1,1:length(gt3use))=gt3(gt3use(1):end);
h3=axes('Position',[0.2 0.31 0.7 0.17]);
plot(h3,xg3,yg3,'b')
hold on;plot(h3,[1 6],[1 1],'r')
xlim([1 6])
xlabel('period/h')
ylabel('normalized PSD')
text(1.1,1.6,'Expended State: Galileo t3','FontSize',10)
text(0.3,1,'(c)','FontSize',15);

gt4use=find(gt4<6);
yg4=[];xg4=[];
yg4(1,1:length(gt4use))=gp4(gt4use(1):end);
xg4(1,1:length(gt4use))=gt4(gt4use(1):end);
h4=axes('Position',[0.2 0.07 0.7 0.17]);
plot(h4,xg4,yg4,'b')
hold on;plot(h4,[1 6],[1 1],'r')
xlim([1 6])
xlabel('period/h')
ylabel('normalized PSD')
text(1.1,1.6,'Expended State: Galileo t4','FontSize',10)
text(0.3,1,'(d)','FontSize',15);
