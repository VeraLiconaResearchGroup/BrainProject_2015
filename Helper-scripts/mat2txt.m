load('testfile.mat');
outfile = {'testfile.txt'};
header={1:size(LFP)};
fid = fopen(outfile, 'w');
fprintf(fid, '%d\t', header{:});
fprintf(fid, '\n');
fclose(fid);
dlmwrite(outfile,LFP','delimiter','\t','-append');​
