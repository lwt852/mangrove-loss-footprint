%% load consumption data 189*189*three drivers
clear; clc; close all

footprint = load('final/loss_footprint_Results.mat');
footprint_countries=footprint.mangrove_loss_footprint_sel;
footprint_locat_col= footprint.loss_footprint_geo_col;
footprint_locat_row= footprint.loss_footprint_geo_row;
footprint_import= footprint.mangrove_change;
footprint_usa=footprint.USA_ratio;


footprintT1 = load('final/loss_footprint_ResultsT1.mat');
footprint_countriesT1=footprintT1.mangrove_loss_footprint_sel;
footprint_locatT1_col= footprintT1.loss_footprint_geo_col;
footprint_locatT1_row= footprintT1.loss_footprint_geo_row;
footprint_importT1= footprintT1.mangrove_change;
footprint_usaT1=footprintT1.USA_ratio;

footprintT2 = load('final/loss_footprint_ResultsT2.mat');
footprint_countriesT2=footprintT2.mangrove_loss_footprint_sel;
footprint_locatT2_col= footprintT2.loss_footprint_geo_col;
footprint_locatT2_row= footprintT2.loss_footprint_geo_row;
footprint_importT2= footprintT2.mangrove_change;
footprint_usaT2=footprintT2.USA_ratio;

footprintT3 = load('final/loss_footprint_ResultsT3.mat');
footprint_countriesT3=footprintT3.mangrove_loss_footprint_sel;
footprint_locatT3_col= footprintT3.loss_footprint_geo_col;
footprint_locatT3_row= footprintT3.loss_footprint_geo_row;
footprint_importT3= footprintT3.mangrove_change;
footprint_usaT3=footprintT3.USA_ratio;

%% add T1,T2 and T3. T is not the add-up of T1,T2,and T3 because....
footprint_countriessum = table2array(footprint_countriesT1(:, 2:end)) + table2array(footprint_countriesT2(:, 2:end)) + table2array(footprint_countriesT3(:, 2:end));
footprint_countriessum=array2table(footprint_countriessum,'VariableNames',footprint_countries.Properties.VariableNames(2:end));
footprint_countriessum.ISO_3Code_mangrove_countries=string(table2cell(footprint_countries(:,1)));

footprint_importsum=table2array(footprint_importT1(:, 2:end))+table2array(footprint_importT2(:, 2:end))+table2array(footprint_importT3(:, 2:end));
footprint_importsum=array2table(footprint_importsum,'VariableNames',footprint_import.Properties.VariableNames(2:end));
footprint_importsum.ISO_3Code=string(table2cell(footprint_import(:,1)));

footprint_locat_colsum=table2array(footprint_locatT1_col(:, 2:end))+table2array(footprint_locatT2_col(:,2:end))+table2array(footprint_locatT3_col(:, 2:end));
footprint_locat_colsum=array2table(footprint_locat_colsum,'VariableNames',footprint_locat_col.Properties.VariableNames(2:end));
footprint_locat_colsum.ISO_3Code=string(table2cell(footprint_locat_col(:,1)));

footprint_locat_rowsum=table2array(footprint_locatT1_row(:, 2:end))+table2array(footprint_locatT2_row(:,2:end))+table2array(footprint_locatT3_row(:, 2:end));
footprint_locat_rowsum=array2table(footprint_locat_rowsum,'VariableNames',footprint_locat_row.Properties.VariableNames(2:end));
footprint_locat_rowsum.ISO_3Code_mangrove_countries=string(table2cell(footprint_locat_row(:,1)));

footprint_usasum=table2array(footprint_usaT1(:, 2:end))+table2array(footprint_usaT2(:,2:end))+table2array(footprint_usaT3(:, 2:end));
footprint_usasum=array2table(footprint_usasum,'VariableNames',footprint_usa.Properties.VariableNames(2:end));
footprint_usasum.ISO_3Code=string(table2cell(footprint_usa(:,1)));
%% combine tables
footprint_countries.Time = repmat({'T'}, size(footprint_countries,1), 1);
footprint_countriessum.Time = repmat({'sum'}, size(footprint_countries,1), 1);
footprint_countriesT1.Time = repmat({'T1'}, size(footprint_countriesT1,1), 1);
footprint_countriesT2.Time = repmat({'T2'}, size(footprint_countriesT2,1), 1);
footprint_countriesT3.Time = repmat({'T3'}, size(footprint_countriesT3,1), 1);
footprint_countries_all=[footprint_countries;footprint_countriessum;footprint_countriesT1;footprint_countriesT2;footprint_countriesT3];

footprint_import.Time = repmat({'T'}, size(footprint_import,1), 1);
footprint_importsum.Time = repmat({'sum'}, size(footprint_import,1), 1);
footprint_importT1.Time = repmat({'T1'}, size(footprint_importT1,1), 1);
footprint_importT2.Time = repmat({'T2'}, size(footprint_importT2,1), 1);
footprint_importT3.Time = repmat({'T3'}, size(footprint_importT3,1), 1);
footprint_import_all=[footprint_import;footprint_importsum;footprint_importT1;footprint_importT2;footprint_importT3];
writetable(footprint_import_all, 'final/footprint_export_stack.csv');

footprint_locat_col.Time = repmat({'T'}, size(footprint_locat_col,1), 1);
footprint_locat_colsum.Time = repmat({'sum'}, size(footprint_locat_col,1), 1);
footprint_locatT1_col.Time = repmat({'T1'}, size(footprint_locatT1_col,1), 1);
footprint_locatT2_col.Time = repmat({'T2'}, size(footprint_locatT2_col,1), 1);
footprint_locatT3_col.Time = repmat({'T3'}, size(footprint_locatT3_col,1), 1);
footprint_locat_all_col=[footprint_locat_col;footprint_locat_colsum;footprint_locatT1_col;footprint_locatT2_col;footprint_locatT3_col];

footprint_locat_row.Time = repmat({'T'}, size(footprint_locat_row,1), 1);
footprint_locat_rowsum.Time = repmat({'sum'}, size(footprint_locat_row,1), 1);
footprint_locatT1_row.Time = repmat({'T1'}, size(footprint_locatT1_row,1), 1);
footprint_locatT2_row.Time = repmat({'T2'}, size(footprint_locatT2_row,1), 1);
footprint_locatT3_row.Time = repmat({'T3'}, size(footprint_locatT3_row,1), 1);
footprint_locat_all_row=[footprint_locat_row;footprint_locat_rowsum;footprint_locatT1_row;footprint_locatT2_row;footprint_locatT3_row];

footprint_usa.Time = repmat({'T'}, size(footprint_usa,1), 1);
footprint_usasum.Time = repmat({'sum'}, size(footprint_usa,1), 1);
footprint_usaT1.Time = repmat({'T1'}, size(footprint_usaT1,1), 1);
footprint_usaT2.Time = repmat({'T2'}, size(footprint_usaT2,1), 1);
footprint_usaT3.Time = repmat({'T3'}, size(footprint_usaT3,1), 1);
footprint_usa_all=[footprint_usa;footprint_usasum;footprint_usaT1;footprint_usaT2;footprint_usaT3];


%% turn tables from long to wide

footprint_countries_unstack=unstack(footprint_countries_all,{'CHN','DEU','IDN','JPN','RWA','USA'},'Time');
footprint_import_unstack=unstack(footprint_import_all,{'loss','import','export','change','difference'},'Time');
footprint_locat_colunstack=unstack(footprint_locat_all_col,{'domestic','adjacent','distant'},'Time');
footprint_locat_rowunstack=unstack(footprint_locat_all_row,{'domestic','adjacent','distant'},'Time');

footprint_usa_unstack=unstack(footprint_usa_all,{'commodities','settlement','npc'},'Time');

%% assign countries' attribute to tables and export them
%read sdg 170 countries for year 2007: the average of 1996-2016
% Get the table of SDG countries information and select year of 2007
sdg_countries = readtable('global_goals01_21.csv');
Table_Regions = table(sdg_countries.country, ...
    sdg_countries.Country, sdg_countries.Region, ...
    sdg_countries.Population,sdg_countries.IncomeGroup,sdg_countries.year,...
    'VariableNames', {'country', 'Country', 'Region','Population','IncomeGroup','Year'});
% Remove duplicate rows while keeping the original order
Table_Regions = unique(Table_Regions, 'rows', 'stable');
sdg_2007= Table_Regions(Table_Regions.Year==2007,:);
n_Regions = height(sdg_2007);

%merge
sdg_2007.country = cellfun(@(x) char(x),sdg_2007.country,'UniformOutput',false);
footprint_import_unstack.ISO_3Code = cellfun(@(x) char(x),footprint_import_unstack.ISO_3Code,'UniformOutput',false);
footprint_import_sdg=outerjoin(footprint_import_unstack,sdg_2007,'Type','Left','LeftKeys',1,'RightKeys',1);

footprint_locat_colunstack.ISO_3Code = cellfun(@(x) char(x),footprint_locat_colunstack.ISO_3Code,'UniformOutput',false);
footprint_locat_colsdg=outerjoin(footprint_locat_colunstack,sdg_2007,'Type','Left','LeftKeys',1,'RightKeys',1);

footprint_locat_rowunstack.ISO_3Code_mangrove_countries = cellfun(@(x) char(x),footprint_locat_rowunstack.ISO_3Code_mangrove_countries,'UniformOutput',false);
footprint_locat_rowsdg=outerjoin(footprint_locat_rowunstack,sdg_2007,'Type','Left','LeftKeys',1,'RightKeys',1);

footprint_usa_unstack.ISO_3Code = cellfun(@(x) char(x),footprint_usa_unstack.ISO_3Code,'UniformOutput',false);
footprint_usa_sdg=outerjoin(footprint_usa_unstack,sdg_2007,'Type','Left','LeftKeys',1,'RightKeys',1);

%% add regression coefficient (polarizing paper)

%combine col and row
% For footprint_locat_colunstack
footprint_locat_colunstack.T1 = footprint_locat_colunstack.domestic_T1 + ...
                                footprint_locat_colunstack.adjacent_T1 + ...
                                footprint_locat_colunstack.distant_T1;

footprint_locat_colunstack.T2 = footprint_locat_colunstack.domestic_T2 + ...
                                footprint_locat_colunstack.adjacent_T2 + ...
                                footprint_locat_colunstack.distant_T2;

footprint_locat_colunstack.T3 = footprint_locat_colunstack.domestic_T3 + ...
                                footprint_locat_colunstack.adjacent_T3 + ...
                                footprint_locat_colunstack.distant_T3;

footprint_locat_colunstack.domestic_Tbar = mean(footprint_locat_colunstack{:, {'domestic_T1', 'domestic_T2', 'domestic_T3'}}, 2);
footprint_locat_colunstack.adjacent_Tbar = mean(footprint_locat_colunstack{:, {'adjacent_T1', 'adjacent_T2', 'adjacent_T3'}}, 2);
footprint_locat_colunstack.distant_Tbar = mean(footprint_locat_colunstack{:, {'distant_T1', 'distant_T2', 'distant_T3'}}, 2);
footprint_locat_colunstack.Tbar = mean(footprint_locat_colunstack{:, {'T1', 'T2', 'T3'}}, 2);

% For footprint_locat_rowunstack
footprint_locat_rowunstack.T1 = footprint_locat_rowunstack.domestic_T1 + ...
                                footprint_locat_rowunstack.adjacent_T1 + ...
                                footprint_locat_rowunstack.distant_T1;

footprint_locat_rowunstack.T2 = footprint_locat_rowunstack.domestic_T2 + ...
                                footprint_locat_rowunstack.adjacent_T2 + ...
                                footprint_locat_rowunstack.distant_T2;

footprint_locat_rowunstack.T3 = footprint_locat_rowunstack.domestic_T3 + ...
                                footprint_locat_rowunstack.adjacent_T3 + ...
                                footprint_locat_rowunstack.distant_T3;

footprint_locat_rowunstack.domestic_Tbar = mean(footprint_locat_rowunstack{:, {'domestic_T1', 'domestic_T2', 'domestic_T3'}}, 2);
footprint_locat_rowunstack.adjacent_Tbar = mean(footprint_locat_rowunstack{:, {'adjacent_T1', 'adjacent_T2', 'adjacent_T3'}}, 2);
footprint_locat_rowunstack.distant_Tbar = mean(footprint_locat_rowunstack{:, {'distant_T1', 'distant_T2', 'distant_T3'}}, 2);
footprint_locat_rowunstack.Tbar = mean(footprint_locat_rowunstack{:, {'T1', 'T2', 'T3'}}, 2);

% Rename footprint_locat_colunstack to col
col = footprint_locat_colunstack;

% Rename footprint_locat_rowunstack to row
row = footprint_locat_rowunstack;

footprint_locat_all= outerjoin(col, row,'Type','Left','LeftKeys',1,'RightKeys',1);

%% calculate t1bar, t2bar and t3bar
% Identify numeric columns in the table
numericVars = varfun(@isnumeric, footprint_locat_all, 'OutputFormat', 'uniform');

% Replace NaN values with 0 only in numeric columns
footprint_locat_all{:, numericVars} = fillmissing(footprint_locat_all{:, numericVars}, 'constant', 0);

footprint_locat_all.T1bar = (footprint_locat_all.T1_row - footprint_locat_all.T1_col) ./ footprint_locat_all.T1_col;
footprint_locat_all.T2bar = (footprint_locat_all.T2_row - footprint_locat_all.T2_col) ./ footprint_locat_all.T2_col;
footprint_locat_all.T3bar = (footprint_locat_all.T3_row - footprint_locat_all.T3_col) ./ footprint_locat_all.T3_col;

footprint_locat_all.Tbarbar=mean(footprint_locat_all{:,{'T1bar','T2bar','T3bar'}},2);

%% get the coefficient
footprint_locat_reg=footprint_locat_all(:,{'ISO_3Code','T1bar','T2bar','T3bar'});

% Convert wide to long format
footprint_locat_reg1 = stack(footprint_locat_reg, {'T1bar', 'T2bar', 'T3bar'}, 'NewDataVariableName', 'bar', 'IndexVariableName', 'year');

% Replace 'T1', 'T2', 'T3' with 1, 2, 3 in the `year` column
footprint_locat_reg1.year = string(footprint_locat_reg1.year);
footprint_locat_reg1.year = str2double(regexprep(footprint_locat_reg1.year, '\D', ''));

% Get the unique ISO_3Code values
unique_codes = unique(footprint_locat_reg1.ISO_3Code);

% Initialize an array to store results
coefficients = table(unique_codes, NaN(size(unique_codes)), 'VariableNames', {'ISO_3Code', 'Coefficient'});

% Loop through each unique ISO_3Code
for i = 1:length(unique_codes)
    % Filter rows for the current ISO_3Code
    code_data = footprint_locat_reg1(strcmp(footprint_locat_reg1.ISO_3Code, unique_codes{i}), :);
    
    % Run regression between bar and year
    model = fitlm(code_data, 'bar ~ year');
    
    % Extract the coefficient for 'year' and store it
    coefficients.Coefficient(i) = model.Coefficients.Estimate('year');
end
%the the coefficient to the existing table
footprint_locat_all = join(footprint_locat_all, coefficients, 'Keys', 'ISO_3Code')

%% create the scatter plot
% Assuming footprint_locat_all has columns 'Tbarbar' (x-axis), 'Coefficient' (y-axis), and 'ISO_3Code' (country labels)
x = footprint_locat_all.Tbarbar;     % Net importing/exporting equivalent
y = footprint_locat_all.Coefficient; % Import-trending/Export-trending equivalent
labels = footprint_locat_all.ISO_3Code;

% Create the scatter plot
figure;
scatter(x, y, 50, 'filled', 'MarkerFaceColor', [1, 0.4, 0.4], 'MarkerEdgeColor', [0.8, 0, 0]);
hold on;

% Add text labels for each country
for i = 1:length(labels)
    text(x(i), y(i), labels{i}, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 8);
end

% Add shaded areas for quadrants
xline(0, '--k'); % Vertical line at x=0
yline(0, '--k'); % Horizontal line at y=0

% Define x and y limits
xlim([-1.02, 1.4]); % Adjust based on your data range
ylim([-0.8, 0.4]); % Adjust based on your data range

% Add labels and title
xlabel('Net importing / Net exporting');
ylabel('Import-trending / Export-trending');
title('Scatter Plot of Tbarbar vs Coefficient');

% Add a shaded confidence area similar to the example
% You can customize this part based on your specific dataset
fill([-1.5 0 1.5], [0.08 0 -0.08], [1, 0.8, 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.3);

% Hold off to end plotting
hold off;


%% calculate the per capita values (domesntic,..are in km2; per capita are in m2)
footprint_locat_colsdg{:, {'domesticpc_T', 'adjacentpc_T','distantpc_T',...
    'domesticpc_sum', 'adjacentpc_sum','distantpc_sum',...
    'domesticpc_T1','adjacentpc_T1','distantpc_T1',...
    'domesticpc_T2', 'adjacentpc_T2','distantpc_T2',...
    'domesticpc_T3', 'adjacentpc_T3','distantpc_T3'}} = ...
    footprint_locat_colsdg{:, {'domestic_T', 'adjacent_T','distant_T',...
    'domestic_sum', 'adjacent_sum','distant_sum',...
    'domestic_T1', 'adjacent_T1','distant_T1',...
    'domestic_T2', 'adjacent_T2','distant_T2',...
    'domestic_T3', 'adjacent_T3','distant_T3'}} ./  footprint_locat_colsdg.Population*1000000;

footprint_locat_rowsdg{:, {'domesticpc_T', 'adjacentpc_T','distantpc_T',...
    'domesticpc_sum', 'adjacentpc_sum','distantpc_sum',...
    'domesticpc_T1','adjacentpc_T1','distantpc_T1',...
    'domesticpc_T2', 'adjacentpc_T2','distantpc_T2',...
    'domesticpc_T3', 'adjacentpc_T3','distantpc_T3'}} = ...
    footprint_locat_rowsdg{:, {'domestic_T', 'adjacent_T','distant_T',...
    'domestic_sum', 'adjacent_sum','distant_sum',...
    'domestic_T1', 'adjacent_T1','distant_T1',...
    'domestic_T2', 'adjacent_T2','distant_T2',...
    'domestic_T3', 'adjacent_T3','distant_T3'}} ./  footprint_locat_rowsdg.Population*1000000;
%remove NAs
footprint_locat_colsdg = footprint_locat_colsdg(~isnan(footprint_locat_colsdg.domesticpc_sum), :);
footprint_locat_rowsdg = footprint_locat_rowsdg(~isnan(footprint_locat_rowsdg.domesticpc_sum), :);
footprint_countries_unstack = footprint_countries_unstack(~isnan(footprint_countries_unstack.CHN_sum), :);


%% export
writetable(footprint_locat_colsdg, 'final/footprint_locat_colsdg.csv');
writetable(footprint_locat_rowsdg, 'final/footprint_locat_rowsdg.csv');
writetable(footprint_import_sdg, 'final/footprint_import_sdg.csv');
writetable(footprint_usa_sdg, 'final/footprint_usa_sdg.csv');
writetable(footprint_countries_unstack, 'final/footprint_countries_unstack.csv');
writetable(footprint_import_all, 'C:\Users\lenovo\OneDrive\Mimi\driversMLFP\matlab\footprint_import_all.csv');








