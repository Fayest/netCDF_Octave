%author: Muhammad Nafayest
%requirement : - nr2d_pr function to convert daily rain data netCDF to ascii (area/dot)
%              - nr2m_pr function to convert monthly rain data netCDF to ascii (area/dot)
%              - nc2AIA function to convert daily rain data netCDF to arc info ascii (area)
close all; clear all; clc;
%load packages for octave, turn off if use MATLAB-------------------------------
pkg load netcdf;
pkg load nan;
pkg load io;
more off;
%-------------------------------------------------------------------------------
%model Description##############################################################
%min & max lon==================================================================
minlon= 107.536111;
maxlon= 107.536111;
%min & max lat==================================================================
minlat= -6.941667;
maxlat= -6.941667;
%year===========================================================================
syf=2041; %start year
eyf=2050; %end year
%I/O file=======================================================================
dataname='csiro';
name='csiromk36-rcp45-dd-pr-tas-t2m.'; %name of file csiromk36-rcp45-dd-pr-tas-t2m.204101.nc
                                       %name.yyyymm.nc
par={'pr'}; %take parameter data from netcdf eg. "pr" for precipitation
sf=[dataname,'_',num2str(syf),'_',num2str(eyf),'.mat']; %name saved file
of=dataname;  %output folder
mkdir(of);     %make dirrectory for output folder
con=3600*24;  %convert data unit from kg m^-2 s^1 to mm day^-1
              %(optional, change to 1 if there is no conversion)
%###############################################################################
%data_read======================================================================
%take data from specific area from netcdf
[prf_m]=nr2m_pr(syf,eyf,minlon,maxlon,minlat,maxlat,par(1),name,con); %pr_m(yr,month,lon,lat)
[prf_d]=nr2d_pr(syf,eyf,minlon,maxlon,minlat,maxlat,par(1),name,con); %pr_d(yr,month,day,lon,lat)
save(sf,'prf_m','prf_d'); %save as mat file
%save to arc info ascii (optional)
nc2AIA(sf, of, maxlon, maxlat, minlon, minlat,syf,eyf,name); %save file as RAIN_yyyymmdd000000.asc
%###############################################################################