clear; clc; close all

%% Read files Using the Eora26 data for 2021
n_Sectors = 26;

% Read the data for 2000-2016
T16 = readmatrix('Eora26_2016_bp/Eora26_2016_bp_T.txt');
FD16 = readmatrix('Eora26_2016_bp/Eora26_2016_bp_FD.txt');
VA16 = readmatrix('Eora26_2016_bp/Eora26_2016_bp_VA.txt'); 

T15 = readmatrix('Eora26_2015_bp/Eora26_2015_bp_T.txt');
FD15 = readmatrix('Eora26_2015_bp/Eora26_2015_bp_FD.txt');
VA15 = readmatrix('Eora26_2015_bp/Eora26_2015_bp_VA.txt'); 

T14 = readmatrix('Eora26_2014_bp/Eora26_2014_bp_T.txt');
FD14 = readmatrix('Eora26_2014_bp/Eora26_2014_bp_FD.txt');
VA14 = readmatrix('Eora26_2014_bp/Eora26_2014_bp_VA.txt'); 

T13 = readmatrix('Eora26_2013_bp/Eora26_2013_bp_T.txt');
FD13 = readmatrix('Eora26_2013_bp/Eora26_2013_bp_FD.txt');
VA13 = readmatrix('Eora26_2013_bp/Eora26_2013_bp_VA.txt'); 

T12 = readmatrix('Eora26_2012_bp/Eora26_2012_bp_T.txt');
FD12 = readmatrix('Eora26_2012_bp/Eora26_2012_bp_FD.txt');
VA12 = readmatrix('Eora26_2012_bp/Eora26_2012_bp_VA.txt'); 

T11 = readmatrix('Eora26_2011_bp/Eora26_2011_bp_T.txt');
FD11 = readmatrix('Eora26_2011_bp/Eora26_2011_bp_FD.txt');
VA11 = readmatrix('Eora26_2011_bp/Eora26_2011_bp_VA.txt'); 

T10 = readmatrix('Eora26_2010_bp/Eora26_2010_bp_T.txt');
FD10 = readmatrix('Eora26_2010_bp/Eora26_2010_bp_FD.txt');
VA10 = readmatrix('Eora26_2010_bp/Eora26_2010_bp_VA.txt'); 

T9 = readmatrix('Eora26_2009_bp/Eora26_2009_bp_T.txt');
FD9 = readmatrix('Eora26_2009_bp/Eora26_2009_bp_FD.txt');
VA9 = readmatrix('Eora26_2009_bp/Eora26_2009_bp_VA.txt');

T8 = readmatrix('Eora26_2008_bp/Eora26_2008_bp_T.txt');
FD8 = readmatrix('Eora26_2008_bp/Eora26_2008_bp_FD.txt');
VA8 = readmatrix('Eora26_2008_bp/Eora26_2008_bp_VA.txt'); 

T7 = readmatrix('Eora26_2007_bp/Eora26_2007_bp_T.txt');
FD7 = readmatrix('Eora26_2007_bp/Eora26_2007_bp_FD.txt');
VA7 = readmatrix('Eora26_2007_bp/Eora26_2007_bp_VA.txt'); 

T6 = readmatrix('Eora26_2006_bp/Eora26_2006_bp_T.txt');
FD6 = readmatrix('Eora26_2006_bp/Eora26_2006_bp_FD.txt');
VA6 = readmatrix('Eora26_2006_bp/Eora26_2006_bp_VA.txt'); 

T5 = readmatrix('Eora26_2005_bp/Eora26_2005_bp_T.txt');
FD5 = readmatrix('Eora26_2005_bp/Eora26_2005_bp_FD.txt');
VA5 = readmatrix('Eora26_2005_bp/Eora26_2005_bp_VA.txt'); 

T4 = readmatrix('Eora26_2004_bp/Eora26_2004_bp_T.txt');
FD4 = readmatrix('Eora26_2004_bp/Eora26_2004_bp_FD.txt');
VA4 = readmatrix('Eora26_2004_bp/Eora26_2004_bp_VA.txt'); 

T3 = readmatrix('Eora26_2003_bp/Eora26_2003_bp_T.txt');
FD3 = readmatrix('Eora26_2003_bp/Eora26_2003_bp_FD.txt');
VA3 = readmatrix('Eora26_2003_bp/Eora26_2003_bp_VA.txt'); 

T2 = readmatrix('Eora26_2002_bp/Eora26_2002_bp_T.txt');
FD2 = readmatrix('Eora26_2002_bp/Eora26_2002_bp_FD.txt');
VA2 = readmatrix('Eora26_2002_bp/Eora26_2002_bp_VA.txt'); 

T1 = readmatrix('Eora26_2001_bp/Eora26_2001_bp_T.txt');
FD1 = readmatrix('Eora26_2001_bp/Eora26_2001_bp_FD.txt');
VA1 = readmatrix('Eora26_2001_bp/Eora26_2001_bp_VA.txt'); 

T0 = readmatrix('Eora26_2000_bp/Eora26_2000_bp_T.txt');
FD0 = readmatrix('Eora26_2000_bp/Eora26_2000_bp_FD.txt');
VA0 = readmatrix('Eora26_2000_bp/Eora26_2000_bp_VA.txt'); 

% all years
% T = T0+T1+T2+T3+T4+T5+T6+T7+T8+T9+T10+T11+T12+T13+T14+T15+T16;
% FD = FD0+FD1+FD2+FD3+FD4+FD5+FD6+FD7+FD8+FD9+FD10+FD11+FD12+FD13+FD14+FD15+FD16;
% VA = VA0+VA1+VA2+VA3+VA4+VA5+VA6+VA7+VA8+VA9+VA10+VA11+VA12+VA13+VA14+VA15+VA16;

% T1 00-05
T = T0+T1+T2+T3+T4+T5;
FD = FD0+FD1+FD2+FD3+FD4+FD5;
VA = VA0+VA1+VA2+VA3+VA4+VA5;

% T2 06-10
% T = T6+T7+T8+T9+T10;
% FD = FD6+FD7+FD8+FD9+FD10;
% VA = VA6+VA7+VA8+VA9+VA10;

% %T3 11-16
% T = T11+T12+T13+T14+T15+T16;
% FD = FD11+FD12+FD13+FD14+FD15+FD16;
% VA = VA11+VA12+VA13+VA14+VA15+VA16;

% Adjust
FD(FD<0) = 0; % Final demand should not be smaller than 0.
VA(VA<0) = 0; % Value-added should not be smaller than 0.

% Read the labels
labels_T = readtable('indices/labels_T.txt','ReadVariableNames', false);
labels_FD = readtable('indices/labels_FD.txt','ReadVariableNames', false);
labels_VA = readlines('indices/labels_VA.txt');

% Get the names of regions and sectors
Names_Region = unique(labels_T.Var1,'stable'); % Countries listed
Names_Sector = labels_T.Var4(1:n_Sectors); % Sectors listed

% Total number of sectors and regions
N_Sectors = size(T,1);
N_Regions = size(FD,2) / 6;

%% Calculate key IO variables
% Total input (output) of all sectors
X_in = sum(T) + sum(VA); 
X_out = sum(T,2) + sum(FD,2);

% A and L matrices in IO theory
A = T ./ (X_in + (X_in==0));
L = inv(eye(N_Sectors) - A);

% Final demand vector by region (where each column is a region)
% Please only select ONE ROW from the following code
%FD_Region = FD * kron(eye(N_Regions),ones(6,1)); % All final demand categories
FD_Region = FD(:, 1:6:end); % Household final consumption
% FD_Region = FD(:, 2:6:end); % Non-profit institutions serving households
% FD_Region = FD(:, 3:6:end); % Government final consumption
% FD_Region = FD(:, 4:6:end); % Gross fixed capital formation
% FD_Region = FD(:, 5:6:end); % Changes in inventories
% FD_Region = FD(:, 6:6:end); % Acquisitions less disposals of valuables

% Keep only a subset of sectors with indices in "index_sectors"
% Here index_sectors is the sector index vector with numbers from 1 to 26
% If you want to keep all sectors, DO NOT use the following code

% index_sectors = [1 2 4];
% Temp = zeros(size(FD_Region)); % Initialize a new matrix of zeros
% for i = 0:(floor(size(FD_Region, 1)/26) - 1)
%     for j = 1:length(index_sectors)
%         rowIndex = i * 26 + index_sectors(j);
%         if rowIndex <= size(FD_Region, 1)
%             Temp(rowIndex, :) = FD_Region(rowIndex, :);
%         end
%     end
% end
% FD_Region = Temp;
% clear i j Temp

% Final demand-induced production vector 
% where each column represents the impact of a region's final demand
X_FD_Region = L * FD_Region;

% Ratio of final demand-induced production in sectors' total production
% where each column represents the impact of a region's final demand
% Find the rows that are not all zeros
nonzero_rows = any(X_FD_Region, 2);
% Normalize the non-zero rows
X_FD_Region_Ratio(nonzero_rows, :) = X_FD_Region(nonzero_rows, :) ./ ...
    sum(X_FD_Region(nonzero_rows, :), 2);

%%
% Mangrove Loss Driver      |  Eora26 Sector
% Commodities               |  1, 2, 3, 6, 13
% Human Settlement          |  14, 19
% Non-productive Convertion |  23, 24

% Sectors that corresponds to drivers
DriverSector_Commod = [1, 2, 3, 6, 13];
DriverSector_HumanSet = [14, 19];
DriverSector_Convert = [23, 24];

% Get the fraction of each sector in its region
% in Mangrove Loss Driver: Commodities
mask = zeros(n_Sectors,1);
mask(DriverSector_Commod) = 1;
mask = repmat(mask, N_Regions - 1, 1);
mask = [mask; 0];
X_Temp = X_out .* mask; % Only keep the outputs of relevent sectors
Temp = kron(eye(N_Regions-1),ones(1,n_Sectors));
Temp = [Temp, zeros(size(Temp,1), 1)];
Temp = Temp * X_Temp;
X_Temp_Total = kron(eye(N_Regions-1),ones(n_Sectors,1)) * Temp;
X_DriverFraction = X_Temp;
X_DriverFraction(1:(N_Sectors-1)) = ...
    X_Temp(1:(N_Sectors-1)) ./ (X_Temp_Total + (X_Temp_Total==0));
% Calculate the fraction
X_DriverFraction_Commod = X_DriverFraction;
clear mask X_Temp Temp X_Temp_Total X_DriverFraction

% Get the fraction of each sector in its region
% in Mangrove Loss Driver: Human Settlement
mask = zeros(n_Sectors,1);
mask(DriverSector_HumanSet) = 1;
mask = repmat(mask, N_Regions - 1, 1);
mask = [mask; 0];
X_Temp = X_out .* mask; % Only keep the outputs of relevent sectors
Temp = kron(eye(N_Regions-1),ones(1,n_Sectors));
Temp = [Temp, zeros(size(Temp,1), 1)];
Temp = Temp * X_Temp;
X_Temp_Total = kron(eye(N_Regions-1),ones(n_Sectors,1)) * Temp;
X_DriverFraction = X_Temp;
X_DriverFraction(1:(N_Sectors-1)) = ...
    X_Temp(1:(N_Sectors-1)) ./ (X_Temp_Total + (X_Temp_Total==0));
% Calculate the fraction
X_DriverFraction_HumanSet = X_DriverFraction;
clear mask X_Temp Temp X_Temp_Total X_DriverFraction

% Get the fraction of each sector in its region
% in Mangrove Loss Driver: Non-productive Convertion
mask = zeros(n_Sectors,1);
mask(DriverSector_Convert) = 1;
mask = repmat(mask, N_Regions - 1, 1);
mask = [mask; 0];
X_Temp = X_out .* mask; % Only keep the outputs of relevent sectors
Temp = kron(eye(N_Regions-1),ones(1,n_Sectors));
Temp = [Temp, zeros(size(Temp,1), 1)];
Temp = Temp * X_Temp;
X_Temp_Total = kron(eye(N_Regions-1),ones(n_Sectors,1)) * Temp;
X_DriverFraction = X_Temp;
X_DriverFraction(1:(N_Sectors-1)) = ...
    X_Temp(1:(N_Sectors-1)) ./ (X_Temp_Total + (X_Temp_Total==0));
% Calculate the fraction
X_DriverFraction_Convert = X_DriverFraction;
clear mask X_Temp Temp X_Temp_Total X_DriverFraction

% Temporary converting matrix
Temp = kron(eye(N_Regions-1),ones(1,n_Sectors));
Temp = [Temp, zeros(size(Temp,1), 1)];

% The ratio in each region-sector in the region
% in Mangrove Loss Driver: Commodities
% Here each column represents the impacts of a region's final demand
X_FD_Region_Ratio_Commod = X_DriverFraction_Commod .* X_FD_Region_Ratio;
% The ratio of the impact of each column region's final demand
% in each row region's driver, WHICH IS USEFUL!
X_FD_Region_Ratio_Region_Commod = Temp * X_FD_Region_Ratio_Commod;
X_FD_Region_Ratio_Region_Commod = X_FD_Region_Ratio_Region_Commod(:, 1:end-1);

% The ratio in each region-sector in the region
% in Mangrove Loss Driver: Human Settlement
% Here each column represents the impacts of a region's final demand
X_FD_Region_Ratio_HumanSet = X_DriverFraction_HumanSet .* X_FD_Region_Ratio;
% The ratio of the impact of each column region's final demand
% in each row region's driver, WHICH IS USEFUL!
X_FD_Region_Ratio_Region_HumanSet = Temp * X_FD_Region_Ratio_HumanSet;
X_FD_Region_Ratio_Region_HumanSet = X_FD_Region_Ratio_Region_HumanSet(:, 1:end-1);

% The ratio in each region-sector in the region
% in Mangrove Loss Driver: Non-productive Convertion
% Here each column represents the impacts of a region's final demand
X_FD_Region_Ratio_Convert = X_DriverFraction_Convert .* X_FD_Region_Ratio;
% The ratio of the impact of each column region's final demand
% in each row region's driver, WHICH IS USEFUL!
X_FD_Region_Ratio_Region_Convert = Temp * X_FD_Region_Ratio_Convert;
X_FD_Region_Ratio_Region_Convert = X_FD_Region_Ratio_Region_Convert(:, 1:end-1);

clear Temp

%%
save("consumption_Results_household_T1.mat",'X_FD_Region_Ratio_Region_HumanSet','X_FD_Region_Ratio_Region_Convert','X_FD_Region_Ratio_Region_Commod')