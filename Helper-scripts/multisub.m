function multisub(name, start, finish)
  extraZero = '00';
  for i=str2num(start):str2num(finish)
    if i < 100 & i > 9
        extraZero = '0';
    elseif i >= 100
        extraZero = '';
    end
    foldername = [name, '_Sub', extraZero, num2str(i)];
    mkdir('./', foldername);
    dir = [foldername];
    mkdir(dir, 'AUC');
    mkdir(dir, 'data');
    mkdir(dir, 'Results');
    mkdir(dir, 'ToutResults');
    genData([foldername,'.txt'], foldername);
  end
