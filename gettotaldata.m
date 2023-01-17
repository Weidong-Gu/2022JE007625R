% We use irfu codes in these scripts, please import irfu codes and run irf.m before run these scripts

% All Juno and Galileo data presented here are publicly available from NASAs Planetary Data System (https://pds-ppi.igpp.ucla.edu/). 
% The Juno-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519711
% The Juno-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1520498 
% The Galileo-MAG dataset is from NASA Planetary Data System. https://doi.org/10.17189/fq45-wv97
% The Galileo-Wave dataset is from NASA Planetary Data System. https://doi.org/10.17189/1519682

%you can use prosessing_mag_pds_to_tvar_ss_jss_rtp.pro in IDL to deal with data load from pds
%you will get data in JSS coordinate
%you should change file path when using prosessing_mag_pds_to_tvar_ss_jss_rtp.pro
%put all the data and all the time together, you will get the total data
%there is an example below
%rdata is all the r data
%rtime is all the r time

rtotal = TSeries(rtime,rdata);

%there are many ways to put all data togethere, so there is no example here
