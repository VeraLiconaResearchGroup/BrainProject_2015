function topMethods(path)

cd(path);
d = dir;
isub = [d(:).isdir];
folderNames = {d(isub).name}';
folderNames(ismember(folderNames,{'.','..'})) = [];

meths = cell.empty(44,0);
aucs = int64.empty(44,0);
ppv = int64.empty(44,0);
acc = int64.empty(44,0);

%Average
for k=1:length(folderNames)
    dirname = ['./', folderNames{k}, '/AUC/'];
    filename = dir([dirname '*.mat']);
    filename = filename.name;
        
    l = load([dirname filename]);
    
    meths = l.Meths.Methodnames;
    aucs = horzcat(aucs, l.Meths.MSAUC);
    ppv = horzcat(ppv, max(l.Meths.PPV,[], 2));
    acc = horzcat(acc, max(l.Meths.ACC,[], 2));
    
end

means = mean(aucs,2);
stds = std(aucs, 0, 2);
[result, index] = sortrows(horzcat(meths, num2cell(means), num2cell(stds)), -2);
disp(result)

means = mean(ppv,2);
stds = std(ppv, 0, 2);
[result, index] = sortrows(horzcat(meths, num2cell(means), num2cell(stds)), -2);
disp(result)

means = mean(acc,2);
stds = std(acc, 0, 2);
[result, index] = sortrows(horzcat(meths, num2cell(means), num2cell(stds)), -2);
disp(result)


%Rank
for k=1:length(folderNames)
    dirname = ['./', folderNames{k}, '/AUC/'];
    filename = dir([dirname '*.mat']);
    filename = filename.name;
        
    l = load([dirname filename]);
    
    meths = l.Meths.Methodnames;
    [~, aucRank] = sort(l.Meths.MSAUC);
    [~, ppvRank] = sort(max(l.Meths.PPV,[], 2));
    [~, accRank] = sort(max(l.Meths.ACC,[], 2));
    
    aucs = horzcat(aucs, aucRank);
    ppv = horzcat(ppv, ppvRank);
    acc = horzcat(acc, accRank);    
end

sums = sum(aucs,2);
[result, index] = sortrows(horzcat(meths, num2cell(sums)), 2);
disp(result)

sums = sum(ppv,2);
[result, index] = sortrows(horzcat(meths, num2cell(sums)), 2);
disp(result)

sums = sum(acc,2);
[result, index] = sortrows(horzcat(meths, num2cell(sums)), 2);
disp(result)