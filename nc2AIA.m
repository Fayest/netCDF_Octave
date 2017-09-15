function nc2AIA(file,outputfolder, maxlon, maxlat, minlon, minlat,syf,eyf,name)
%-------------------------------------------------------------------------------
%by Muhammad Nafayest
% I.Description
%   read data GCM with netcdf formatted data and convert to arc info ascii (.asc)
% II. variable description
%   1. file         : saved file .mat
%   2. syf          : start year
%   3. eyf          : end year
%   4. minlon/maxlon: minimum/maximum longitude
%   5. minlat/maxlat: minimum/maximum latitude
%   6. outputfolder : folder that contain the output
%   7. name : name of your data (e.g your data name is 
%      csiromk36-rcp45-dd-pr-tas-t2m.200604.nc you only need to write 
%      name='csiromk36-rcp45-dd-pr-tas-t2m.')
% III Output
%     arc info ascii data outputfolder/RAIN_yyyymmdd000000.asc
  load(file)
  %koordinat location ============================================================
  lc = [pwd,'/data/',name,num2str(syf),'0',num2str(1),'.nc'];
  lonn=ncread(lc,'lon');
  latt=ncread(lc,'lat');
  cs=lonn(2)-lonn(1); %cellsize
  %lower bound
  llon=round((minlon-lonn(1))/(lonn(2)-lonn(1)));
  llat=round((minlat-latt(1))/(latt(2)-latt(1)));
  %upper bound
  ulon=round((maxlon-lonn(1))/(lonn(2)-lonn(1)));
  ulat=round((maxlat-latt(1))/(latt(2)-latt(1)));
  %creat bound for lon & lat
  lon= [llon:ulon];
  lat= [llat:ulat];
  llo= length(lon);
  lla= length(lat);
  %===============================================================================
  h=waitbar(0,'converting the data to arch info ascii...');
  for i =syf:eyf
    for j=1:12
      if j<10         %IF1
        if (j==1 || j==3 || j==5 || j==7 || j==8 || j==10 || j==12)  
          for k=1:31
            if k<10
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ',num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),'0',num2str(j),'0',num2str(k),'000000.asc'],'w');
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t', 'precision', 6)
              fclose(fid);
            else
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),'0',num2str(j),num2str(k),'000000.asc'],'w');
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            end
          end
        elseif j==2
          for k =1:28
            if k<10
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),'0',num2str(j),'0',num2str(k),'000000.asc'],'w');       
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            else
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),'0',num2str(j),num2str(k),'000000.asc'],'w');          
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            end
          end
        else
          for k =1:30
            if k<10
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),'0',num2str(j),'0',num2str(k),'000000.asc'],'w');         
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            else
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),'0',num2str(j),num2str(k),'000000.asc'],'w');         
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            end
          end
        end
      else
        if (j==1 || j==3 || j==5 || j==7 || j==8 || j==10 || j==12)  
          for k=1:31
            if k<10
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),num2str(j),'0',num2str(k),'000000.asc'],'w');        
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            else
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),num2str(j),num2str(k),'000000.asc'],'w');          
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            end
          end
        elseif j==2
          for k =1:28
            if k<10
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),num2str(j),'0',num2str(k),'000000.asc'],'w');         
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            else
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),num2str(j),num2str(k),'000000.asc'],'w');          
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            end
          end
        else
          for k =1:30
            if k<10
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),num2str(j),'0',num2str(k),'000000.asc'],'w');         
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=transpose(squeeze(prf_d(i+1-syf,j,k,:,:)));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            else
              ncols=['ncols        ',num2str(llo)];
              nrows=['nrows        ',num2str(lla)];
              xcorn=['xllcorner    ',num2str(minlon)];
              ycorn=['yllcorner    ',num2str(minlat)];
              CS   =['cellsize     ', num2str(cs)];
              NODAT=['NODATA_value  -9999'];
              fid=fopen([outputfolder,'/RAIN_',num2str(i),num2str(j),num2str(k),'000000.asc'],'w');        
              fprintf(fid,[ncols '\n' nrows '\n' xcorn '\n' ycorn '\n' CS '\n' NODAT '\n'])
              a=squeeze(prf_d(i+1-syf,j,k,:,:));
              dlmwrite(fid,a,'delimiter', '\t','precision', 6)
              fclose(fid);
            end
          end
        end
      end
    end
    waitbar((i-(syf-1))/(eyf-(syf-1)))
  end
  close(h)
end