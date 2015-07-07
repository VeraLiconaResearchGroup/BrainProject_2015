function genTopROC(filename, number)
  load([filename '.mat']);
  AUC = Meths.MSAUC;
  row = zeros(size(AUC):1);
  for i=1:size(AUC)
    row(i,1) = i;
  end
  AUC = horzcat(AUC, row);
  AUC = sortrows(AUC, 1);
  AUC = AUC(size(AUC)-number+1:size(AUC),1:2);
  FPR = Meths.Fpr';
  TPR = Meths.Tpr';
  x = FPR(:,AUC(1,2));
  y = TPR(:,AUC(1,2));
  names = Meths.Methodnames(1,:);
  for i=2:number
    x = horzcat(x, FPR(:,AUC(i,2)));
    y = horzcat(y, TPR(:,AUC(i,2)));
    names = [names, Meths.Methodnames(AUC(i,2),:)];
  end
  figure;
  plot(x,y);
  legend(names, 'Location', 'eastoutside');
  saveas(gcf, [filename '_top' int2str(number) 'ROC.pdf']);
