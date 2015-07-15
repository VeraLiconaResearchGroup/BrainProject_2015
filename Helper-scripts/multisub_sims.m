function multisub_sims(simname, start, finish)
sims = load([simname '.mat']);

%Convert first time series and create structure file
strname = ['GenerateData/structureN' int2str(sims.Nnodes) 'L' int2str(edges) '.mat']
if ~exist([strname], 'file')
  PGS = cell(1);
  matrix = [];
  edges = int32(nnz(squeeze(sims.net(1,:,:))) - sims.Nnodes);
  counter = 1;
  for i=1:sims.Nnodes;
      for j=1:sims.Nnodes;
          if Connectivity(i,j)>0
              matrix(2,counter)=i;
              matrix(1,counter)=j;
              counter = counter + 1;
         end
     end
  end
  PGS{1,1} = matrix;
  save([strname], 'PGS');
end

%Convert the remaining time series
extraZero = '00';
  for i=str2num(start):str2num(finish)
    if i < 100 & i > 9
        extraZero = '0';
    elseif i >= 100
        extraZero = '';
    end
   foldername = [simname, '_sub', extraZero, num2str(i)];
   mkdir(foldername);
   dir = [foldername];
   mkdir(dir, 'AUC');
   mkdir(dir, 'data');
   mkdir(dir, 'Results');
   mkdir(dir, 'ToutResults');
   
   LFP = sims.ts(((n-1)*sims.Ntimepoints)+1:(n*sims.Ntimepoints),:)';
   Connectivity = squeeze(sims.net(n,:,:));
   Params.fs = 0.500;
   save([foldername, '/data/', simname,'_', num2str(n), 'fmriCS100S1N', num2str(sims.Ntimepoints), '.mat'], 'LFP', 'Connectivity', 'Params');
   mln_CalEvaN([foldername],[foldername], ['GenerateData/structureN' int2str(sims.Nnodes) 'L' int2str(edges) '.mat'], 'nmmParams', [sims.Nnodes], '1', [sims.Ntimepoints], '1', 'fMRI');
end
