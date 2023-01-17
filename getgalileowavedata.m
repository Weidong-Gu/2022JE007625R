% We use irfu codes in these scripts, please import irfu codes and run irf.m before run these scripts

% All Juno and Galileo data presented here are publicly available from NASAs Planetary Data System (https://pds-ppi.igpp.ucla.edu/). 
% The Juno-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519711
% The Juno-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1520498 
% The Galileo-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/fq45-wv97
% The Galileo-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519682

clear all

[tc1,ts,e,data1]=textread('ORB28_SURVEY_2000_11_22_E.TAB','%s%s%s%[^\n]');
[tc2,ts,e,data2]=textread('ORB28_SURVEY_2000_11_23_E.TAB','%s%s%s%[^\n]');
[tc3,ts,e,data3]=textread('ORB28_SURVEY_2000_11_24_E.TAB','%s%s%s%[^\n]');
[tc4,ts,e,data4]=textread('ORB28_SURVEY_2000_11_25_E.TAB','%s%s%s%[^\n]');
[tc5,ts,e,data5]=textread('ORB28_SURVEY_2000_11_26_E.TAB','%s%s%s%[^\n]');
[tc6,ts,e,data6]=textread('ORB28_SURVEY_2000_11_27_E.TAB','%s%s%s%[^\n]');
[tc7,ts,e,data7]=textread('ORB28_SURVEY_2000_11_28_E.TAB','%s%s%s%[^\n]');
[tc8,ts,e,data8]=textread('ORB28_SURVEY_2000_11_29_E.TAB','%s%s%s%[^\n]');
[tc9,ts,e,data9]=textread('ORB28_SURVEY_2000_11_30_E.TAB','%s%s%s%[^\n]');
[tc10,ts,e,data10]=textread('ORB28_SURVEY_2000_12_01_E.TAB','%s%s%s%[^\n]');
[tc11,ts,e,data11]=textread('ORB28_SURVEY_2000_12_02_E.TAB','%s%s%s%[^\n]');

dataa1=cell2mat(data1);
galileodata1=str2num(dataa1);
dataa2=cell2mat(data2);
galileodata2=str2num(dataa2);
dataa3=cell2mat(data3);
galileodata3=str2num(dataa3);
dataa4=cell2mat(data4);
galileodata4=str2num(dataa4);
dataa5=cell2mat(data5);
galileodata5=str2num(dataa5);
dataa6=cell2mat(data6);
galileodata6=str2num(dataa6);
dataa7=cell2mat(data7);
galileodata7=str2num(dataa7);
dataa8=cell2mat(data8);
galileodata8=str2num(dataa8);
dataa9=cell2mat(data9);
galileodata9=str2num(dataa9);
dataa10=cell2mat(data10);
galileodata10=str2num(dataa10);
dataa11=cell2mat(data11);
galileodata11=str2num(dataa11);

tuse1=[];
for i=1:length(tc1)
a=irf_time([tc1{i}],'utc>tt');
tuse1=[tuse1;a];
end
tuse2=[];
for i=1:length(tc2)
a=irf_time([tc2{i}],'utc>tt');
tuse2=[tuse2;a];
end
tuse3=[];
for i=1:length(tc3)
a=irf_time([tc3{i}],'utc>tt');
tuse3=[tuse3;a];
end
tuse4=[];
for i=1:length(tc4)
a=irf_time([tc4{i}],'utc>tt');
tuse4=[tuse4;a];
end
tuse5=[];
for i=1:length(tc5)
a=irf_time([tc5{i}],'utc>tt');
tuse5=[tuse5;a];
end
tuse6=[];
for i=1:length(tc6)
a=irf_time([tc6{i}],'utc>tt');
tuse6=[tuse6;a];
end
tuse7=[];
for i=1:length(tc7)
a=irf_time([tc7{i}],'utc>tt');
tuse7=[tuse7;a];
end
tuse8=[];
for i=1:length(tc8)
a=irf_time([tc8{i}],'utc>tt');
tuse8=[tuse8;a];
end
tuse9=[];
for i=1:length(tc9)
a=irf_time([tc9{i}],'utc>tt');
tuse9=[tuse9;a];
end
tuse10=[];
for i=1:length(tc10)
a=irf_time([tc10{i}],'utc>tt');
tuse10=[tuse10;a];
end
tuse11=[];
for i=1:length(tc11)
a=irf_time([tc11{i}],'utc>tt');
tuse11=[tuse11;a];
end

dep1=[6; 10; 18; 31; 42; 46; 49; 52; 56; 60; 67; 70; 78; 82; 89; 97; 104; 112];
dep1=[dep1; 121; 129; 137; 150; 159; 172; 186; 201; 216; 236; 252; 268; 291];
dep1=[dep1; 314; 337; 364; 392; 420; 448; 476; 534; 563; 622; 652; 712; 774];
dep1=[dep1; 836; 900; 965; 1031; 1098; 1201; 1272; 1380; 1491; 1606; 1724; 1887];
dep1=[dep1; 2013; 2144; 2325; 2513; 2700; 2910; 3140; 3360; 3580; 3810; 4270];
dep1=[dep1; 4500; 4980; 5210; 5700; 6190; 6690; 7200; 7720; 8250; 8780; 9610];
dep1=[dep1; 10170; 11040; 11930; 12850; 13790; 15090; 16110; 17150; 18590; 20100];
dep1=[dep1; 21600; 23300; 25100; 26900; 28700; 30500; 34200; 36000; 39800; 41700];
dep1=[dep1; 45600; 49500; 53500; 57600; 61700; 66000; 70300; 76900; 81400; 88300];
dep1=[dep1; 95400; 102800; 100800; 113400; 126000; 138600; 151200; 163800; 176400];
dep1=[dep1; 201600; 226800; 252000; 277200; 302400; 327600; 352800; 403200; 453600];
dep1=[dep1; 504000; 554400; 604800; 655200; 705600; 806000; 907000; 1008000; 1109000];
dep1=[dep1; 1210000; 1310000; 1411000; 1613000; 1814000; 2016000; 2218000; 2419000];
dep1=[dep1; 2621000; 2822000; 3226000; 3629000; 4032000; 4435000; 4838000; 5242000; 5645000];
galileodep1=dep1;

l1=length(galileodata1);
l2=length(galileodata2);
l3=length(galileodata3);
l4=length(galileodata4);
l5=length(galileodata5);
l6=length(galileodata6);
l7=length(galileodata7);
l8=length(galileodata8);
l9=length(galileodata9);
l10=length(galileodata10);
l11=length(galileodata11);

galileodep0(1:l1,1)=tuse1(:,1);
galileodep0((l1+1):(l1+l2),1)=tuse2(:,1);
galileodep0((l1+l2+1):(l1+l2+l3),1)=tuse3(:,1);
galileodep0((l1+l2+l3+1):(l1+l2+l3+l4),1)=tuse4(:,1);
galileodep0((l1+l2+l3+l4+1):(l1+l2+l3+l4+l5),1)=tuse5(:,1);
galileodep0((l1+l2+l3+l4+l5+1):(l1+l2+l3+l4+l5+l6),1)=tuse6(:,1);
galileodep0((l1+l2+l3+l4+l5+l6+1):(l1+l2+l3+l4+l5+l6+l7),1)=tuse7(:,1);
galileodep0((l1+l2+l3+l4+l5+l6+l7+1):(l1+l2+l3+l4+l5+l6+l7+l8),1)=tuse8(:,1);
galileodep0((l1+l2+l3+l4+l5+l6+l7+l8+1):(l1+l2+l3+l4+l5+l6+l7+l8+l9),1)=tuse9(:,1);
galileodep0((l1+l2+l3+l4+l5+l6+l7+l8+l9+1):(l1+l2+l3+l4+l5+l6+l7+l8+l9+l10),1)=tuse10(:,1);
galileodep0((l1+l2+l3+l4+l5+l6+l7+l8+l9+l10+1):(l1+l2+l3+l4+l5+l6+l7+l8+l9+l10+l11),1)=tuse11(:,1);

ll=length(dep1);
galileodata(1:l1,1:ll)=galileodata1(:,1:ll);
galileodata((l1+1):(l1+l2),1:ll)=galileodata2(:,1:ll);
galileodata((l1+l2+1):(l1+l2+l3),1:ll)=galileodata3(:,1:ll);
galileodata((l1+l2+l3+1):(l1+l2+l3+l4),1:ll)=galileodata4(:,1:ll);
galileodata((l1+l2+l3+l4+1):(l1+l2+l3+l4+l5),1:ll)=galileodata5(:,1:ll);
galileodata((l1+l2+l3+l4+l5+1):(l1+l2+l3+l4+l5+l6),1:ll)=galileodata6(:,1:ll);
galileodata((l1+l2+l3+l4+l5+l6+1):(l1+l2+l3+l4+l5+l6+l7),1:ll)=galileodata7(:,1:ll);
galileodata((l1+l2+l3+l4+l5+l6+l7+1):(l1+l2+l3+l4+l5+l6+l7+l8),1:ll)=galileodata8(:,1:ll);
galileodata((l1+l2+l3+l4+l5+l6+l7+l8+1):(l1+l2+l3+l4+l5+l6+l7+l8+l9),1:ll)=galileodata9(:,1:ll);
galileodata((l1+l2+l3+l4+l5+l6+l7+l8+l9+1):(l1+l2+l3+l4+l5+l6+l7+l8+l9+l10),1:ll)=galileodata10(:,1:ll);
galileodata((l1+l2+l3+l4+l5+l6+l7+l8+l9+l10+1):(l1+l2+l3+l4+l5+l6+l7+l8+l9+l10+l11),1:ll)=galileodata11(:,1:ll);

%then save galileodata, galileodep0 and galileodep1