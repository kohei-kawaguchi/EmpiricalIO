#delimit ;
clear; clear matrix;

cd "C:\Users\Michi\Documents\My Dropbox\1_HDD\110726_Stata_Demand";
log using 110728_LogitRegression_1abc.smcl, replace;
set mem 10m;
set more off;

* ####################;
* OLS & IV REGRESSIONS;
* ####################;

use "110728_Demand1a.dta";

* ######## DEF 1a: LOGIT (OLS) ########;
xi: reg lnsjs0 p98 lncapaMB _3inch i.year, robust;

* ######## DEF 1a: LOGIT (IV) ########;
xi: ivreg2 lnsjs0 (p98 = FrontierCapacityOfDiameter
			 NofYearsInMktOfDiameterCapacity
			 NofYearsInMktOfDiameter 
			 NofFirmsInDiameter 
			 NofProductsInDiameter 
			 NofFirmsInDiameterCapacity) 
 lncapaMB _3inch i.year, gmm2s robust first;

* ######## DEF 1a: NESTED LOGIT (OLS) ########;
xi: reg lnsjs0 p98 lnsjd lncapaMB _3inch i.year, robust;

* ######## DEF 1a: NESTED LOGIT (IV) ########;
xi: ivreg2 lnsjs0 (p98 lnsjd = FrontierCapacityOfDiameter
			 NofYearsInMktOfDiameterCapacity
			 NofYearsInMktOfDiameter 
			 NofFirmsInDiameter 
			 NofProductsInDiameter 
			 NofFirmsInDiameterCapacity) 
 lncapaMB _3inch i.year, gmm2s robust first;

* --------------------------------------------;

use "110728_Demand1b.dta";

* ######## DEF 1b: LOGIT (OLS) ########;
xi: reg lnsjs0 p98 lncapaMB _3inch i.year, robust;

* ######## DEF 1b: LOGIT (IV) ########;
xi: ivreg2 lnsjs0 (p98 = FrontierCapacityOfDiameter
			 NofYearsInMktOfDiameterCapacity
			 NofYearsInMktOfDiameter 
			 NofFirmsInDiameter 
			 NofProductsInDiameter 
			 NofFirmsInDiameterCapacity) 
 lncapaMB _3inch i.year, gmm2s robust first;

* ######## DEF 1b: NESTED LOGIT (OLS) ########;
xi: reg lnsjs0 p98 lnsjd lncapaMB _3inch i.year, robust;

* ######## DEF 1b: NESTED LOGIT (IV) ########;
xi: ivreg2 lnsjs0 (p98 lnsjd = FrontierCapacityOfDiameter
			 NofYearsInMktOfDiameterCapacity
			 NofYearsInMktOfDiameter 
			 NofFirmsInDiameter 
			 NofProductsInDiameter 
			 NofFirmsInDiameterCapacity) 
 lncapaMB _3inch i.year, gmm2s robust first;

* --------------------------------------------;

use "110728_Demand1c.dta";

* ######## DEF 1c: LOGIT (OLS) ########;
xi: reg lnsjs0 p98 lncapaMB _3inch i.year, robust;

* ######## DEF 1c: LOGIT (IV) ########;
xi: ivreg2 lnsjs0 (p98 = FrontierCapacityOfDiameter
			 NofYearsInMktOfDiameterCapacity
			 NofYearsInMktOfDiameter 
			 NofFirmsInDiameter 
			 NofProductsInDiameter 
			 NofFirmsInDiameterCapacity) 
 lncapaMB _3inch i.year, gmm2s robust first;

* ######## DEF 1c: NESTED LOGIT (OLS) ########;
xi: reg lnsjs0 p98 lnsjd lncapaMB _3inch i.year, robust;

* ######## DEF 1c: NESTED LOGIT (IV) ########;
xi: ivreg2 lnsjs0 (p98 lnsjd = FrontierCapacityOfDiameter
			 NofYearsInMktOfDiameterCapacity
			 NofYearsInMktOfDiameter 
			 NofFirmsInDiameter 
			 NofProductsInDiameter 
			 NofFirmsInDiameterCapacity) 
 lncapaMB _3inch i.year, gmm2s robust first;

* --------------------------------------------;

log close;