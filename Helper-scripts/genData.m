function genData(filename, foldername)
    fileID=fopen(['datafolder/', filename]);
    header  = textscan(fileID, '%s', 1);
    LFP = textscan(fileID, ['%f', repmat('%f',[1,48])], 'CollectOutput', 1);
    LFP = cell2mat(LFP);
    LFP = LFP';
    Connectivity = zeros(49,49);
    Params.fs = 0.500;
    save([foldername, '/data/', foldername,'fmriCS100S1N49.mat'], 'LFP', 'Connectivity', 'Params');
    mln_CalEvaN([foldername], [foldername], 'MULAN/GenerateData/structureN49L0', 'nmmParams', 49, 1, 204, 1, 'fMRI');
