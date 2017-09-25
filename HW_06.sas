data Depression;
set "F:\SAS\Depression";
run;

/*--------------14.1------------*/
Title "PCA of last seven variables of Depression data set";
   proc princomp data=depression out=depress_pca;
   	 var DRINK HEALTH REG_DOC TREATED BEDDAYS ACUTE_ILLNESS CHRON_ILLNESS;
run;
quit;

/*--------------14.6------------*/
data Lung;
set "F:\SAS\Lung";
run;

data Lung_w_ratio;
	set Lung;
	Ratio_father = FEV1_father / FVC_father;
run;

Title "Correlation between RATIO_father, FEV1_father and FVC_father";
proc corr data=Lung_w_ratio;
	var RATIO_father FVC_father;
run;
quit;

Title "PCA of FEV1_father and FVC_father";
proc princomp data=Lung_w_ratio out=Lung_w_pca;
	var FEV1_father FVC_father;
run;
quit;

Title "Plot of Principal Components of FEV1_father and FVC_father";
proc sgplot data=Lung_w_pca; 
    scatter x = Prin1 y= Prin2 ;
    ellipse x = Prin1 y= Prin2;
quit;

Title "PCA of FEV1_father, FVC_father and Ratio_father";
proc princomp data=Lung_w_ratio out=Lung_w_ratio_pca;
	var FEV1_father FVC_father Ratio_father;
run;
quit;

Title "PCA of Age, Height and Weight of Oldest Child";
proc princomp data=Lung out=Lung_oldest_child_pca;
	var Age_oldest_child Height_oldest_child Weight_oldest_child;
run;
