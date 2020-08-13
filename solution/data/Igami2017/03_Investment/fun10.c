#include "mex.h"  /* Always include this */
#include <math.h>  /* For mathematical functions */
#include "stdio.h" /* For mathematical functions */

/* Declare math functions */
double exp(double exponent);
double pow(double base, double exponent);

/* The gateway routine */
void mexFunction(int nlhs, mxArray *plhs[],     /* Output variables */
        int nrhs, const mxArray *prhs[])        /* Input variables  */
{
    double *z10;
    double z5;
    double beta, kappa_ent, delta, year;
   
    /* Fool-proof for # Matlab inputs. */
    if(nrhs != 5)
        mexErrMsgTxt("fun10: 5 input arguments required.");
    
    /* Read inputs. */
    z5 =        mxGetScalar(prhs[0]);   /* EV_new for entering PE. */
    beta =      mxGetScalar(prhs[1]);
    kappa_ent = mxGetScalar(prhs[2]);
    delta =     mxGetScalar(prhs[3]);
    year =      mxGetScalar(prhs[4]);
        
    /* Initialize output. */
    plhs[0] = mxCreateDoubleMatrix(1, 1, mxREAL);
    z10 = mxGetPr(plhs[0]);
    
    /* Calculate choice probability, of Potential Entrant's entry. */
    *z10 = exp(beta * z5 - kappa_ent * pow(delta,year-1)) / 
            (exp(0) + exp(beta * z5 - kappa_ent * pow(delta,year-1)));

    return;    
}
