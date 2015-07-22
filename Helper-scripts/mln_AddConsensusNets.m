% Huifang Wang, Sep. 26, 2013
% Huifang Wang, Nov. 26, 2013 update Method Structure AUC for mlnI
function flg=mln_AddConsensusNets(dirname,prenom)

flg=0; % flg for the error

topTen = {'' '' '' '' '' '' '' '' '' ''};
molecMeths ={'Genie' 'Tigress'};
exclude = {'AllMethods' 'NeuroMethods' 'MolecBioMethods' 'Top10' 'BCohW' 'PCohW' ...
           'pCOH1'};

filename1=['./',dirname,'/ToutResults/Tout_',prenom,'.mat'];
calresult=load(filename1);

fieldname=fieldnames(calresult);

consensustop10=zeros(size(calresult.Connectivity,1));

count = 0.0;
for i=1:10
  methodname = fieldname{topTen{i}};
  mat = calresult.(methodname);
  if any(isnan(Mat(:)))
  else
      consensustop10 = consensustop10 + mat;
      count = count + 1;
  end
end
consensustop10 = consensustop10/double(count);

molecCount = 0.0;
brainCount = 0.0;
consensus44=zeros(size(calresult.Connectivity,1));
consensus42=zeros(size(calresult.Connectivity,1));
consensus2=zeros(size(calresult.Connectivity,1));

for i=1:length(fieldname)
  methodname = fieldname{i};
  mat = calresult.(methodname);
  
  if any(isnan(Mat(:))) | ismember(methodname, exclude)
  else
      if ismember(methodname, molecMeths)
          consensus2 = consensus2+mat;
          molecCount = molecCount + 1;
      else
          consensus42 = consensus42+mat;
          brainCount = brainCount + 1;
      end
      
      consensus44 = consensus44+mat;
  end 
end

consensus44 = consensus44/double(brainCount + molecCount);
consensus42 = consensus42/double(brainCount);
consensus2 = consensus2/double(molecCount);

calresult.('AllMethods') = consensus44;
calresult.('NeuroMethods') = consensus42;
calresult.('MolecBioMethods') = consensus2;
calresult.('Top10') = consensustop10;

save(['./',dirname,'/ToutResults/Tout_',prenom, '_extended', '.mat'], '-struct', 'calresult');