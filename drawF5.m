% We use irfu codes in these scripts, please import irfu codes and run irf.m before run these scripts

% All Juno and Galileo data presented here are publicly available from NASAs Planetary Data System (https://pds-ppi.igpp.ucla.edu/). 
% The Juno-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519711
% The Juno-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1520498 
% The Galileo-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/fq45-wv97
% The Galileo-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519682

clear all

% Data loaded here is managed before used. ~total is data of the whole time which Juno has observed. 

load('xtotal.mat')
load('ytotal.mat')

timedur1 = '2016-11-08T12:00:00Z/2016-11-11T02:00:00Z';
tint1 = irf.tint(timedur1);
xj1 = xtotal.tlim(tint1);
yj1 = ytotal.tlim(tint1);
timedur2 = '2016-11-12T00:00:00Z/2016-11-13T01:00:00Z';
tint2 = irf.tint(timedur2);
xj2 = xtotal.tlim(tint2);
yj2 = ytotal.tlim(tint2);
timedur3 = '2016-11-21T23:00:00Z/2016-11-23T16:00:00Z';
tint3 = irf.tint(timedur3);
xj3 = xtotal.tlim(tint3);
yj3 = ytotal.tlim(tint3);
timedur4 = '2017-01-24T18:00:00Z/2017-01-25T19:00:00Z';
tint4 = irf.tint(timedur4);
xj4 = xtotal.tlim(tint4);
yj4 = ytotal.tlim(tint4);
timedur5 = '2017-02-19T06:00:00Z/2017-02-21T01:00:00Z';
tint5 = irf.tint(timedur5);
xj5 = xtotal.tlim(tint5);
yj5 = ytotal.tlim(tint5);
timedur6 = '2017-04-08T15:00:00Z/2017-04-09T11:00:00Z';
tint6 = irf.tint(timedur6);
xj6 = xtotal.tlim(tint6);
yj6 = ytotal.tlim(tint6);
timedur7 = '2017-05-05T14:00:00Z/2017-05-07T01:00:00Z';
tint7 = irf.tint(timedur7);
xj7 = xtotal.tlim(tint7);
yj7 = ytotal.tlim(tint7);
timedur8 = '2017-06-16T08:00:00Z/2017-06-17T14:00:00Z';
tint8 = irf.tint(timedur8);
xj8 = xtotal.tlim(tint8);
yj8 = ytotal.tlim(tint8);
timedur9 = '2017-06-18T09:00:00Z/2017-06-19T05:00:00Z';
tint9 = irf.tint(timedur9);
xj9 = xtotal.tlim(tint9);
yj9 = ytotal.tlim(tint9);
timedur10 = '2017-10-01T06:00:00Z/2017-10-02T18:00:00Z';
tint10 = irf.tint(timedur10);
xj10 = xtotal.tlim(tint10);
yj10 = ytotal.tlim(tint10);

[tc1,ts,bx,by,bz,b,x1,y1,z,localtime]=textread('ORB28A_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');
[tc2,ts,bx,by,bz,b,x2,y2,z,localtime]=textread('ORB28B_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');
[tc3,ts,bx,by,bz,b,x3,y3,z,localtime]=textread('ORB29_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');
[tc4,ts,bx,by,bz,b,x4,y4,z,localtime]=textread('ORB32_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');
[tc5,ts,bx,by,bz,b,x5,y5,z,localtime]=textread('ORB33_JSE.TAB','%s%s%f%f%f%f%f%f%f%f');

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

xx1=TSeries(tt1,x1);
xx2=TSeries(tt2,x2);
xx3=TSeries(tt3,x3);
xx4=TSeries(tt4,x4);
xx5=TSeries(tt5,x5);
yy1=TSeries(tt1,y1);
yy2=TSeries(tt2,y2);
yy3=TSeries(tt3,y3);
yy4=TSeries(tt4,y4);
yy5=TSeries(tt5,y5);

timedur1 = '2000-05-29T15:00:00Z/2000-05-30T17:00:00Z';
tint1 = irf.tint(timedur1);
xg1 = xx1.tlim(tint1);
yg1 = yy1.tlim(tint1);
timedur2 = '2000-06-03T18:00:00Z/2000-06-05T19:00:00Z';
tint2 = irf.tint(timedur2);
xg2 = xx1.tlim(tint2);
yg2 = yy1.tlim(tint2);
timedur3 = '2000-06-10T07:00:00Z/2000-06-11T15:00:00Z';
tint3 = irf.tint(timedur3);
xg3 = xx1.tlim(tint3);
yg3 = yy1.tlim(tint3);
timedur4 = '2000-11-24T06:00:00Z/2000-11-30T15:00:00Z';
tint4 = irf.tint(timedur4);
xg4 = xx2.tlim(tint4);
yg4 = yy2.tlim(tint4);
timedur5 = '2000-12-04T22:00:00Z/2000-12-06T09:00:00Z';
tint5 = irf.tint(timedur5);
xg5 = xx2.tlim(tint5);
yg5 = yy2.tlim(tint5);
timedur6 = '2000-12-11T10:00:00Z/2000-12-12T10:00:00Z';
tint6 = irf.tint(timedur6);
xg6 = xx2.tlim(tint6);
yg6 = yy2.tlim(tint6);
timedur7 = '2001-01-10T21:00:00Z/2001-01-12T06:00:00Z';
tint7 = irf.tint(timedur7);
xg7 = xx3.tlim(tint7);
yg7 = yy3.tlim(tint7);
timedur8 = '2001-01-19T13:00:00Z/2001-01-20T14:00:00Z';
tint8 = irf.tint(timedur8);
xg8 = xx3.tlim(tint8);
yg8 = yy3.tlim(tint8);
timedur9 = '2001-01-21T04:00:00Z/2001-01-23T02:00:00Z';
tint9 = irf.tint(timedur9);
xg9 = xx3.tlim(tint9);
yg9 = yy3.tlim(tint9);
timedur10 = '2002-01-05T07:00:00Z/2002-01-06T20:00:00Z';
tint10 = irf.tint(timedur10);
xg10 = xx4.tlim(tint10);
yg10 = yy4.tlim(tint10);
timedur11 = '2002-10-31T20:00:00Z/2002-11-01T17:00:00Z';
tint11 = irf.tint(timedur11);
xg11 = xx5.tlim(tint11);
yg11 = yy5.tlim(tint11);

lj1=length(xj1.data);
lj2=length(xj2.data);
lj3=length(xj3.data);
lj4=length(xj4.data);
lj5=length(xj5.data);
lj6=length(xj6.data);
lj7=length(xj7.data);
lj8=length(xj8.data);
lj9=length(xj9.data);
lj10=length(xj10.data);

k=0;
for i=1:lj1
    xj(i)=xj1.data(i-k);
    yj(i)=yj1.data(i-k);
end
k=k+lj1;
for i=k+1:k+lj2
    xj(i)=xj2.data(i-k);
    yj(i)=yj2.data(i-k);
end
k=k+lj2;
for i=k+1:k+lj3
    xj(i)=xj3.data(i-k);
    yj(i)=yj3.data(i-k);
end
k=k+lj3;
for i=k+1:k+lj4
    xj(i)=xj4.data(i-k);
    yj(i)=yj4.data(i-k);
end
k=k+lj4;
for i=k+1:k+lj5
    xj(i)=xj5.data(i-k);
    yj(i)=yj5.data(i-k);
end
k=k+lj5;
for i=k+1:k+lj6
    xj(i)=xj6.data(i-k);
    yj(i)=yj6.data(i-k);
end
k=k+lj6;
for i=k+1:k+lj7
    xj(i)=xj7.data(i-k);
    yj(i)=yj7.data(i-k);
end
k=k+lj7;
for i=k+1:k+lj8
    xj(i)=xj8.data(i-k);
    yj(i)=yj8.data(i-k);
end
k=k+lj8;
for i=k+1:k+lj9
    xj(i)=xj9.data(i-k);
    yj(i)=yj9.data(i-k);
end
k=k+lj9;
for i=k+1:k+lj10
    xj(i)=xj10.data(i-k);
    yj(i)=yj10.data(i-k);
end
k=k+lj10;
atest1=k-lj1-lj2-lj3-lj4-lj5-lj6-lj7-lj8-lj9-lj10;

lg1=length(xg1.data);
lg2=length(xg2.data);
lg3=length(xg3.data);
lg4=length(xg4.data);
lg5=length(xg5.data);
lg6=length(xg6.data);
lg7=length(xg7.data);
lg8=length(xg8.data);
lg9=length(xg9.data);
lg10=length(xg10.data);
lg11=length(xg11.data);
k=0;
for i=1:lg1
    xg(i)=xg1.data(i-k);
    yg(i)=yg1.data(i-k);
end
k=k+lg1;
for i=k+1:k+lg2
    xg(i)=xg2.data(i-k);
    yg(i)=yg2.data(i-k);
end
k=k+lg2;
for i=k+1:k+lg3
    xg(i)=xg3.data(i-k);
    yg(i)=yg3.data(i-k);
end
k=k+lg3;
for i=k+1:k+lg4
    xg(i)=xg4.data(i-k);
    yg(i)=yg4.data(i-k);
end
k=k+lg4;
for i=k+1:k+lg5
    xg(i)=xg5.data(i-k);
    yg(i)=yg5.data(i-k);
end
k=k+lg5;
for i=k+1:k+lg6
    xg(i)=xg6.data(i-k);
    yg(i)=yg6.data(i-k);
end
k=k+lg6;
for i=k+1:k+lg7
    xg(i)=xg7.data(i-k);
    yg(i)=yg7.data(i-k);
end
k=k+lg7;
for i=k+1:k+lg8
    xg(i)=xg8.data(i-k);
    yg(i)=yg8.data(i-k);
end
k=k+lg8;
for i=k+1:k+lg9
    xg(i)=xg9.data(i-k);
    yg(i)=yg9.data(i-k);
end
k=k+lg9;
for i=k+1:k+lg10
    xg(i)=xg10.data(i-k);
    yg(i)=yg10.data(i-k);
end
k=k+lg10;
for i=k+1:k+lg11
    xg(i)=xg11.data(i-k);
    yg(i)=yg11.data(i-k);
end
k=k+lg11;
atest2=k-lg1-lg2-lg3-lg4-lg5-lg6-lg7-lg8-lg9-lg10-lg11;

theta=-0.9*pi:0.01*pi:0.9*pi;
rmp=76.*((2./(1.+cos(theta))).^0.559);
rbs=100.*(1.74./(1.+0.74.*cos(theta)));
xmp=rmp.*cos(theta);
ymp=rmp.*sin(theta);
xbs=rbs.*cos(theta);
ybs=rbs.*sin(theta);

f=figure('Position',[400 50 400 700]);
h=axes('Position',[0.2 0.1 0.7 0.8]);
plot(h,xmp,ymp,'k');hold on;
plot(h,xbs,ybs,'r');hold on;
xlim(h,[-100 100]);
ylim(h,[-200 200]);
scatter(h,xj,yj,25,'b','filled');hold on;
scatter(h,xg,yg,25,'m','filled');hold on;
scatter(h,1,1,100,'k','filled')
legend('magnetopause(solar wind P_{d}=0.09nPa)','bow shock(solar wind P_{d}=0.09nPa)','Juno','Galileo','Jupiter')
xlabel('x/R_{j}')
ylabel('y/R_{j}')
title('Locations of Satellites in Magnetosheath','Fontsize',15)