%Converts the NetSim data into a MULAN time series dataset
sims2data(sims)
  for i=1:sims.Nsubjects
    LFP = sims.ts(int32(i-1)*200,:)';
    Connectivity = sims.net(i,:,:);
    Params = zeros(1,1);
    Params.fs = 0.500;
    save(sims '_' i '.mat', 'LFP', 'Connectivity', 'Params');
  end
