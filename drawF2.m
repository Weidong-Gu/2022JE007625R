% We use irfu codes in these codes, please import irfu codes and run irf.m before run these codes

% All Juno and Galileo data presented here are publicly available from NASAs Planetary Data System (https://pds-ppi.igpp.ucla.edu/). 
% The Juno-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519711
% The Juno-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519708 
% The Galileo-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519668 
% The Galileo-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519683.

% The arrow of text is drawn after the figure plotted, instead of drawn by this code.

clear all

[tc,ts,bx,by,bz,b0,x,y,z,localtime]=textread('ORB28B_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');

tuse=[];
for i=1:length(tc)
a=irf_time([tc{i},'Z'],'utc>epochtt');
tuse=[tuse;a];
end

Bx=TSeries(tuse,bx);
By=TSeries(tuse,by);
Bz=TSeries(tuse,bz);
B0=TSeries(tuse,b0);
Rx=TSeries(tuse,x);
Ry=TSeries(tuse,y);
Rz=TSeries(tuse,z);
lt=TSeries(tuse,localtime);

h = irf_plot(5, 'newfigure');
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'centimeters');
positionVector_illustration = [1,1,25,30];
set(gcf, 'PaperPosition',  positionVector_illustration);
suptitle('Galileo: 2000-11-22/00 UT to 2000-12-03/00 UT')

set(h(1),'position',[0.15 0.78 0.7 0.14])
set(h(2),'position',[0.15 0.64 0.7 0.14])
set(h(3),'position',[0.15 0.5 0.7 0.14])
set(h(4),'position',[0.15 0.36 0.7 0.14])
set(h(5),'position',[0.15 0.12 0.7 0.14])

% Data loaded here is managed from Galileo-wave data.
% Data time has been marked in the figure plotted.

load('2000112220001203.mat');

% dep0 is time data, dep1 is frequency data.
% data is denary logarithm of the plasma wave spectrogram of the electric field.

hold(h(1),'on');
irf_spectrogram(h(1),dep0,data,dep1)
set(h(1),'YScale','log');
set(h(1),'ytick',[0.1 10 1000]);
set(h(1),'Fontsize',10)
colormap(jet)

irf_zoom(h(1),'x',[dep0(1) dep0(end)])
irf_zoom(h(1),'y',[dep1(1)/1000 dep1(end)/1000])
xlabel(h(1),'');
xticks(h(1),'')
c=colorbar(h(1));
c.Position=[0.86 0.78 0.01 0.14];
caxis(h(1),[-14 -12]);
c.Ticks=[-14 -13 -12];
c.TickLabels={'10^{-14}','10^{-13}','10^{-12}'};
c.Label.String='Electric Spectral Density (V^{2}m^{-2}Hz^{-1})';
c.Label.FontSize=10;

timedur = '2000-11-22T00:00:00Z/2000-12-03T00:00:00Z';
tint = irf.tint(timedur);
B0use = B0.tlim(tint);
Rxuse=Rx.tlim(tint);
Ryuse=Ry.tlim(tint);
Rzuse=Rz.tlim(tint);
LTuse=lt.tlim(tint);
r=sqrt(Rxuse.data.^2+Ryuse.data.^2+Rzuse.data.^2);
lat=asin(Rzuse.data./r);
ruse=TSeries(Rxuse.time,r);
LATuse=TSeries(Rxuse.time,lat);
hold(h(2),'on');
irf_plot(h(2),B0use);

Restime = B0use.time(1):24:B0use.time(end);
  Resdata = nan*ones(length(Restime),1);
  Resstr =  TSeries(Restime, Resdata);
Buse_res = B0use.resample(Resstr);

Tmin1=1;Tmax1=10;Tmin2=10;Tmax2=30;Tmin3=30;Tmax3=60;
fmax1 = 1./(Tmin1*60);fmin1= 1./(Tmax1*60);
fmax2 = 1./(Tmin2*60);fmin2= 1./(Tmax2*60);
fmax3 = 1./(Tmin3*60);fmin3= 1./(Tmax3*60);

Bbp=Buse_res.filt(fmin1, fmax1,1/24,5);
hold(h(3),'on');
irf_plot(h(3),Bbp)

Int1=TSeries(Bbp.time,Bbp.data.^2);
tuse=irf_time(Bbp.time,'epochtt>epoch');
l=length(tuse);
tuse(l+1)=tuse(end)+24;
t1=tuse(1):600:tuse(end);
ii(1)=1;
j1=2;
for i=1:l
    if j1<=length(t1)
        if tuse(i)<t1(j1) & tuse(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end

l0=length(ii)-1;
for i=1:l0
E(i,1)=0;
for j=ii(i):(ii(i+1)-1)
E(i,1)=E(i,1)+Int1.data(j);
end
TT=[];
for i=1:l0
a=irf_time(tuse(ii(i)),'epoch>epochtt');
TT=[TT;a];
end
end
e=log(E);
eT=TSeries(TT,e);
hold(h(4),'on');
irf_plot(h(4),eT)
ylim(h(4),[-7 3])
xlabel(h(4),'')

timedur0 = '2000-11-22T00:00:00Z/2000-12-03T00:00:00Z';
tint0 = irf.tint(timedur0);
irf_zoom(h(2),'x',tint0);
irf_zoom(h(3),'x',tint0);
irf_zoom(h(4),'x',tint0);
xlabel(h(2),'')
xticks(h(2),'')
xlabel(h(3),'')
xticks(h(3),'')
xlabel(h(4),'')

R = irf.ts2mat(ruse);
LT = irf.ts2mat(LTuse);
LAT = irf.ts2mat(LATuse);
irf_timeaxis(h(4),'usefig',[R(:,1) R(:,2) LT(:,2) LAT(:,2)],{'R (R_J)' 'LT(h)' 'LAT(deg)'}, 10);

eana=e(325:length(e)-342);
T=0:1/6:(l0-1)/6;
Tana=T(325:length(T)-342);
[pp,ff, pth] = plomb(eana,Tana,1,10,'Pd',0.95);
tt = 1./ff;
hold(h(5),'on');
plot(h(5),tt,pp);hold on;plot([1 10],[pth pth],'r');
xlim(h(5),[1 10])

xlabel(h(5),'period(h)')
xticks(h(5),'auto')
xticklabels(h(5),'auto')
title(h(5),'Periodic Analysis to 2000-11-24/06 UT to 2000-11-30/15 UT')

% Imperative statements below sometimes can't be done due to unknown reason, but run them again after running over this code can be of use.

txt1=text(h(1),5e4,6,['a'],'Color','r','FontSize',25);
txt2=text(h(2),5e4,6,['b'],'Color','r','FontSize',25);
txt3=text(h(3),5e4,1.6,['c'],'Color','r','FontSize',25);
txt4=text(h(4),5e4,2,['d'],'Color','r','FontSize',25);
txt5=text(h(5),1.5,12,['e'],'Color','r','FontSize',25);

ylabel(h(1),'Frequency(kHz)','FontSize',12,'Position',[-6e4,8]);
ylabel(h(2),'B_{total}(nT)','Interpreter','Tex','FontSize',12,'Position',[-4.5e4,3.8])
ylabel(h(3),'\deltaB(nT)','Interpreter','Tex','FontSize',12,'Position',[-6e4,0])
ylabel(h(4),'ln(\deltaB^{2})(ln(nT^{2}))','Interpreter','Tex','FontSize',12,'Position',[-6e4,-6])
ylabel(h(5),'PSD(nT^{2}/Hz)','FontSize',12,'Position',[0.5, 7.5])
