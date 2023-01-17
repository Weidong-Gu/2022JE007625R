pro PROSESSING_MAG_PDS_TO_TVAR_SS_JSS_RTP


;tvarpath='Z:\Downloads\magfulltvar\'
;datapath='Z:\mnt\megadata\Public\CO-E_SW_J_S-MAG-3-RDR-FULL-RES-2016\'

;datapath='/LPAP/home/guo/PDS/MAG_SS/'
;tvarpath='/LPAP/home/guo/PDS/juno_magtvar/'
;datapath='C:\Users\grl\Documents\data\JUNO_FGM_PJ\'
;tvarpath='C:\Users\grl\Documents\data\JUNO_FGM_PJ_tvar\'
;for i_path=0,26 do begin
;for i_path=27,28 do begin

;datapath='/Volumes/Elements/juno/FGM/DATA/JUPITER/SS/PERI-'+strtrim(string(i_path,format='(I02)'))+'/'
;tvarpath='/Users/grl/Documents/results/mag_tvar/'
;tvarpath='/Volumes/Elements/juno/magtvar/'

;datapath='/Users/grl/Downloads/PERI-'+strtrim(string(i_path,format='(I02)'))+'/'
;tvarpath='/Users/grl/Documents/results/mag_tvar/'
;tvarpath='/Users/grl/Downloads/newjuno/magtvar/'

;datapath='\\vmware-host\Shared Folders\stage\PDS\juno\FGM28\
;tvarpath='\\vmware-host\Shared Folders\stage\PDS\juno\newtvar\magtvar28\'
datapath='E:\juno\juno_magtest\'
tvarpath='E:\juno\juno_magtvar\'

if not file_test(tvarpath+'MAG_SS_1s/',/directory) then file_mkdir,tvarpath+'MAG_SS_1s/'
if not file_test(tvarpath+'MAG_SS_60s/',/directory) then file_mkdir,tvarpath+'MAG_SS_60s/'
if not file_test(tvarpath+'MAG_SS_FULL/',/directory) then file_mkdir,tvarpath+'MAG_SS_FULL/'
if not file_test(tvarpath+'MAG_JSS_1s/',/directory) then file_mkdir,tvarpath+'MAG_JSS_1s/'
if not file_test(tvarpath+'MAG_JSS_60s/',/directory) then file_mkdir,tvarpath+'MAG_JSS_60s/'
if not file_test(tvarpath+'MAG_JSS_FULL/',/directory) then file_mkdir,tvarpath+'MAG_JSS_FULL/'

;  cspice_furnsh, '/LPAP/home/guo/idl_library/myprogram/for_tdas/juno/generic_kernels_juno.mk' ;the .mk ASCII file need to be modified
;cspice_furnsh, 'C:\Users\grl\OneDrive\work\study\lib_grl\program_idl\library\myprogram\for_tdas\juno\generic_kernels_juno_local.mk'
;default_dirs,ddir
;onedrive_dir=ddir.onedrive_dir
;
;tmp=where(strmatch(tag_names(ddir),'mkfile',/fold_case),cnt)
;if cnt eq 0 then begin
;  if strupcase(strmid(!version.os_name,0,3)) eq 'MAC' then begin
;    mkfile=onedrive_dir+change_path_sep('work\study\lib_grl\program_idl\library\myprogram\for_tdas\juno\generic_kernels_juno_mac.mk')
;  endif else begin
;    mkfile=onedrive_dir+change_path_sep('work\study\lib_grl\program_idl\library\myprogram\for_tdas\juno\generic_kernels_juno_local.mk')
;  endelse
;endif else begin
;  mkfile=ddir.mkfile
;endelse

cspice_furnsh, 'H:\data substitute\Juno\juno2\juno\generic_kernels_juno_local.mk'


;target=599 ;jupiter
frame='JUNO_JSO'

isfullJSS=0

fns=file_search(datapath+'fgm_jno_l3*.sts',count=nf)
print,nf,'   files'

if nf ge 1 then begin
  for i_f=0,nf-1 do begin
  ;  print,i_f
    del_data,'*'
    filename=fns[i_f]
    ftmp=strsplit(filename,'\',/extract,count=ntmp)
    segtmp=strsplit(ftmp[ntmp-1],'_',/extract,count=nseg)
    date=segtmp[3]
    year=strmid(date,0,4)
    doy=strmid(date,4,3)
    type=segtmp[4]
    if strmid(type,0,1) eq 'p' then begin
      pjsuff=type+'_'
      type=segtmp[5]
    endif else begin
      pjsuff=''
    endelse
    
    if strmid(type,0,1) eq 'v' then begin
      ressuff=''
      res='full'
      resdir='FULL'
    endif else begin
      if strmid(type,0,1) eq 'r' then begin
        typetmp=strsplit(type,'r',/extract)
      ressuff=typetmp[0]+'_'
      res=typetmp[0]
      resdir=typetmp[0]
      endif else begin
        dprint,'Wrong data file name!!!'
      endelse
      
    endelse
    
    datetmp=time_string(time_double(year+'-'+doy+'/00',tformat='YYYY-DOY'),tformat='YYYY-MM-DD')
    tr=datetmp+['/00:00:00.000','/23:59:59.999999']
    tnss='JUNO_MAG_SS_FULL_'+ressuff+pjsuff+time_string(datetmp,tformat='YYYY_MM_DD')
    file=file_search(tvarpath+tnss+'.tplot')
    read_mag_juno_ss_full2,tr=tr,path=datapath,nofile=nofile,res=res,filename=filename
    if nofile ne 1 then begin
      tplot_save,'juno_*',filename=tvarpath+'MAG_SS_'+resdir+'/'+tnss
       print,'file saved at: '+tvarpath+'MAG_SS_'+resdir+'/'+tnss
      
      ;; to JSS and RTP
      
     if not ((isfullJSS eq 0) and (res eq 'full')) then begin
      
      get_data,'juno_B'+strlowcase(res)+'_ss',data=juno_B
      juno_B_time=time_string(juno_B.x,tformat='YYYY-MM-DD/hh:mm:ss.fff')
      
      
      et=dblarr(n_elements(juno_B_time))
      cspice_str2et, juno_B_time,et
      cspice_spkpos, 'Juno', et, frame, 'NONE', 'JUPITER BARYCENTER', pos, ltime
      cspice_pxform,'JUNO_JSO','JUNO_JSS',et,mat
      mat_jso2jss=transpose(mat,[2,1,0])
      store_data,'JSO2JSS_mat',data={x:juno_B.x,y:mat_jso2jss,v:[0,1,2]}
      tvector_rotate,'JSO2JSS_mat','juno_B'+strlowcase(res)+'_ss',newname='juno_B'+strlowcase(res)+'_JSS'
      tvector_rotate,'JSO2JSS_mat','juno_Pos'+strlowcase(res)+'_ss',newname='juno_Pos'+strlowcase(res)+'_JSS'
      
      pos=transpose(pos)
      
      get_data,'juno_B'+strlowcase(res)+'_JSS',data=juno_JSS
      get_data,'juno_Pos'+strlowcase(res)+'_JSS',data=juno_position_JSS
      jR=sqrt(juno_position_JSS.y[*,0]^2+juno_position_JSS.y[*,1]^2+juno_position_JSS.y[*,2]^2)
      jtheta=acos(juno_position_JSS.y[*,2]/jR)
      jphi=atan(juno_position_JSS.y[*,1],juno_position_JSS.y[*,0])
      JSS_lat=(!pi/2-jtheta)*180./!pi
      JSS_LT=24.*(jphi+!pi)/2/!pi
      
      Br=dblarr(n_elements(juno_JSS.x))
      Btheta=dblarr(n_elements(juno_JSS.x))
      Bphi=dblarr(n_elements(juno_JSS.x))
      
      for i=0, n_elements(juno_JSS.x)-1 do begin
        if jphi[i] lt 0. then jphi[i]=2.*!pi+jphi[i]
        Br[i]=juno_JSS.y[i,0]*cos(jphi[i])*sin(jtheta[i])+juno_JSS.y[i,1]*sin(jphi[i])*sin(jtheta[i])+juno_JSS.y[i,2]*cos(jtheta[i])
        Btheta[i]=juno_JSS.y[i,0]*cos(jphi[i])*cos(jtheta[i])+juno_JSS.y[i,1]*sin(jphi[i])*cos(jtheta[i])-juno_JSS.y[i,2]*sin(jtheta[i])
        Bphi[i]=-1.*juno_JSS.y[i,0]*sin(jphi[i])+juno_JSS.y[i,1]*cos(jphi[i])
      endfor
      ;JRTP is the same as KRTP, R is from Jupiter center to the Juno, Phi is opposite to jupiter's motion, theta is southward
      ;Btheta=Btheta
      ;Bphi=Bphi
      
      BRTP=[[Br],[Btheta],[Bphi]]
      dlimits={spec:0,xlog:0,ylog:0,colors:[2,4,6],ytitle:'JUNO_RTP',labels:['Br','Btheta','Bphi'],ysubtitle:'(nT)',data_att:{coord_sys:'rtp',units:'nT'}}
      store_data,'juno_B'+strlowcase(res)+'_JSSRTP',data={x:juno_JSS.x,y:BRTP},dlimits=dlimits
      store_data,'juno_Lat'+strlowcase(res)+'_JSS',data={x:juno_JSS.x,y:JSS_lat}
      store_data,'juno_LT'+strlowcase(res)+'_JSS',data={x:juno_JSS.x,y:JSS_LT}
      tvectot,'juno_B'+strlowcase(res)+'_JSSRTP',tot='juno_Btot'
      
      del_data,'*_ss'
      if res eq 'FULL' or res eq '1s' then del_data,'JSO2JSS_mat'
      tnJSS='JUNO_MAG_JSS_'+ressuff+pjsuff+time_string(juno_B.x[1],tformat='YYYY_MM_DD')
      ;      tnJSS='JUNO_MAG_JSS_'+res+'_pj_'+time_string(juno_B.x[1],tformat='YYYY_MM_DD')
      tplot_save,'*',filename=tvarpath+'MAG_JSS_'+resdir+'/'+tnJSS
      ;      tplot_save,'*',filename=tvarpath+tnJSS
      print,'file saved at: '+tvarpath+'MAG_JSS_'+resdir+'/'+tnJSS
      
     endif
      
    endif
    
    
    
  endfor
endif

;endfor ;i_path

cspice_unload, 'H:\data substitute\Juno\juno2\juno\generic_kernels_juno_local.mk'
end