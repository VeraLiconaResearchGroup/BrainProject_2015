%Modification from go_all.m from DREAM5 evaluation script
DIR = '../data';
methods = directory_list(DIR);
method = methods{1};
%%%%%
load(DIR '_fMRI_method_' method '.mat');
outfile = {DIR '_fMRI_method_' method '.txt'};
header={1:size(LFP)};
fid = fopen(outfile, 'w');
fprintf(fid, '%d\t', header{:});
fprintf(fid, '\n');
fclose(fid);
dlmwrite(outfile,LFP','delimiter','\t','-append');​
