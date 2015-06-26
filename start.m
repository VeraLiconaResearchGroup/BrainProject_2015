mfilepath=pwd
addpath(fullfile(mfilepath, './MULAN'))
addpath (fullfile(mfilepath, './MULAN/Calculation'))
addpath (fullfile(mfilepath, './MULAN/ClusterComputation'))
addpath (fullfile(mfilepath, './MULAN/Evaluation'))
addpath (fullfile(mfilepath, './MULAN/Examples'))
addpath (fullfile(mfilepath, './MULAN/Examples/data'))
addpath (fullfile(mfilepath, './MULAN/Examples/Results'))
addpath (fullfile(mfilepath, './MULAN/GenerateData'))
addpath (fullfile(mfilepath, './MULAN/Interface'))
addpath (fullfile(mfilepath, './GENIE'))
addpath (fullfile(mfilepath, './GENIE/RT'))
addpath (fullfile(mfilepath, './TIGRESS'))
addpath (fullfile(mfilepath, './TIGRESS/lars'))
cd ./MULAN
mln_generateParams
mln_CalEvaN nmm nmm GenerateData/structureN5L5 nmmParams 5 20 3000 1 fMRI