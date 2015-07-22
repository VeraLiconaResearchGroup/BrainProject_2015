% Huifang Wang, Sep. 26, 2013
% Huifang Wang, Nov. 26, 2013 update Method Structure AUC for mlnI
function flg=mln_MethodStructuresAUCextended(dirname,prenom)

flg=0; % flg for the error


filename1=['./',dirname,'/ToutResults/Tout_',prenom,'.mat'];
calresult=load(filename1);

filename=['./',dirname,'/AUC/AUC_',prenom,'.mat'];
results=load(filename);
AUC=results.('Meths').MSAUC;
names=cell(10,1);
row = zeros(10:1);
for i=1:size(AUC)
  row(i,1) = i;
end
AUC = horzcat(AUC, row);
AUC = sortrows(AUC, 1);
AUC = AUC(size(AUC)-9:size(AUC),1:2);

for i=1:10
  name = sprintf('%s', results.('Meths').Methodnames{AUC(i,2)});
  names(i,:) = {name};
end

fieldname=fieldnames(calresult);
% remove params and connectivity
fieldname(strcmp('Params',fieldname))=[];
fieldname(strcmp('Connectivity',fieldname))=[];

consensus44=zeros(size(calresult.Connectivity,1));
consensus42=zeros(size(calresult.Connectivity,1));
consensus2=zeros(size(calresult.Connectivity,1));
consensustop10=zeros(size(calresult.Connectivity,1));

for i=1:10
  methodname = fieldname{AUC(i,2)};
  mat = calresult.(methodname);
  if isnan(max(mat))
      mat = 0;
  end
  consensustop10 = consensustop10 + mat;
end
consensustop10 = consensustop10/10;

for i=1:length(fieldname)
  methodname = fieldname{i};
  mat = calresult.(methodname);
  if isnan(max(mat))
      mat = 0;
  end
  consensus44 = consensus44+mat;
  if(i<=42)
    consensus42 = consensus42+mat;
  else
    consensus2 = consensus2+mat;
  end
end

assignin('base','con44in', consensus44);
consensus44 = consensus44/44;
consensus42 = consensus42/42;
consensus2 = consensus2/2;
assignin('base','con44end', consensus44);

calresult.('Consensus44') = consensus44;
calresult.('Consensus42') = consensus42;
calresult.('Consensus2') = consensus2;
calresult.('ConsensusTop10') = consensustop10;

save(['./',dirname,'/ToutResults/Tout_',prenom,'.mat'], '-struct', 'calresult');
%%
%idx=find(strcmp('pCOH1',fieldname));
%fieldname(idx)=[];
%%
Nmethod=length(fieldname);
Meths.MSAUC=zeros(Nmethod,1);
Meths.Mth=zeros(Nmethod,1);
Meths.Fpr=zeros(Nmethod,100);
Meths.Tpr=zeros(Nmethod,100);
Meths.PPV=zeros(Nmethod,100);
Meths.ACC=zeros(Nmethod,100);

filesaved=['AUC_',prenom,'_extended.mat'];

Meths.Methodnames=fieldname;

Meths.Connectivity=calresult.Connectivity;

for imethod=1:Nmethod
    Methods=fieldname{imethod};
    Mat=calresult.(Methods);
    if isnan(max(Mat))
        
        auc=0;
        chis=1;
        iMat=NaN(size(Mat,1));
        Fpr=zeros(100,1);
        Tpr=zeros(100,1);
        PPV=zeros(100,1);
        ACC=zeros(100,1);
        
    else
        disp(Methods);  
        iMat=mean(abs(Mat),3);
        %iMat=abs(Mat);
        iMat=iMat-diag(diag(iMat));
        [~,~,~,Fpr,Tpr,~,~,~,auc,~,thresh3,PPV,ACC]=mln_calcFalseRateextended(iMat,calresult.Connectivity,mln_issymetricM(Methods),1);
        chis=mln_chis(Mat,thresh3(1));
    end
    Meths.MSAUC(imethod,1)=auc;
    Meths.Fpr(imethod,:) = squeeze(Fpr);
    Meths.Tpr(imethod,:) = squeeze(Tpr);
    Meths.PPV(imethod,:) = squeeze(PPV);
    Meths.ACC(imethod,:) = squeeze(ACC);
    
    if isempty(chis)
        pause
    end
    
    Meths.Mth(imethod,1)=chis;
    Meths.Mat(:,:,imethod)=iMat;
end


save(['./',dirname,'/AUC/',filesaved],'Meths');