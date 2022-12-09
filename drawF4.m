% We use irfu codes in these codes, please import irfu codes and run irf.m before run these codes

% All Juno and Galileo data presented here are publicly available from NASAs Planetary Data System (https://pds-ppi.igpp.ucla.edu/). 
% The Juno-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519711
% The Juno-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519708 
% The Galileo-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519668 
% The Galileo-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519683.

clear all

% Data loaded here is managed before used. ~total is data of the whole time which Juno has observed. 
% Bdata is the total magnetic field (|B|).

load('Bdatatotal.mat')

figure;
set(gcf,'position',[100 50 600 600])

[tc1,ts,bx,by,bz,b1,x,y,z,localtime]=textread('ORB28A_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');
[tc2,ts,bx,by,bz,b2,x,y,z,localtime]=textread('ORB28B_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');
[tc3,ts,bx,by,bz,b3,x,y,z,localtime]=textread('ORB29_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');
[tc4,ts,bx,by,bz,b4,x,y,z,localtime]=textread('ORB32_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');
[tc5,ts,bx,by,bz,b5,x,y,z,localtime]=textread('ORB33_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');

timedur1 = '2016-11-08T12:00:00Z/2016-11-11T02:00:00Z';
tint1 = irf.tint(timedur1);
Buse1 = Bdatatotal.tlim(tint1);
timedur2 = '2016-11-12T00:00:00Z/2016-11-13T01:00:00Z';
tint2 = irf.tint(timedur2);
Buse2 = Bdatatotal.tlim(tint2);
timedur3 = '2016-11-21T23:00:00Z/2016-11-23T16:00:00Z';
tint3 = irf.tint(timedur3);
Buse3 = Bdatatotal.tlim(tint3);
timedur4 = '2017-01-24T18:00:00Z/2017-01-25T19:00:00Z';
tint4 = irf.tint(timedur4);
Buse4 = Bdatatotal.tlim(tint4);
timedur5 = '2017-02-19T06:00:00Z/2017-02-21T01:00:00Z';
tint5 = irf.tint(timedur5);
Buse5 = Bdatatotal.tlim(tint5);
timedur6 = '2017-04-08T15:00:00Z/2017-04-09T11:00:00Z';
tint6 = irf.tint(timedur6);
Buse6 = Bdatatotal.tlim(tint6);
timedur7 = '2017-05-05T14:00:00Z/2017-05-07T01:00:00Z';
tint7 = irf.tint(timedur7);
Buse7 = Bdatatotal.tlim(tint7);
timedur8 = '2017-06-16T08:00:00Z/2017-06-17T14:00:00Z';
tint8 = irf.tint(timedur8);
Buse8 = Bdatatotal.tlim(tint8);
timedur9 = '2017-06-18T09:00:00Z/2017-06-19T05:00:00Z';
tint9 = irf.tint(timedur9);
Buse9 = Bdatatotal.tlim(tint9);
timedur10 = '2017-10-01T06:00:00Z/2017-10-02T18:00:00Z';
tint10 = irf.tint(timedur10);
Buse10 = Bdatatotal.tlim(tint10);

Restime1 = Buse1.time(1):1:Buse1.time(end);
Restime2 = Buse2.time(1):1:Buse2.time(end);
Restime3 = Buse3.time(1):1:Buse3.time(end);
Restime4 = Buse4.time(1):1:Buse4.time(end);
Restime5 = Buse5.time(1):1:Buse5.time(end);
Restime6 = Buse6.time(1):1:Buse6.time(end);
Restime7 = Buse7.time(1):1:Buse7.time(end);
Restime8 = Buse8.time(1):1:Buse8.time(end);
Restime9 = Buse9.time(1):1:Buse9.time(end);
Restime10 = Buse10.time(1):1:Buse10.time(end);
Resdata1 = nan*ones(length(Restime1),1);
Resdata2 = nan*ones(length(Restime2),1);
Resdata3 = nan*ones(length(Restime3),1);
Resdata4 = nan*ones(length(Restime4),1);
Resdata5 = nan*ones(length(Restime5),1);
Resdata6 = nan*ones(length(Restime6),1);
Resdata7 = nan*ones(length(Restime7),1);
Resdata8 = nan*ones(length(Restime8),1);
Resdata9 = nan*ones(length(Restime9),1);
Resdata10 = nan*ones(length(Restime10),1);
Resstr1 =  TSeries(Restime1, Resdata1);
Resstr2 =  TSeries(Restime2, Resdata2);
Resstr3 =  TSeries(Restime3, Resdata3);
Resstr4 =  TSeries(Restime4, Resdata4);
Resstr5 =  TSeries(Restime5, Resdata5);
Resstr6 =  TSeries(Restime6, Resdata6);
Resstr7 =  TSeries(Restime7, Resdata7);
Resstr8 =  TSeries(Restime8, Resdata8);
Resstr9 =  TSeries(Restime9, Resdata9);
Resstr10 =  TSeries(Restime10, Resdata10);
Buse_res1 = Buse1.resample(Resstr1);
Buse_res2 = Buse2.resample(Resstr2);
Buse_res3 = Buse3.resample(Resstr3);
Buse_res4 = Buse4.resample(Resstr4);
Buse_res5 = Buse5.resample(Resstr5);
Buse_res6 = Buse6.resample(Resstr6);
Buse_res7 = Buse7.resample(Resstr7);
Buse_res8 = Buse8.resample(Resstr8);
Buse_res9 = Buse9.resample(Resstr9);
Buse_res10 = Buse10.resample(Resstr10);

Tmin1=1;Tmax1=10;
fmax1 = 1./(Tmin1*60);fmin1= 1./(Tmax1*60);

Bbp1=Buse_res1.filt(fmin1, fmax1,1,5);
Bbp2=Buse_res2.filt(fmin1, fmax1,1,5);
Bbp3=Buse_res3.filt(fmin1, fmax1,1,5);
Bbp4=Buse_res4.filt(fmin1, fmax1,1,5);
Bbp5=Buse_res5.filt(fmin1, fmax1,1,5);
Bbp6=Buse_res6.filt(fmin1, fmax1,1,5);
Bbp7=Buse_res7.filt(fmin1, fmax1,1,5);
Bbp8=Buse_res8.filt(fmin1, fmax1,1,5);
Bbp9=Buse_res9.filt(fmin1, fmax1,1,5);
Bbp10=Buse_res10.filt(fmin1, fmax1,1,5);

Int1=TSeries(Bbp1.time,Bbp1.data.^2);
Int2=TSeries(Bbp2.time,Bbp2.data.^2);
Int3=TSeries(Bbp3.time,Bbp3.data.^2);
Int4=TSeries(Bbp4.time,Bbp4.data.^2);
Int5=TSeries(Bbp5.time,Bbp5.data.^2);
Int6=TSeries(Bbp6.time,Bbp6.data.^2);
Int7=TSeries(Bbp7.time,Bbp7.data.^2);
Int8=TSeries(Bbp8.time,Bbp8.data.^2);
Int9=TSeries(Bbp9.time,Bbp9.data.^2);
Int10=TSeries(Bbp10.time,Bbp10.data.^2);

tuse1=irf_time(Bbp1.time,'epochtt>epoch');
tuse2=irf_time(Bbp2.time,'epochtt>epoch');
tuse3=irf_time(Bbp3.time,'epochtt>epoch');
tuse4=irf_time(Bbp4.time,'epochtt>epoch');
tuse5=irf_time(Bbp5.time,'epochtt>epoch');
tuse6=irf_time(Bbp6.time,'epochtt>epoch');
tuse7=irf_time(Bbp7.time,'epochtt>epoch');
tuse8=irf_time(Bbp8.time,'epochtt>epoch');
tuse9=irf_time(Bbp9.time,'epochtt>epoch');
tuse10=irf_time(Bbp10.time,'epochtt>epoch');

l1=length(tuse1);
l2=length(tuse2);
l3=length(tuse3);
l4=length(tuse4);
l5=length(tuse5);
l6=length(tuse6);
l7=length(tuse7);
l8=length(tuse8);
l9=length(tuse9);
l10=length(tuse10);

tuse1(l1+1)=tuse1(end)+2;
t1=tuse1(1):600:tuse1(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l1
    if j1<=length(t1)
        if tuse1(i)<t1(j1) & tuse1(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i1=length(ii)-1;
ea1=0;
for i=1:i1
    E1(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E1(i)=E1(i)+Int1.data(j);
    end
    ea1=ea1+E1(i)/i1;
end

tuse2(l2+1)=tuse2(end)+2;
t1=tuse2(1):600:tuse2(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l2
    if j1<=length(t1)
        if tuse2(i)<t1(j1) & tuse2(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i2=length(ii)-1;
ea2=0;
for i=1:i2
    E2(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E2(i)=E2(i)+Int2.data(j);
    end
    ea2=ea2+E2(i)/i2;
end

tuse3(l3+1)=tuse3(end)+2;
t1=tuse3(1):600:tuse3(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l3
    if j1<=length(t1)
        if tuse3(i)<t1(j1) & tuse3(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i3=length(ii)-1;
ea3=0;
for i=1:i3
    E3(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E3(i)=E3(i)+Int3.data(j);
    end
    ea3=ea3+E3(i)/i3;
end

tuse4(l4+1)=tuse4(end)+2;
t1=tuse4(1):600:tuse4(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l4
    if j1<=length(t1)
        if tuse4(i)<t1(j1) & tuse4(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i4=length(ii)-1;
ea4=0;
for i=1:i4
    E4(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E4(i)=E4(i)+Int4.data(j);
    end
    ea4=ea4+E4(i)/i4;
end

tuse5(l5+1)=tuse5(end)+2;
t1=tuse5(1):600:tuse5(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l5
    if j1<=length(t1)
        if tuse5(i)<t1(j1) & tuse5(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i5=length(ii)-1;
ea5=0;
for i=1:i5
    E5(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E5(i)=E5(i)+Int5.data(j);
    end
    ea5=ea5+E5(i)/i5;
end

tuse6(l6+1)=tuse6(end)+2;
t1=tuse6(1):600:tuse6(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l6
    if j1<=length(t1)
        if tuse6(i)<t1(j1) & tuse6(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i6=length(ii)-1;
ea6=0;
for i=1:i6
    E6(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E6(i)=E6(i)+Int6.data(j);
    end
    ea6=ea6+E6(i)/i6;
end

tuse7(l7+1)=tuse7(end)+2;
t1=tuse7(1):600:tuse7(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l7
    if j1<=length(t1)
        if tuse7(i)<t1(j1) & tuse7(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i7=length(ii)-1;
ea7=0;
for i=1:i7
    E7(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E7(i)=E7(i)+Int7.data(j);
    end
    ea7=ea7+E7(i)/i7;
end

tuse8(l8+1)=tuse8(end)+2;
t1=tuse8(1):600:tuse8(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l8
    if j1<=length(t1)
        if tuse8(i)<t1(j1) & tuse8(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i8=length(ii)-1;
ea8=0;
for i=1:i8
    E8(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E8(i)=E8(i)+Int8.data(j);
    end
    ea8=ea8+E8(i)/i8;
end

tuse9(l9+1)=tuse9(end)+2;
t1=tuse9(1):600:tuse9(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l9
    if j1<=length(t1)
        if tuse9(i)<t1(j1) & tuse9(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i9=length(ii)-1;
ea9=0;
for i=1:i9
    E9(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E9(i)=E9(i)+Int9.data(j);
    end
    ea9=ea9+E9(i)/i9;
end

tuse10(l10+1)=tuse10(end)+2;
t1=tuse10(1):600:tuse10(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l10
    if j1<=length(t1)
        if tuse10(i)<t1(j1) & tuse10(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i10=length(ii)-1;
ea10=0;
for i=1:i10
    E10(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E10(i)=E10(i)+Int10.data(j);
    end
    ea10=ea10+E10(i)/i10;
end

k=0;
for i=1:i1
    e(i)=E1(i)/ea1;
end
k=k+i1;
for i=k+1:k+i2
    e(i)=E2(i-k)/ea2;
end
k=k+i2;
for i=k+1:k+i3
    e(i)=E3(i-k)/ea3;
end
k=k+i3;
for i=k+1:k+i4
    e(i)=E4(i-k)/ea4;
end
k=k+i4;
for i=k+1:k+i5
    e(i)=E5(i-k)/ea5;
end
k=k+i5;
for i=k+1:k+i6
    e(i)=E6(i-k)/ea6;
end
k=k+i6;
for i=k+1:k+i7
    e(i)=E7(i-k)/ea7;
end
k=k+i7;
for i=k+1:k+i8
    e(i)=E8(i-k)/ea8;
end
k=k+i8;
for i=k+1:k+i9
    e(i)=E9(i-k)/ea9;
end
k=k+i9;
for i=k+1:k+i10
    e(i)=E10(i-k)/ea10;
end
k=k+i10;

T=1/6:1/6:k/6;
[pp,ff, pth] = plomb(e,T,1,10,'Pd',0.95);
tt = 1./ff;
subplot(2,1,1);plot(tt,pp);hold on;plot([1 10],[pth pth],'r');
set(gca,'position',[0.2 0.6 0.7 0.3])
xlim([1 10])
title('Juno period analysis','FontSize',12)
xlabel('period/h')
ylabel('PSD(nT^{2}/Hz)','Position',[0.5 4])

tt1=[];
for i=1:length(tc1)
a=irf_time([tc1{i},'Z'],'utc>epochtt');
tt1=[tt1;a];
end
tt2=[];
for i=1:length(tc2)
a=irf_time([tc2{i},'Z'],'utc>epochtt');
tt2=[tt2;a];
end
tt3=[];
for i=1:length(tc3)
a=irf_time([tc3{i},'Z'],'utc>epochtt');
tt3=[tt3;a];
end
tt4=[];
for i=1:length(tc4)
a=irf_time([tc4{i},'Z'],'utc>epochtt');
tt4=[tt4;a];
end
tt5=[];
for i=1:length(tc5)
a=irf_time([tc5{i},'Z'],'utc>epochtt');
tt5=[tt5;a];
end

B1=TSeries(tt1,b1);
B2=TSeries(tt2,b2);
B3=TSeries(tt3,b3);
B4=TSeries(tt4,b4);
B5=TSeries(tt5,b5);

timedur1 = '2000-05-29T15:00:00Z/2000-05-30T17:00:00Z';
tint1 = irf.tint(timedur1);
Buse1 = B1.tlim(tint1);
timedur2 = '2000-06-03T18:00:00Z/2000-06-05T19:00:00Z';
tint2 = irf.tint(timedur2);
Buse2 = B1.tlim(tint2);
timedur3 = '2000-06-10T07:00:00Z/2000-06-11T15:00:00Z';
tint3 = irf.tint(timedur3);
Buse3 = B1.tlim(tint3);
timedur4 = '2000-11-24T06:00:00Z/2000-11-30T15:00:00Z';
tint4 = irf.tint(timedur4);
Buse4 = B2.tlim(tint4);
timedur5 = '2000-12-04T22:00:00Z/2000-12-06T09:00:00Z';
tint5 = irf.tint(timedur5);
Buse5 = B2.tlim(tint5);
timedur6 = '2000-12-11T10:00:00Z/2000-12-12T10:00:00Z';
tint6 = irf.tint(timedur6);
Buse6 = B2.tlim(tint6);
timedur7 = '2001-01-10T21:00:00Z/2001-01-12T06:00:00Z';
tint7 = irf.tint(timedur7);
Buse7 = B3.tlim(tint7);
timedur8 = '2001-01-19T13:00:00Z/2001-01-20T14:00:00Z';
tint8 = irf.tint(timedur8);
Buse8 = B3.tlim(tint8);
timedur9 = '2001-01-21T04:00:00Z/2001-01-23T02:00:00Z';
tint9 = irf.tint(timedur9);
Buse9 = B3.tlim(tint9);
timedur10 = '2002-01-05T07:00:00Z/2002-01-06T20:00:00Z';
tint10 = irf.tint(timedur10);
Buse10 = B4.tlim(tint10);
timedur11 = '2002-10-31T20:00:00Z/2002-11-01T17:00:00Z';
tint11 = irf.tint(timedur11);
Buse11 = B5.tlim(tint11);

Restime1 = Buse1.time(1):24:Buse1.time(end);
Restime2 = Buse2.time(1):24:Buse2.time(end);
Restime3 = Buse3.time(1):24:Buse3.time(end);
Restime4 = Buse4.time(1):24:Buse4.time(end);
Restime5 = Buse5.time(1):24:Buse5.time(end);
Restime6 = Buse6.time(1):24:Buse6.time(end);
Restime7 = Buse7.time(1):24:Buse7.time(end);
Restime8 = Buse8.time(1):24:Buse8.time(end);
Restime9 = Buse9.time(1):24:Buse9.time(end);
Restime10 = Buse10.time(1):24:Buse10.time(end);
Restime11 = Buse11.time(1):24:Buse11.time(end);
Resdata1 = nan*ones(length(Restime1),1);
Resdata2 = nan*ones(length(Restime2),1);
Resdata3 = nan*ones(length(Restime3),1);
Resdata4 = nan*ones(length(Restime4),1);
Resdata5 = nan*ones(length(Restime5),1);
Resdata6 = nan*ones(length(Restime6),1);
Resdata7 = nan*ones(length(Restime7),1);
Resdata8 = nan*ones(length(Restime8),1);
Resdata9 = nan*ones(length(Restime9),1);
Resdata10 = nan*ones(length(Restime10),1);
Resdata11 = nan*ones(length(Restime11),1);
Resstr1 =  TSeries(Restime1, Resdata1);
Resstr2 =  TSeries(Restime2, Resdata2);
Resstr3 =  TSeries(Restime3, Resdata3);
Resstr4 =  TSeries(Restime4, Resdata4);
Resstr5 =  TSeries(Restime5, Resdata5);
Resstr6 =  TSeries(Restime6, Resdata6);
Resstr7 =  TSeries(Restime7, Resdata7);
Resstr8 =  TSeries(Restime8, Resdata8);
Resstr9 =  TSeries(Restime9, Resdata9);
Resstr10 =  TSeries(Restime10, Resdata10);
Resstr11 =  TSeries(Restime11, Resdata11);
Buse_res1 = Buse1.resample(Resstr1);
Buse_res2 = Buse2.resample(Resstr2);
Buse_res3 = Buse3.resample(Resstr3);
Buse_res4 = Buse4.resample(Resstr4);
Buse_res5 = Buse5.resample(Resstr5);
Buse_res6 = Buse6.resample(Resstr6);
Buse_res7 = Buse7.resample(Resstr7);
Buse_res8 = Buse8.resample(Resstr8);
Buse_res9 = Buse9.resample(Resstr9);
Buse_res10 = Buse10.resample(Resstr10);
Buse_res11 = Buse11.resample(Resstr11);

Tmin1=1;Tmax1=10;
fmax1 = 1./(Tmin1*60);fmin1= 1./(Tmax1*60);

Bbp1=Buse_res1.filt(fmin1, fmax1,1,5);
Bbp2=Buse_res2.filt(fmin1, fmax1,1,5);
Bbp3=Buse_res3.filt(fmin1, fmax1,1,5);
Bbp4=Buse_res4.filt(fmin1, fmax1,1,5);
Bbp5=Buse_res5.filt(fmin1, fmax1,1,5);
Bbp6=Buse_res6.filt(fmin1, fmax1,1,5);
Bbp7=Buse_res7.filt(fmin1, fmax1,1,5);
Bbp8=Buse_res8.filt(fmin1, fmax1,1,5);
Bbp9=Buse_res9.filt(fmin1, fmax1,1,5);
Bbp10=Buse_res10.filt(fmin1, fmax1,1,5);
Bbp11=Buse_res11.filt(fmin1, fmax1,1,5);

Int1=TSeries(Bbp1.time,Bbp1.data.^2);
Int2=TSeries(Bbp2.time,Bbp2.data.^2);
Int3=TSeries(Bbp3.time,Bbp3.data.^2);
Int4=TSeries(Bbp4.time,Bbp4.data.^2);
Int5=TSeries(Bbp5.time,Bbp5.data.^2);
Int6=TSeries(Bbp6.time,Bbp6.data.^2);
Int7=TSeries(Bbp7.time,Bbp7.data.^2);
Int8=TSeries(Bbp8.time,Bbp8.data.^2);
Int9=TSeries(Bbp9.time,Bbp9.data.^2);
Int10=TSeries(Bbp10.time,Bbp10.data.^2);
Int11=TSeries(Bbp11.time,Bbp11.data.^2);

tuse1=irf_time(Bbp1.time,'epochtt>epoch');
tuse2=irf_time(Bbp2.time,'epochtt>epoch');
tuse3=irf_time(Bbp3.time,'epochtt>epoch');
tuse4=irf_time(Bbp4.time,'epochtt>epoch');
tuse5=irf_time(Bbp5.time,'epochtt>epoch');
tuse6=irf_time(Bbp6.time,'epochtt>epoch');
tuse7=irf_time(Bbp7.time,'epochtt>epoch');
tuse8=irf_time(Bbp8.time,'epochtt>epoch');
tuse9=irf_time(Bbp9.time,'epochtt>epoch');
tuse10=irf_time(Bbp10.time,'epochtt>epoch');
tuse11=irf_time(Bbp11.time,'epochtt>epoch');

l1=length(tuse1);
l2=length(tuse2);
l3=length(tuse3);
l4=length(tuse4);
l5=length(tuse5);
l6=length(tuse6);
l7=length(tuse7);
l8=length(tuse8);
l9=length(tuse9);
l10=length(tuse10);
l11=length(tuse11);

tuse1(l1+1)=tuse1(end)+24;
t1=tuse1(1):600:tuse1(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l1
    if j1<=length(t1)
        if tuse1(i)<t1(j1) & tuse1(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i1=length(ii)-1;
ea1=0;
for i=1:i1
    E1(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E1(i)=E1(i)+Int1.data(j);
    end
    ea1=ea1+E1(i)/i1;
end

tuse2(l2+1)=tuse2(end)+24;
t1=tuse2(1):600:tuse2(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l2
    if j1<=length(t1)
        if tuse2(i)<t1(j1) & tuse2(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i2=length(ii)-1;
ea2=0;
for i=1:i2
    E2(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E2(i)=E2(i)+Int2.data(j);
    end
    ea2=ea2+E2(i)/i2;
end

tuse3(l3+1)=tuse3(end)+24;
t1=tuse3(1):600:tuse3(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l3
    if j1<=length(t1)
        if tuse3(i)<t1(j1) & tuse3(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i3=length(ii)-1;
ea3=0;
for i=1:i3
    E3(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E3(i)=E3(i)+Int3.data(j);
    end
    ea3=ea3+E3(i)/i3;
end

tuse4(l4+1)=tuse4(end)+24;
t1=tuse4(1):600:tuse4(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l4
    if j1<=length(t1)
        if tuse4(i)<t1(j1) & tuse4(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i4=length(ii)-1;
ea4=0;
for i=1:i4
    E4(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E4(i)=E4(i)+Int4.data(j);
    end
    ea4=ea4+E4(i)/i4;
end

tuse5(l5+1)=tuse5(end)+24;
t1=tuse5(1):600:tuse5(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l5
    if j1<=length(t1)
        if tuse5(i)<t1(j1) & tuse5(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i5=length(ii)-1;
ea5=0;
for i=1:i5
    E5(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E5(i)=E5(i)+Int5.data(j);
    end
    ea5=ea5+E5(i)/i5;
end

tuse6(l6+1)=tuse6(end)+24;
t1=tuse6(1):600:tuse6(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l6
    if j1<=length(t1)
        if tuse6(i)<t1(j1) & tuse6(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i6=length(ii)-1;
ea6=0;
for i=1:i6
    E6(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E6(i)=E6(i)+Int6.data(j);
    end
    ea6=ea6+E6(i)/i6;
end

tuse7(l7+1)=tuse7(end)+24;
t1=tuse7(1):600:tuse7(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l7
    if j1<=length(t1)
        if tuse7(i)<t1(j1) & tuse7(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i7=length(ii)-1;
ea7=0;
for i=1:i7
    E7(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E7(i)=E7(i)+Int7.data(j);
    end
    ea7=ea7+E7(i)/i7;
end

tuse8(l8+1)=tuse8(end)+24;
t1=tuse8(1):600:tuse8(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l8
    if j1<=length(t1)
        if tuse8(i)<t1(j1) & tuse8(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i8=length(ii)-1;
ea8=0;
for i=1:i8
    E8(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E8(i)=E8(i)+Int8.data(j);
    end
    ea8=ea8+E8(i)/i8;
end

tuse9(l9+1)=tuse9(end)+24;
t1=tuse9(1):600:tuse9(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l9
    if j1<=length(t1)
        if tuse9(i)<t1(j1) & tuse9(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i9=length(ii)-1;
ea9=0;
for i=1:i9
    E9(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E9(i)=E9(i)+Int9.data(j);
    end
    ea9=ea9+E9(i)/i9;
end

tuse10(l10+1)=tuse10(end)+24;
t1=tuse10(1):600:tuse10(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l10
    if j1<=length(t1)
        if tuse10(i)<t1(j1) & tuse10(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i10=length(ii)-1;
ea10=0;
for i=1:i10
    E10(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E10(i)=E10(i)+Int10.data(j);
    end
    ea10=ea10+E10(i)/i10;
end

tuse11(l11+1)=tuse11(end)+24;
t1=tuse11(1):600:tuse11(end);
ii=[];ii(1)=1;
j1=2;
for i=1:l11
    if j1<=length(t1)
        if tuse11(i)<t1(j1) & tuse11(i+1)>=t1(j1)
           ii(j1)=i+1;
           j1=j1+1;
        end 
    end
end
i11=length(ii)-1;
ea11=0;
for i=1:i11
    E11(i)=0;
    for j=ii(i):(ii(i+1)-1)
        E11(i)=E11(i)+Int11.data(j);
    end
    ea11=ea11+E11(i)/i11;
end

k=0;
for i=1:i1
    e(i)=E1(i)/ea1;
end
k=k+i1;
for i=k+1:k+i2
    e(i)=E2(i-k)/ea2;
end
k=k+i2;
for i=k+1:k+i3
    e(i)=E3(i-k)/ea3;
end
k=k+i3;
for i=k+1:k+i4
    e(i)=E4(i-k)/ea4;
end
k=k+i4;
for i=k+1:k+i5
    e(i)=E5(i-k)/ea5;
end
k=k+i5;
for i=k+1:k+i6
    e(i)=E6(i-k)/ea6;
end
k=k+i6;
for i=k+1:k+i7
    e(i)=E7(i-k)/ea7;
end
k=k+i7;
for i=k+1:k+i8
    e(i)=E8(i-k)/ea8;
end
k=k+i8;
for i=k+1:k+i9
    e(i)=E9(i-k)/ea9;
end
k=k+i9;
for i=k+1:k+i10
    e(i)=E10(i-k)/ea10;
end
k=k+i10;

for i=k+1:k+i11
    e(i)=E11(i-k)/ea11;
end
k=k+i11;

T=1/6:1/6:k/6;
[pp,ff, pth] = plomb(e,T,1,10,'Pd',0.95);
tt = 1./ff;
subplot(2,1,2);plot(tt,pp);hold on;plot([1 10],[pth pth],'r');
set(gca,'position',[0.2 0.1 0.7 0.3])
xlim([1 10])
title('Galileo period analysis','FontSize',12)
xlabel('period/h')
ylabel('PSD(nT^{2}/Hz)','Position',[0.5 10])