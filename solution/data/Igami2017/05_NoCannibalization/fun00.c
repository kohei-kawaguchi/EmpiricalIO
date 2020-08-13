#include "mex.h"  /* Always include this */
#include <math.h>  /* For mathematical functions */
#include "stdio.h" /* For mathematical functions */

/* Declare math functions */
double exp(double exponent);

/* The gateway routine */
void mexFunction(int nlhs, mxArray *plhs[],     /* Output variables */
        int nrhs, const mxArray *prhs[])        /* Input variables  */
{
    double *z00;
    double z0;
    double beta, phi;
   
    /* Fool-proof for # Matlab inputs. */
    if(nrhs != 3)
        mexErrMsgTxt("fun00: 3 input arguments required.");
    
    /* Read inputs. */
    z0 =        mxGetScalar(prhs[0]);   /* EV_new for staying New firm. */
    beta =      mxGetScalar(prhs[1]);
    phi =       mxGetScalar(prhs[2]);
        
    /* Initialize output. */
    plhs[0] = mxCreateDoubleMatrix(1, 1, mxREAL);
    z00 = mxGetPr(plhs[0]);
    
    /* Calculate choice probability, of Real Old-Only's exit. */
    *z00 = exp(0) / 
            (exp(0) + exp(phi + beta * z0));

    return;    
}
