#delimit ;
clear; clear matrix;
 
cd "C:\Users\Michi\Documents\My Dropbox\1_HDD\110726_Stata_Demand";
log using 110728_LogitRegression_4a.smcl, replace;
set mem 10m;
set more off;

* ####################;
* OLS & IV REGRESSIONS;
* ####################;

use "110728_Demand4a.dta";
drop if priceIV1 == .;

* ######## DEF 4a: LOGIT (OLS) ########;
xi: reg lnsjs0 p98 lncapaMB _3inch _NonUS _PCM i.year, robust;

* ######## DEF 4a: LOGIT (IV-1) ########;
xi: ivreg2 lnsjs0 (p98 = FrontierCapacityOfDiameter
			 NofYearsInMktOfDiameterCapacity
			 NofYearsInMktOfDiameter 
			 NofFirmsInDiameter 
			 NofProductsInDiameter 
			 NofFirmsInDiameterCapacity) 
 lncapaMB _3inch _NonUS _PCM i.year, gmm2s robust first;

* ######## DEF 4a: LOGIT (IV-2) ########;
xi: ivreg2 lnsjs0 (p98 = priceIV1) 
 lncapaMB _3inch _NonUS _PCM i.year, gmm2s robust first;

* ######## DEF 4a: LOGIT (IV-3) ########;
xi: ivreg2 lnsjs0 (p98 = priceIV1 
			 FrontierCapacityOfDiameter
			 NofYearsInMktOfDiameterCapacity
			 NofYearsInMktOfDiameter 
			 NofFirmsInDiameter 
			 NofProductsInDiameter 
			 NofFirmsInDiameterCapacity) 
 lncapaMB _3inch _NonUS _PCM i.year, gmm2s robust first;

* ######## DEF 4a: NESTED LOGIT (OLS) ########;
xi: reg lnsjs0 p98 lnsjd lncapaMB _3inch _NonUS _PCM i.year, robust;

* ######## DEF 4a: NESTED LOGIT (IV-1) ########;
xi: ivreg2 lnsjs0 (p98 lnsjd = FrontierCapacityOfDiameter
			 NofYearsInMktOfDiameterCapacity
			 NofYearsInMktOfDiameter 
			 NofFirmsInDiameter 
			 NofProductsInDiameter 
			 NofFirmsInDiameterCapacity) 
 lncapaMB _3inch _NonUS _PCM i.year, gmm2s robust first;

* ######## DEF 4a: NESTED LOGIT (IV-2) ########;
xi: ivreg2 lnsjs0 (p98 lnsjd = priceIV1 priceIV2) 
 lncapaMB _3inch _NonUS _PCM i.year, gmm2s robust first;

* ######## DEF 4a: NESTED LOGIT (IV-3) ########;
xi: ivreg2 lnsjs0 (p98 lnsjd = priceIV1 
			 FrontierCapacityOfDiameter
			 NofYearsInMktOfDiameterCapacity
			 NofYearsInMktOfDiameter 
			 NofFirmsInDiameter 
			 NofProductsInDiameter 
			 NofFirmsInDiameterCapacity) 
 lncapaMB _3inch _NonUS _PCM i.year, gmm2s robust first;

* --------------------------------------------;

log close;