cd /home/CAM/veralicona/shichao/

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
addpath (fullfile(mfilepath, './ScaleFree'))
addpath (fullfile(mfilepath, './Helper-scripts'))
cd ./MULAN
mln_generateParams

mex ../GENIE/RT/rtree-c/rtenslearn_c.c;
ext = mexext;
movefile(fullfile(pwd, ['rtenslearn_c' '.' ext]), fullfile('../GENIE/RT/', ...
                                                  ['rtenslearn_c' '.' ext]));

mln_CalEvaN scaleFree20_1 sim4 GenerateData/structureN20L20.mat nmmParams1 ...
    20 1 200 1 fMRI

mln_CalEvaN scaleFree20_2 sim4 GenerateData/structureN20L20.mat nmmParams2 ...
    20 1 200 1 fMRI

mln_CalEvaN scaleFree20_3 sim4 GenerateData/structureN20L20.mat nmmParams3 ...
    20 1 200 1 fMRI

mln_CalEvaN scaleFree20_4 sim4 GenerateData/structureN20L20.mat nmmParams4 ...
    20 1 200 1 fMRI

mln_CalEvaN scaleFree20_5 sim4 GenerateData/structureN20L20.mat nmmParams5 ...
    20 1 200 1 fMRI

mln_CalEvaN scaleFree20_6 sim4 GenerateData/structureN20L20.mat nmmParams6 ...
    20 1 200 1 fMRI


mln_CalEvaN scaleFree20b_1 sim4 GenerateData/structureN20L24.mat nmmParams1 ...
    20 1 200 1 fMRI

mln_CalEvaN scaleFree20b_2 sim4 GenerateData/structureN20L24.mat nmmParams2 ...
    20 1 200 1 fMRI

mln_CalEvaN scaleFree20b_3 sim4 GenerateData/structureN20L24.mat nmmParams3 ...
    20 1 200 1 fMRI

mln_CalEvaN scaleFree20b_4 sim4 GenerateData/structureN20L24.mat nmmParams4 ...
    20 1 200 1 fMRI

mln_CalEvaN scaleFree20b_5 sim4 GenerateData/structureN20L24.mat nmmParams5 ...
    20 1 200 1 fMRI

mln_CalEvaN scaleFree20b_6 sim4 GenerateData/structureN20L24.mat nmmParams6 ...
    20 1 200 1 fMRI


mln_CalEvaN random20_1 sim4 GenerateData/structureN20L72.mat nmmParams1 ...
    20 1 200 1 fMRI

mln_CalEvaN random20_2 sim4 GenerateData/structureN20L72.mat nmmParams2 ...
    20 1 200 1 fMRI

mln_CalEvaN random20_3 sim4 GenerateData/structureN20L72.mat nmmParams3 ...
    20 1 200 1 fMRI

mln_CalEvaN random20_4 sim4 GenerateData/structureN20L72.mat nmmParams4 ...
    20 1 200 1 fMRI

mln_CalEvaN random20_5 sim4 GenerateData/structureN20L72.mat nmmParams5 ...
    20 1 200 1 fMRI

mln_CalEvaN random20_6 sim4 GenerateData/structureN20L72.mat nmmParams6 ...
    20 1 200 1 fMRI