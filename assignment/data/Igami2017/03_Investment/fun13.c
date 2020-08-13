#include "mex.h"  /* Always include this */
#include <math.h>  /* For mathematical functions */
#include "stdio.h" /* For mathematical functions */

/* Declare math functions */
double exp(double exponent);
double log(double antilog);
        
/* The gateway routine */
void mexFunction(int nlhs, mxArray *plhs[],     /* Output variables */
        int nrhs, const mxArray *prhs[])        /* Input variables  */
{
    double *z13;
    double z4;
    double beta, phi;
   
    /* Fool-proof for # Matlab inputs. */
    if(nrhs != 3)
        mexErrMsgTxt("fun13: 3 input arguments required.");
    
    /* Read inputs. */
    z4 =        mxGetScalar(prhs[0]);   /* EV_both for staying Both firm. */
    beta =      mxGetScalar(prhs[1]);
    phi =       mxGetScalar(prhs[2]);
        
    /* Initialize output. */
    plhs[0] = mxCreateDoubleMatrix(1, 1, mxREAL);
    z13 = mxGetPr(plhs[0]);
    
    /* Calculate choice probability, of Old firm's exit. */
    *z13 = log(1 + exp(phi + beta * z4));

    return;    
}
