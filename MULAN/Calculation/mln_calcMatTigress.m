function mln_calcMatTigress(Resultfile,VMethlog,lfp,params)

if iscell(VMethlog)
    Methlog=char(VMethlog{1});
else
    Methlog=VMethlog;
end

NMlog=length(Methlog);
if exist(Resultfile,'file')
    Rconnect=load(Resultfile);
    oddfieldname=fieldnames(Rconnect);
    if  ~isempty(find(strncmpi(oddfieldname,Methlog,NMlog)==1,1))% if there is results about 'Methlog'
                                                                 % try to find the results with the same parameters
        Nmethlog=length(Rconnect.(Methlog));
        for i=1:Nmethlog
            if mln_compareparams(Rconnect.(Methlog)(i).Params,params)  
                %Net=Rconnect.(Methlog)(i);
                return;
            end
        end
    end
end
%% if there is not the result then calculate

[Nchannel, Ntime]=size(lfp);

if ~params.overlap==0
    overlap_p=params.wins*params.overlap;
    Nwindows=floor((Ntime-overlap_p)/(params.wins-overlap_p));
else
    overlap_p=0;
    Nwindows=floor(Ntime/params.wins);
end


% initialization
Dmatt=[Nchannel,Nchannel,Nwindows];
NMeths=length(VMethlog);
for i=1:NMeths
    iMeth=char(VMethlog{i});
    if ~isempty(iMeth)       
        Mat.(iMeth)=zeros(Dmatt);
    end
end


VMethodlog=fieldnames(Mat);
Nmethod=length(VMethodlog);
for i=1:Nwindows
    i_lfp=lfp(:,floor((i-1)*(params.wins-overlap_p)+1):floor(i*params.wins-(i-1)*overlap_p));
    data.expdata = lfp';
    R = params.tigressR;
    alpha = params.tigressAlpha;
    L = params.tigressL;

    if round(params.tigressLarsAlgo) == 0
        LarsAlgo = 'lars';
    else
        LarsAlgo = 'glmnet';
    end
    
    if round(params.tigressScoreMethod) == 0
        method = 'area';
    else
        method = 'original';
    end
    
    freq = tigress(data, 'R', R, 'alpha', alpha, 'L', L, 'LarsAlgo', ...
                   LarsAlgo);
    iMat=score_edges(freq, 'method', method);   
        
    for j=1:Nmethod
        jMethodlog=char(VMethodlog(j));
        
        Mat.(jMethodlog)(:,:,i)=iMat;
    end
    
end

updateResult(Resultfile,Mat,params);