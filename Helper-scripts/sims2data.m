%Converts the NetSim data into a MULAN time series dataset
function sims2data(simname)
sims = load([simname '.mat']);
  for i=1:sims.Nsubjects
    LFP = sims.ts(((i-1)*sims.Ntimepoints)+1:(i*sims.Ntimepoints),:)';
    Connectivity = squeeze(sims.net(i,:,:));
    Params.fs = 0.500;
    save([simname,'_N',num2str(sims.Nnodes),'T',num2str(sims.Ntimepoints),'_', num2str(i), '.mat'], 'LFP', 'Connectivity', 'Params');
  end
