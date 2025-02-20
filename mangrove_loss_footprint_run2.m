%% load consumption data 189*189*three drivers
clear; clc; close all

consumption = load('consumption_Results.mat');
commodities_ratio = consumption.X_FD_Region_Ratio_Region_Commod;
settlement_ratio =consumption.X_FD_Region_Ratio_Region_HumanSet;
npc_ratio=consumption.X_FD_Region_Ratio_Region_Convert;

consumptionT1 = load('consumption_Results_T1.mat');
commodities_ratioT1 = consumptionT1.X_FD_Region_Ratio_Region_Commod;
settlement_ratioT1 =consumptionT1.X_FD_Region_Ratio_Region_HumanSet;
npc_ratioT1=consumptionT1.X_FD_Region_Ratio_Region_Convert;

consumptionT2 = load('consumption_Results_T2.mat');
commodities_ratioT2 = consumptionT2.X_FD_Region_Ratio_Region_Commod;
settlement_ratioT2 =consumptionT2.X_FD_Region_Ratio_Region_HumanSet;
npc_ratioT2=consumptionT2.X_FD_Region_Ratio_Region_Convert;

consumptionT3 = load('consumption_Results_T3.mat');
commodities_ratioT3 = consumptionT3.X_FD_Region_Ratio_Region_Commod;
settlement_ratioT3 =consumptionT3.X_FD_Region_Ratio_Region_HumanSet;
npc_ratioT3=consumptionT3.X_FD_Region_Ratio_Region_Convert;

%% load adjacent matrix and calculate domestic, distant matrics
% 189*189*(domestic, adjacent, distant)
adjacent= readmatrix('drivers230919.xlsx', 'Sheet', 'adjacent','Range','B2:GH190');
adjacent(isnan(adjacent))=0;
domestic = eye(size(adjacent));
temp=ones(size(adjacent));
distant=temp-adjacent -domestic;
%% read Goldenberg's mangrove loss data and turn it in eora order
%read eora 190 countries
%read sdg 170 countries for year 2007: the average of 1996-2016

loss_driver = readtable('gcb15275-sup-0002-dataset1.csv'); 
eora_countries = readtable('eora_countries.csv');
sdg_countries = readtable('global_goals_01_21.csv');

% Get the table of SDG countries information and select year of 2007
Table_Regions = table(sdg_countries.country, ...
    sdg_countries.Country, sdg_countries.Region, ...
    sdg_countries.Population,sdg_countries.IncomeGroup,sdg_countries.year,sdg_countries.country_new,...
    'VariableNames', {'country', 'Country', 'Region','Population','IncomeGroup','Year','country_new'});
% Remove duplicate rows while keeping the original order
Table_Regions = unique(Table_Regions, 'rows', 'stable');

sdg_2007= Table_Regions(Table_Regions.Year==2007,:);
n_Regions = height(sdg_2007);

loss_driver_eora= outerjoin(eora_countries,loss_driver,'Type','Left','LeftKeys',2,'RightKeys',2);
loss_driver_eora=sortrows(loss_driver_eora,'ID');

%% add countries information through SDG tables and update the eora table with countries' attributes

sdg_countries = readtable('global_goals_01_21.csv');
% Get the table of SDG countries information and select year of 2007
Table_Regions = table(sdg_countries.country, ...
    sdg_countries.Country, sdg_countries.Region, ...
    sdg_countries.Population,sdg_countries.IncomeGroup,sdg_countries.year,sdg_countries.country_new,...
    'VariableNames', {'country', 'Country', 'Region','Population','IncomeGroup','Year','country_new'});
% Remove duplicate rows while keeping the original order
Table_Regions = unique(Table_Regions, 'rows', 'stable');

sdg_2007= Table_Regions(Table_Regions.Year==2007,:);
n_Regions = height(sdg_2007);

% combine eora with SDG countries information 

sdg_2007.country = cellfun(@(x) char(x),sdg_2007.country,'UniformOutput',false);
eora_countries.GID = cellfun(@(x) char(x),eora_countries.GID,'UniformOutput',false);
eora_countries_detail=outerjoin(eora_countries,sdg_2007,'Type','Left','LeftKeys',2,'RightKeys',1);
countries=eora_countries_detail(:,{'ID','GID','Name','Region','IncomeGroup','country_new'});
countries=sortrows(countries,'ID');

writetable(countries,'countries.csv','WriteRowNames',true)
%% calculate the footprint

%calculate the footprint in 2000-2016
loss_driver_eora.commodities=loss_driver_eora.CommoditiesArea2000_2016;
loss_driver_eora.settlement=loss_driver_eora.SettlementArea2000_2016;
loss_driver_eora.NPC =loss_driver_eora.NPCArea2000_2016;

X_FD_Region_Ratio_Region_Commod = commodities_ratio;
X_FD_Region_Ratio_Region_HumanSet = settlement_ratio;
X_FD_Region_Ratio_Region_Convert = npc_ratio;

loss= loss_driver_eora.TotalLoss2000_2016;
loss(isnan(loss))=0;

%calculate the footprint in 2000-2005
% loss_driver_eora.commodities=loss_driver_eora.CommoditiesArea2000_2005;
% loss_driver_eora.settlement=loss_driver_eora.SettlementArea2000_2005;
% loss_driver_eora.NPC =loss_driver_eora.NPCArea2000_2005;
% 
% X_FD_Region_Ratio_Region_Commod = commodities_ratioT1;
% X_FD_Region_Ratio_Region_HumanSet = settlement_ratioT1;
% X_FD_Region_Ratio_Region_Convert = npc_ratioT1;
% 
% loss= loss_driver_eora.LossArea2000_2005;
% loss(isnan(loss))=0;

%calculate the footprint in 2006-2010
% loss_driver_eora.commodities=loss_driver_eora.CommoditiesArea2005_2010;
% loss_driver_eora.settlement=loss_driver_eora.SettlementArea2005_2010;
% loss_driver_eora.NPC =loss_driver_eora.NPCArea2005_2010;
% 
% X_FD_Region_Ratio_Region_Commod = commodities_ratioT2;
% X_FD_Region_Ratio_Region_HumanSet = settlement_ratioT2;
% X_FD_Region_Ratio_Region_Convert = npc_ratioT2;
% 
% loss= loss_driver_eora.LossArea2005_2010;
% loss(isnan(loss))=0;

%calculate the footprint in 2011-2016
% loss_driver_eora.commodities=loss_driver_eora.CommoditiesArea2010_2016;
% loss_driver_eora.settlement=loss_driver_eora.SettlementArea2010_2016;
% loss_driver_eora.NPC =loss_driver_eora.NPCArea2010_2016;
% 
% X_FD_Region_Ratio_Region_Commod = commodities_ratioT3;
% X_FD_Region_Ratio_Region_HumanSet = settlement_ratioT3;
% X_FD_Region_Ratio_Region_Convert = npc_ratioT3;
% 
% loss= loss_driver_eora.LossArea2010_2016;
% loss(isnan(loss))=0;

%

commodities_result = loss_driver_eora.commodities .* X_FD_Region_Ratio_Region_Commod;
settlement_result = loss_driver_eora.settlement .* X_FD_Region_Ratio_Region_HumanSet;
npc_result = loss_driver_eora.NPC .* X_FD_Region_Ratio_Region_Convert;
%mangrove loss footprint
all=cat(3,commodities_result , settlement_result , npc_result);
mangrove_loss_footprint= nansum(all,3);
%test= commodities_result + settlement_result+ npc_result

%% organize the mangrove loss footprint by country types.

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

% combine eora with SDG countries information and assign the mlfp

sdg_2007.country = cellfun(@(x) char(x),sdg_2007.country,'UniformOutput',false);
eora_countries.GID = cellfun(@(x) char(x),eora_countries.GID,'UniformOutput',false);
eora_countries_detail=outerjoin(eora_countries,sdg_2007,'Type','Left','LeftKeys',2,'RightKeys',1);

countries=eora_countries_detail(:,{'ID','GID','Name','Region','IncomeGroup','country_new'});
countries=sortrows(countries,'ID');
mangrove_loss_footprint_sanky=array2table(mangrove_loss_footprint,'VariableNames',string(table2cell(countries(:,1))));
mangrove_loss_footprint_sanky=[countries,mangrove_loss_footprint_sanky];

% aggregate values by income group
writetable(mangrove_loss_footprint_sanky, 'for_sankey1116.csv','WriteRowNames',true)
%%
% % Define the variables to group and summarize
% groupVars = 'IncomeGroup';
% 
% % Define the variables to summarize (assuming you want to sum columns from 5:end)
% varsToSummarize = mangrove_loss_footprint.Properties.VariableNames(5:end);
% 
% % Split and apply summary function
% mlfp_region = splitapply(@sum, mangrove_loss_footprint{:, 5:end}, findgroups(mangrove_loss_footprint.(groupVars)));
% 
% % Create a new table with the summarized results
% mlfp_region_summary = array2table(mlfp_region, 'VariableNames', varsToSummarize);
% 
% % Add the 'IncomeGroup' column
% mangrove_loss_footprint = rmmissing(mangrove_loss_footprint);
% 
% % transform the table and aggregate again
% test=table2array(mlfp_region_summary);
% mlfp_tranform=test.';
% mlfp_tranform = array2table(mlfp_tranform, 'VariableNames',string(unique(mangrove_loss_footprint.IncomeGroup)));
% mlfp_tranform=[countries,mlfp_tranform];
% 
% % Define the variables to group and summarize
% groupVars = 'IncomeGroup';
% 
% % Define the variables to summarize (assuming you want to sum columns from 5:end)
% varsToSummarize1 = mlfp_tranform.Properties.VariableNames(5:end);
% 
% % Split and apply summary function
% mlfp_region1 = splitapply(@sum, mlfp_tranform{:, 5:end}, findgroups(mlfp_tranform.(groupVars)));
% 
% % Create a new table with the summarized results
% mlfp_region_summary1 = array2table(mlfp_region1, 'VariableNames', varsToSummarize1);
% 
% mlfp_tranform = rmmissing(mlfp_tranform);
% mlfp_region_summary1.IncomeGroup = string(unique(mlfp_tranform.IncomeGroup));
% 
% % export the table for sankey graphs Income Group
% mlfp_region_summary1=mlfp_region_summary1(:,[5 1:4])
% %writetable(mlfp_region_summary1, 'incomegroup_sankey.csv','WriteRowNames',true)
% 
% %% export the table for sankey graphs Region
% 
% % Define the variables to group and summarize
% groupVars = 'Region';
% 
% % Define the variables to summarize (assuming you want to sum columns from 5:end)
% varsToSummarize = mangrove_loss_footprint.Properties.VariableNames(5:end);
% 
% % Split and apply summary function
% mlfp_region = splitapply(@sum, mangrove_loss_footprint{:, 5:end}, findgroups(mangrove_loss_footprint.(groupVars)));
% 
% % Create a new table with the summarized results
% mlfp_region_summary = array2table(mlfp_region, 'VariableNames', varsToSummarize);
% 
% % Add the 'IncomeGroup' column
% mangrove_loss_footprint = rmmissing(mangrove_loss_footprint);
% 
% %transform the table and aggregate again
% test=table2array(mlfp_region_summary);
% mlfp_tranform=test.';
% mlfp_tranform = array2table(mlfp_tranform, 'VariableNames',string(unique(mangrove_loss_footprint.Region)));
% mlfp_tranform=[countries,mlfp_tranform];
% 
% % Define the variables to group and summarize
% groupVars = 'Region';
% 
% % Define the variables to summarize (assuming you want to sum columns from 5:end)
% varsToSummarize1 = mlfp_tranform.Properties.VariableNames(5:end);
% 
% % Split and apply summary function
% mlfp_region1 = splitapply(@sum, mlfp_tranform{:, 5:end}, findgroups(mlfp_tranform.(groupVars)));
% 
% % Create a new table with the summarized results
% mlfp_region_summary1 = array2table(mlfp_region1, 'VariableNames', varsToSummarize1);
% 
% mlfp_tranform = rmmissing(mlfp_tranform);
% mlfp_region_summary1.Region = string(unique(mlfp_tranform.Region));
% 
% mlfp_region_summary1=mlfp_region_summary1(:,[8 1:end])
% writetable(mlfp_region_summary1, 'region_sankey.csv','WriteRowNames',true)

%% select countries of interests
% Countries of intersted                         |  Eora26 country
%  China, Germany,Indonesia, Japan, Rwanda,USA   |  40,67,80,87,143,181

select_countries= string(loss_driver_eora.GID([40,67,80,87,143,181],:).');
countries=string(loss_driver_eora.GID);

%ratio. for spatial explicit raster maps. 
%mangrove_commodities_ratio=array2table(commdities_ratio,'RowNames',countries,'VariableNames',countries)
USA_ratio=[ X_FD_Region_Ratio_Region_Commod(:,181) ,X_FD_Region_Ratio_Region_HumanSet(:,181),X_FD_Region_Ratio_Region_Convert(:,181)];
USA_ratio =array2table(USA_ratio,'VariableNames',{'commodities','settlement','npc'});
USA_ratio.ISO_3Code= countries;
USA_ratio=USA_ratio(:,[4 1:3]);
writetable(USA_ratio, 'USA_ratio.csv','WriteRowNames',true);

%% mangrove loss footprint in selected countries. in m2
mangrove_countries = loss_driver(:,2);
mangrove_loss_footprint_sel=mangrove_loss_footprint(:,[40 67 80 87 143 181])*1000000;

mangrove_loss_footprint_sel=array2table(mangrove_loss_footprint_sel,'VariableNames',select_countries);
mangrove_loss_footprint_sel.ISO_3Code= countries;
mangrove_loss_footprint_sel.ISO_3Code = cellfun(@(x) char(x),mangrove_loss_footprint_sel.ISO_3Code,'UniformOutput',false);
mangrove_loss_footprint_sel=outerjoin(mangrove_countries,mangrove_loss_footprint_sel,'Type','Left');
mangrove_loss_footprint_sel=mangrove_loss_footprint_sel(:,[ 1:7]);
writetable(mangrove_loss_footprint_sel, 'MLF_select.csv','WriteRowNames',true);

%% export and import

export_footprint=sum(mangrove_loss_footprint,2,"omitnan"); %sum of columns 
import_footprint=sum(mangrove_loss_footprint,"omitnan");  % sum of rows

change=loss*-1-import_footprint.' + export_footprint;
difference=loss*-1-change;
mangrove_change=[loss*-1,import_footprint.',export_footprint,change,difference];
mangrove_change=array2table(mangrove_change,'VariableNames',{'loss','import','export','change','difference'});
mangrove_change.ISO_3Code= countries;
mangrove_change=mangrove_change(:,[6 1:5]);
writetable(mangrove_change, 'MC_import_export.csv','WriteRowNames',true);

%% calculate domestic, adjacent and distant footfrint by rows and by columns

% by columns
domestic_footprint=transpose(sum(mangrove_loss_footprint .* domestic,1,"omitnan"));
adjacent_footprint=transpose(sum(mangrove_loss_footprint .* adjacent,1,"omitnan"));
distant_footprint=transpose(sum(mangrove_loss_footprint .* distant,1,"omitnan"));

loss_footprint=[domestic_footprint, adjacent_footprint,distant_footprint,domestic_footprint+adjacent_footprint+distant_footprint,transpose(import_footprint)];
loss_footprint_geo=array2table(loss_footprint,'VariableNames',{'domestic','adjacent','distant','sum_geo','sum_fp'});
loss_footprint_geo.ISO_3Code= countries;
loss_footprint_geo.ISO_3Code = cellfun(@(x) char(x),loss_footprint_geo.ISO_3Code,'UniformOutput',false);
% 
%loss_footprint_geo=outerjoin(countries,loss_footprint_geo,'Type','Left');
loss_footprint_geo_col=loss_footprint_geo(:,[6 1:3]);
writetable(loss_footprint_geo, 'MLF_dom_adj_dist_col.csv','WriteRowNames',true);

%% by rows
domestic_footprint=sum(mangrove_loss_footprint .* domestic,2,"omitnan");
adjacent_footprint=sum(mangrove_loss_footprint .* adjacent,2,"omitnan");
distant_footprint=sum(mangrove_loss_footprint .* distant,2,"omitnan");

loss_footprint=[domestic_footprint, adjacent_footprint,distant_footprint,domestic_footprint+adjacent_footprint+distant_footprint,export_footprint];
loss_footprint_geo=array2table(loss_footprint,'VariableNames',{'domestic','adjacent','distant','sum_geo','sum_fp'});
loss_footprint_geo.ISO_3Code= countries;
loss_footprint_geo.ISO_3Code = cellfun(@(x) char(x),loss_footprint_geo.ISO_3Code,'UniformOutput',false);
loss_footprint_geo=outerjoin(mangrove_countries,loss_footprint_geo,'Type','left' );
%loss_footprint_geo.Properties.VariableNames{'ISO_3Code_loss_footprint_geo'} = 'ISO_3Code_mangrove_countries'

loss_footprint_geo_row=loss_footprint_geo(:,[1:4]);
writetable(loss_footprint_geo, 'MLF_dom_adj_dist_row.csv','WriteRowNames',true);

%% save data
save("final/loss_footprint_Results.mat",'mangrove_loss_footprint','loss_footprint_geo_col','loss_footprint_geo_row','mangrove_change','mangrove_loss_footprint_sel','USA_ratio')

