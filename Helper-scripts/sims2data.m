function sims = sims2data(sims)
  for i=1:sims.Nsubjects
    sim.LFP = sims.ts(int32(i-1)*200,:)';
    sim.Connectivity = sims.net(i,:,:);
    sim.Params = zeros(1,1);
    sim.Params.fs = 0.500;
  end
