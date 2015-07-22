function consensusNetworks(path)

cd(path);
d = dir;
isub = [d(:).isdir];
folderNames = {d(isub).name}';
folderNames(ismember(folderNames,{'.','..'})) = [];

parfor k=1:length(folderNames)
    dirname = ['./', folderNames{k}, '/AUC/'];
    filename = dir([dirname '*.mat']);
    filename = filename.name;
    
    prenom = strsplit(filename, {'_', '.'});
    
    addConsensusNetworks(folderNames{k}, prenom);
end