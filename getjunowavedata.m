% We use irfu codes in these scripts, please import irfu codes and run irf.m before run these scripts

% All Juno and Galileo data presented here are publicly available from NASAs Planetary Data System (https://pds-ppi.igpp.ucla.edu/). 
% The Juno-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519711
% The Juno-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1520498 
% The Galileo-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/fq45-wv97
% The Galileo-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519682

clear all

aa1=xlsread('WAV_2016312T000000_E_V02.CSV');
aa2=xlsread('WAV_2016313T000000_E_V02.CSV');
aa3=xlsread('WAV_2016314T000000_E_V02.CSV');
aa4=xlsread('WAV_2016315T000000_E_V02.CSV');
aa5=xlsread('WAV_2016316T000000_E_V02.CSV');

llt1=length(aa1(:,1));
llt2=length(aa2(:,1));
llt3=length(aa3(:,1));
llt4=length(aa4(:,1));
llt5=length(aa5(:,1));

junodep0(1:(llt1-5),1)=aa1(6:end,1);
junodep0((llt1-4):(llt1+llt2-10),1)=aa2(6:end,1);
junodep0((llt1+llt2-9):(llt1+llt2+llt3-15),1)=aa3(6:end,1);
junodep0((llt1+llt2+llt3-14):(llt1+llt2+llt3+llt4-20),1)=aa4(6:end,1);
junodep0((llt1+llt2+llt3+llt4-19):(llt1+llt2+llt3+llt4+llt5-25),1)=aa5(6:end,1);

junodep1=aa1(4,29:end);
ll=length(junodep1);

junodata(1:(llt1-5),1:ll)=aa1(6:end,29:end);
junodata((llt1-4):(llt1+llt2-10),1:ll)=aa2(6:end,29:end);
junodata((llt1+llt2-9):(llt1+llt2+llt3-15),1:ll)=aa3(6:end,29:end);
junodata((llt1+llt2+llt3-14):(llt1+llt2+llt3+llt4-20),1:ll)=aa4(6:end,29:end);
junodata((llt1+llt2+llt3+llt4-19):(llt1+llt2+llt3+llt4+llt5-25),1:ll)=aa5(6:end,29:end);

%then save junodata, junodep0 and junodep1