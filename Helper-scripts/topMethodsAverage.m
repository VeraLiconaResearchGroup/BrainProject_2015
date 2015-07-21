function topMethodsAverage(path)

cd(path);
d = dir;
isub = [d(:).isdir];
folderNames = {d(isub).name}';
folderNames(ismember(folderNames,{'.','..'})) = [];

meths = cell.empty(44,0);
aucs = double.empty(44,0);
ppv = double.empty(44,0);
aac = double.empty(44,0);

parfor k=1:length(folderNames)
    dirname = ['./', folderNames{k}, '/AUC/'];
    filename = dir([dirname '*.mat']);
    filename = filename.name;
    
    prenom = strsplit(filename, {'_', '.'});
    mln_MethodStructuresAUC(folderNames{k},prenom{2});
end

for k=1:length(folderNames)
    dirname = ['./', folderNames{k}, '/AUC/'];
    filename = dir([dirname '*.mat']);
    filename = filename.name;
        
    l = load([dirname filename]);
    
    meths = l.Meths.Methodnames;
    aucs = horzcat(aucs, l.Meths.MSAUC);
    ppv = horzcat(ppv, max(l.Meths.PPV,[], 2));
    aac = horzcat(aac, max(l.Meths.AAC,[], 2));
    
end

means = mean(aucs,2);
stds = std(aucs, 0, 2);
[result, index] = sortrows(horzcat(meths, num2cell(means), num2cell(stds)), -2);
disp(result)

means = mean(ppv,2);
stds = std(ppv, 0, 2);
[result, index] = sortrows(horzcat(meths, num2cell(means), num2cell(stds)), -2);
disp(result)

means = mean(aac,2);
stds = std(aac, 0, 2);
[result, index] = sortrows(horzcat(meths, num2cell(means), num2cell(stds)), -2);
disp(result)