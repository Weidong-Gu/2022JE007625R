function read_juno_magfile2,filename,coor=coor
  if ~keyword_set(coor) then coor='ss'
  
  
  ;get the number of lines in file
  n_line=0UL
  n_head=0UL
  n_object=0UL
  n_endobject=0UL
  tmp=''
  openr,lun,filename,/get_lun
  while ~eof(lun) do begin
    n_line=n_line+1UL
    readf,lun,tmp
  endwhile
  close,lun
  free_lun,lun
  
  ; get the number of lines of the HEADER
  openr,lun,filename,/get_lun
  while (n_endobject ne n_object) or (n_object eq 0) do begin
    n_head=n_head+1
    tmp=''
    readf,lun,tmp
    tmp=strsplit(tmp,' ',/extract)
    if tmp[0] eq 'OBJECT' then n_object=n_object+1
    if tmp[0] eq 'END_OBJECT' then n_endobject=n_endobject+1
  endwhile
  close,lun
  free_lun,lun
  
  ; reading the data
  n_cols=[14,11,14,14]
  
  ;formats=['','(2X,I4,1X,I3,1X,I2,1X,I2,1X,I2,1X,I3,F13.9,1X,F12.2,1X,F12.2,1X,F12.2,1X,F3.0)','']
  ;ss/pc: YEAR DOY HOUR MIN SEC MSEC  DECIMAL_DAY  BX  BY BZ RANGE X Y Z
  ;pl: YEAR DOY HOUR MIN SEC MSEC  DECIMAL_DAY  BX  BY BZ RANGE
  
  ;BX BY BZ in nT ; X Y Z in km
  
  index=0
  case strlowcase(coor) of
    'full': index=3
    'ss': index=0
    'pl': index=1
    'pc': index=2
    else : begin
      print,'!!!   There is no coordinate named as '+coor+'.'       ;print,'!!!   There is no coordinate named as '+coor+'. Using the default coordinate of "ss".'
      return, -1
    end
  endcase
  
  data=dblarr(n_cols[index],n_line-n_head)
  
  tmp=''
  openr,lun,filename,/get_lun
  for i_tmp=1,n_head do  readf,lun,tmp
 ;   if i_tmp le n_line-n_head-1 then begin           ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;new by XY
       readf,lun,data;,format=formats[index]
                                            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;new by XY
  close,lun
  free_lun,lun
  
  return,data
  
end

function read_juno_mag2,filename,coor=coor,sod=sec_of_day,time_str=time_str,Bv=Bv,Pos=Pos,to_tplot=to_tplot,tvarB_name=tvarB_name,tvarP_name=tvarP_name
  if ~keyword_set(coor) then coor='ss'
  if (strlowcase(coor) ne 'ss') and (strlowcase(coor) ne 'pl') and (strlowcase(coor) ne 'pc') then return,-1
  data=read_juno_magfile2(filename,coor=coor)
  
  
  ; re-arrange data
  days_of_year=timegen(366,units='Days',start=julday(1,1,data[0,0]))
  
  caldat,julday(1,1,data[0,*])+data[1,*]-1,month,day,year
  
  hour=data[2,*]
  minute=data[3,*]
  second=data[4,*]
  millisecond=data[5,*]
  
  time_jul=julday(month,day,year,hour,minute,second)+millisecond/1000./3600./24.
  sec_of_day=hour*3600.+minute*60.+second+millisecond/1000.
  time_str=string(year,format='(I04)')+'-'+string(month,format='(I02)')+'-'+string(day,format='(I02)')+'/'+$
    string(hour,format='(I02)')+':'+string(minute,format='(I02)')+':'+string(second,format='(I02)')+'.'+string(millisecond,format='(I03)')
    
  ;DECIMAL_DAY=data[6,*]
  
  Bv=data[7:9,*]
  ;range=data[10,*]
  if coor ne 'pl' then Pos=data[11:13,*]
  
  if keyword_set(to_tplot) then begin
    if not keyword_set(tvarB_name) then tvarB_name='juno_Bv_'+coor+'_'+string(year,format='(I04)')+'-'+string(month,format='(I02)')+'-'+string(day,format='(I02)')
    if not keyword_set(tvarP_name) then tvarP_name='juno_Pos_'+coor+'_'+string(year,format='(I04)')+'-'+string(month,format='(I02)')+'-'+string(day,format='(I02)')
    dlimits={spec:0,xlog:0,ylog:0,colors:[2,4,6],ytitle:'JUNO!cB @ '+strupcase(coor),labels:['Bx','By','Bz'],ysubtitle:'(nT)',data_att:{coord_sys:coor,units:'nT'}}
    dlimits_pos={spec:0,xlog:0,ylog:0,colors:[2,4,6],ytitle:'JUNO!cPOS @ '+strupcase(coor),labels:['X','Y','Z'],ysubtitle:'(km)',data_att:{coord_sys:coor,units:'km'}}
    store_data,tvarB_name,time_double(time_str),transpose(Bv),[1,2,3],dlimit=dlimits
    if coor ne 'pl' then store_data,tvarP_name,time_double(time_str),transpose(Pos),[1,2,3],dlimit=dlimits_pos
  endif
  
  return,time_jul
  
end

function get_juno_magfiles2,path,syear,smon,sday,eyear,emon,eday,coor=coor,res=reslution,n_files=counts
  if not keyword_set(reslution) then reslution='full'
  if not keyword_set(coor) then coor='ss'
  sdate=julday(smon,sday,syear)
  edate=julday(emon,eday,eyear)
  n_days=edate-sdate+1
  times=timegen(n_days,unit='Days',start=sdate)
  caldat,times,mons,days,years
  doys=fix(times-julday(1,1,years))+1
  date_doy_strs=string(years,format='(I04)')+string(doys,format='(I03)')
  files='fgm_jno_l3_'+date_doy_strs+coor+'_r'+reslution+'_v*.sts'
  if strlowcase(reslution) eq 'full' then files='fgm_jno_l3_'+date_doy_strs+coor+'_v*.sts'
;  files='fgm_jno_l3_'+date_doy_strs+coor+'_pj??_r'+reslution+'_v*.sts'
;  if strlowcase(reslution) eq 'full' then files='fgm_jno_l3_'+date_doy_strs+coor+'_pj??_v*.sts'
  filenames=file_search(path+files,count=counts)
  if counts le 0 then begin
    print,'!!! no mag files in the date inverval of '+date_doy_strs[0]+' to '+date_doy_strs[n_days-1]
    return,-1
  endif else begin
    return,filenames
  endelse
  
end

function juno_load_mag_data2,syear,smon,sday,eyear,emon,eday,path=path,coor=coor,res=reslution,sod=sod,time_str=time_str,Bv=Bv,Pos=Pos,filenames=filenames
  if not keyword_set(reslution) then reslution='full'
  if not keyword_set(coor) then coor='ss'
  if not keyword_set(path) then path='/Users/grl/Downloads/JNO-J-3-FGM-CAL-V1.0/'
  
  if not keyword_set(filenames) then begin
    print,'searching file ...'
    
    filenames=get_juno_magfiles2(path,syear,smon,sday,eyear,emon,eday,coor=coor,res=reslution,n_files=n_files)
  endif else begin
    n_files=n_elements(filenames)
  endelse
  
  if n_files le 0 then begin
    return,-1
  endif else begin
  
  time_jul=[]
  Bv=[]
  Pos=[]
  time_str=[]
  sod=[]
  for i_f=0,n_files-1 do begin
    print,'Loding data from  '+filenames[i_f]+'  ... ...'
    ttmp=read_juno_mag2(filenames[i_f],coor=coor,sod=sodtmp,time_str=time_strtmp,Bv=Bvtmp,Pos=Postmp)
    time_jul=[[time_jul],[ttmp]]
    Bv=[[Bv],[Bvtmp]]
    sod=[[sod],[sodtmp]]
    time_str=[time_str,time_strtmp]
    if coor ne 'pl' then Pos=[[Pos],[Postmp]]
  endfor
  
  return,time_jul
  endelse
  
end

pro read_mag_juno_ss_full2,tr=tr,path=path,coor=coor,res=reslution,nofile=nofile,filenames=filenames
  if not keyword_set(reslution) then reslution='full' ; '1s' '60s'
  if not keyword_set(coor) then coor='ss'
  if not keyword_set(path) then path='/Users/grl/Downloads/JNO-J-3-FGM-CAL-V1.0/'
  
  if not keyword_set(tr) then  get_timespan,tr
  
  stime=time_struct(tr[0])
  etime=time_struct(tr[1])
  syear=stime.YEAR
  smon=stime.MONTH
  sday=stime.DATE
  eyear=etime.YEAR
  emon=etime.MONTH
  eday=etime.DATE
  
  time_jul=juno_load_mag_data2(syear,smon,sday,eyear,emon,eday,path=path,coor=coor,res=reslution,sod=sod,time_str=time_str,Bv=Bv,Pos=Pos,filenames=filenames)
 if time_jul[0] ne -1 then begin
  nofile=0
  print,'Converting to tplot variables ... ...'
  dlimits={spec:0,xlog:0,ylog:0,colors:[2,4,6],ytitle:'JUNO!cB @ '+strupcase(coor),labels:['Bx','By','Bz'],ysubtitle:'(nT)',data_att:{coord_sys:coor,units:'nT'}}
  dlimits_pos={spec:0,xlog:0,ylog:0,colors:[2,4,6],ytitle:'JUNO!cPOS @ '+strupcase(coor),labels:['X','Y','Z'],ysubtitle:'(km)',data_att:{coord_sys:coor,units:'km'}}
  store_data,'juno_B'+reslution+'_'+coor,time_double(time_str),transpose(Bv),[1,2,3],dlimit=dlimits
  if coor ne 'pl' then store_data,'juno_Pos'+reslution+'_'+coor,time_double(time_str),transpose(Pos),[1,2,3],dlimit=dlimits_pos
 endif else begin
  nofile=1 ;the file is not exist
 endelse
  ;stop
end