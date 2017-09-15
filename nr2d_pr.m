function [dailydata]=nr2d_pr(sy,ey,minlon,maxlon,minlat,maxlat,par,name,con)
%-------------------------------------------------------------------------------
%by Muhammad Nafayest
% I.Description
%   read data GCM with netcdf formatted data 
%   for parameter precipitation daily (kg.m^-2.s^-1) to mm/day
% II. variable description
%   1. data : output data
%   2. sy   : start year
%   3. ey   : end year
%   4. minlon/maxlon: minimum/maximum longitude
%   5. minlat/maxlat: minimum/maximum latitude
%   6. par  : parameter from data that contained in netcdf use 
%             (e.g par='pr' where pr=precipitation)
%   7. name : name of your data (e.g your data name is 
%      csiromk36-rcp45-dd-pr-tas-t2m.200604.nc you only need to write 
%      name='csiromk36-rcp45-dd-pr-tas-t2m.')
%   8. con  : data conversion multipler
% III Output
%     dailydata for specific area or dot(max=min for lon and lat)
%-------------------------------------------------------------------------------
%look min lon and lat in data
lc = [pwd,'/data/',name,num2str(sy),'0',num2str(1),'.nc'];
lonn=ncread(lc,'lon');
latt=ncread(lc,'lat');
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
h=waitbar(0,'daily rain processing...');
  for i =sy:ey    %year
    for j=1:12    %month
      if j<=9
        nf = [pwd,'/data/',name,num2str(i),'0',num2str(j),'.nc'];
        dat = ncread(nf,par)*con;
        if j==2
          for k=1:llo    %longitude
            for l=1:lla    %latitude
              dailydata((i-sy)+1,j,1:28,k,l)= dat(lon(k),lat(l),:);
            end
          end
        elseif (j==1 ||j==3||j==5||j==7||j==8)
          for k=1:llo    %longitude
            for l=1:lla    %latitude
              dailydata((i-sy)+1,j,:,k,l)= dat(lon(k),lat(l),:);
            end
          end
        else
          for k=1:llo    %longitude
            for l=1:lla    %latitude
              dailydata((i-sy)+1,j,1:30,k,l)= dat(lon(k),lat(l),:);
            end
          end
        end
      elseif j>9
        nf = [pwd,'/data/',name,num2str(i),num2str(j),'.nc'];
        dat = ncread(nf,par)*con;
          if (j==10 || j==12)
            for k=1:llo    %longitude
              for l=1:lla    %latitude
                dailydata((i-sy)+1,j,:,k,l)= dat(lon(k),lat(l),:);
              end
            end
          else
            for k=1:llo    %longitude
              for l=1:lla    %latitude
                dailydata((i-sy)+1,j,1:30,k,l)= dat(lon(k),lat(l),:);
              end
            end
          end
      end
      waitbar((i-(sy-1))/(ey-(sy-1)))
    end
  end
  close (h);
end %end of function