% Generate ROC curves for all methods. Initial argument is the Meths struct from AUC
function genROC(Meths)
  x = Meths.Fpr;
  y = Meths.Tpr;
  x = x';
  y = y';
  figure;
  plot(x,y);
  legend(Meths.Methodnames, 'Location', 'southoutside');
  saveas(gcf, 'AUCplot.pdf');
