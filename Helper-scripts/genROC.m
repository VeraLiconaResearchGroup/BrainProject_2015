function genROC(Meths)
  x = Meths.Fpr;
  y = Meths.Tpr;
  x = x';
  y = y';
  plot(x,y);
  legend(Meths.Methodnames, 'Location', 'southoutside');
