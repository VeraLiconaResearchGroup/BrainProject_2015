function multisub_rand(start, finish)
  extraZero = '00';
  parfor i=str2num(start):str2num(finish)
    if i < 100 & i > 9
        extraZero = '0';
    elseif i >= 100
        extraZero = '';
    end
    fileID = fopen(['rand_' extraZero int2str(i) '.txt']);
    orig = textscan(fileID, '%d %d');
    fclose(fileID);
    fildID = fopen('attributes.txt');
    att = textscan(fileID, '%d %d');
    fclose(fileID);
    nodes = cell2mat(att(1));
    edges = cell2mat(att(2));
    nodes1 = cell2mat(orig(1));
    nodes2 = cell2mat(orig(2));
    PGS = cell(1);
    matrix = zeros(2,edges);
    for n=1:edges(i,2)
        matrix(2,n) = int32(nodes1(n,1)+1);
        matrix(1,n) = int32(nodes2(n,1)+1);
    end
    PGS{1,1} = matrix;
    save(['GenerateData/structure_rand' int2str(i) 'N' int2str(nodes(i,1)) 'L' int2str(edges(i,2)) '.mat'], 'PGS');
    foldername = ['rand_Sub', extraZero, num2str(i)];
    mln_CalEvaN([foldername],[foldername], ['GenerateData/structure_rand' int2str(i) 'N' int2str(nodes(i,1)) 'L' int2str(edges(i,2))], 'nmmParams', [int2str(nodes(i,1))], '1', '204', '1', 'fMRI');
  end
