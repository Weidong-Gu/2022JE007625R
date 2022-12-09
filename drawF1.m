% We use irfu codes in these codes, please import irfu codes and run irf.m before run these codes

% All Juno and Galileo data presented here are publicly available from NASAs Planetary Data System (https://pds-ppi.igpp.ucla.edu/). 
% The Juno-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519711
% The Juno-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519708 
% The Galileo-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519668 
% The Galileo-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519683.

% The arrow of text is drawn after the figure plotted, instead of drawn by this code.

clear all

% Data loaded here is managed before used. ~total is data of the whole time which Juno has observed. 
% Bdata is the total magnetic field (|B|).

load('rtotal.mat')
load('LATtotal.mat')
load('LTtotal.mat')
load('Bdatatotal.mat')

h = irf_plot(5, 'newfigure')
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'centimeters');
positionVector_illustration = [1,1,25,30];
set(gcf, 'PaperPosition',  positionVector_illustration);

suptitle('Juno: 2016-11-07/00 UT to 2016-11-12/00 UT')

set(h(1),'position',[0.15 0.78 0.7 0.14])
set(h(2),'position',[0.15 0.64 0.7 0.14])
set(h(3),'position',[0.15 0.5 0.7 0.14])
set(h(4),'position',[0.15 0.36 0.7 0.14])
set(h(5),'position',[0.15 0.12 0.7 0.14])

% Data loaded here is managed from Juno-wave data.
% Data time has been marked in the figure plotted.
% dep0 is time data, dep1 is frequency data.
% data is denary logarithm of the plasma wave spectrogram of the electric field.

load('dep1.mat')
load('dep0.mat')
load('data.mat')

hold(h(1),'on');
irf_spectrogram(h(1),dep0,data(:,1:44),dep1(1:44))
set(h(1),'YScale','log');
set(h(1),'ytick',[0.1 1 10]);
set(h(1),'Fontsize',10)
colormap(jet)
ylabel(h(1),'frequency(kHz)','FontSize',12);
irf_zoom(h(1),'x',[dep0(1) dep0(end)])
irf_zoom(h(1),'y',[dep1(1)/1000 dep1(44)/1000])
xlabel(h(1),'');
xticks(h(1),'')
c=colorbar(h(1));
c.Position=[0.86 0.78 0.01 0.14];
caxis(h(1),[-14 -12]);
c.Ticks=[-14 -13 -12];
c.TickLabels={'10^{-14}','10^{-13}','10^{-12}'};
c.Label.String='Electric Spectral Density (V^{2}m^{-2}Hz^{-1})';
c.Label.FontSize=10;

timedur = '2016-11-07T00:00:00Z/2016-11-12T00:00:00Z';
  tint = irf.tint(timedur);
ruse=rtotal.tlim(tint);
LATuse=LATtotal.tlim(tint);
LTuse=LTtotal.tlim(tint);
Buse=Bdatatotal.tlim(tint);  
hold(h(2),'on');
irf_plot(h(2),Buse)
ylabel(h(2),'B_{total}(nT)','Interpreter','Tex','FontSize',12)
xlabel(h(2),'')

Restime = Buse.time(1):1:Buse.time(end);
  Resdata = nan*ones(length(Restime),1);
  Resstr =  TSeries(Restime, Resdata);
Buse_res = Buse.resample(Resstr);

Tmin1=1;Tmax1=10;Tmin2=10;Tmax2=30;Tmin3=30;Tmax3=60;
fmax1 = 1./(Tmin1*60);fmin1= 1./(Tmax1*60);
fmax2 = 1./(Tmin2*60);fmin2= 1./(Tmax2*60);
fmax3 = 1./(Tmin3*60);fmin3= 1./(Tmax3*60);

Bbp=Buse_res.filt(fmin1, fmax1,1,5);
hold(h(3),'on');
irf_plot(h(3),Bbp)
ylabel(h(3),'\deltaB(nT)','Interpreter','Tex','FontSize',12)
xlabel(h(3),'')

Int1=TSeries(Bbp.time,Bbp.data.^2);
tuse=irf_time(Bbp.time,'epochtt>epoch');
l=length(tuse);
tuse(l+1)=tuse(end)+2;
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
ylim(h(4),[-3 8])
ylabel(h(4),'ln(\deltaB^{2})(ln(nT^{2}))','Interpreter','Tex','FontSize',12)
xlabel(h(4),'')

irf_zoom(h(2),'x',tint);
irf_zoom(h(3),'x',tint);
irf_zoom(h(4),'x',tint);
xlabel(h(2),'')
xticks(h(2),'')
xlabel(h(3),'')
xticks(h(3),'')
xlabel(h(4),'')

R = irf.ts2mat(ruse);
LT = irf.ts2mat(LTuse);
LAT = irf.ts2mat(LATuse);
irf_timeaxis(h(4),'usefig',[R(:,1) R(:,2) LT(:,2) LAT(:,2)],{'R (R_J)' 'LT(h)' 'LAT(deg)'}, 10);

eana=e(217:length(e)-132);
T=1/6:1/6:120;
Tana=T(217:length(T)-132);
[pp,ff, pth] = plomb(eana,Tana,1,10,'Pd',0.95);
tt = 1./ff;
hold(h(5),'on');
plot(h(5),tt,pp);hold on;plot([1 10],[pth pth],'r');
xlim(h(5),[1 10])
ylabel(h(5),'PSD(nT^{2}/Hz)','FontSize',12)
xlabel(h(5),'period(h)')
xticks(h(5),'auto')
xticklabels(h(5),'auto')
title(h(5),'Periodic Analysis to 2016-11-08/12 UT to 2016-11-11/02 UT')

uistack(h(1),"bottom");
uistack(h(2),"bottom");
uistack(h(3),"bottom");
uistack(h(4),"bottom");
uistack(h(5),"bottom");

% Imperative statements below sometimes can't be done due to unknown reason, but run them again after running over this code can be of use.

txt1=text(h(1),1.2e4,4,'a','Color','r','FontSize',25);
txt2=text(h(2),9.4674e8,9,'b','Color','r','FontSize',25);
txt3=text(h(3),9.4674e8,3.5,'c','Color','r','FontSize',25);
txt4=text(h(4),9.4674e8,5,'d','Color','r','FontSize',25);
txt5=text(h(5),1.3,8,'e','Color','r','FontSize',25);

ylabel(h(1),'Frequency(kHz)','FontSize',12,'Position',[-3e4,0.9]);
ylabel(h(2),'B_{total}(nT)','Interpreter','Tex','FontSize',12,'Position',[9.46704e8,5.5])
ylabel(h(3),'\deltaB(nT)','Interpreter','Tex','FontSize',12,'Position',[9.46701e8,0.5])
ylabel(h(4),'ln(\deltaB^{2})(ln(nT^{2}))','Interpreter','Tex','FontSize',12,'Position',[9.46701e8,1])
ylabel(h(5),'PSD(nT^{2}/Hz)','FontSize',12,'Position',[0.4, 5])