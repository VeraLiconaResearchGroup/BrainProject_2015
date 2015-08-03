% Converts the time series from a MULAN dataset into a DREAM5 software compatible format
% filename = name of MULAN mat file to be converted into txt file
function mat2txt(filename)
load([filename, '.mat']);
outfile = [filename, '.txt'];
header={1:size(LFP)};
fid = fopen(outfile, 'w');
fprintf(fid, '%d\t', header{:});
fprintf(fid, '\n');
fclose(fid);
dlmwrite(outfile,LFP','delimiter','\t','-append');​
