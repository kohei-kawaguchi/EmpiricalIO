#include "mex.h"  /* Always include this */
#include <math.h>  /* For mathematical functions */
#include "stdio.h" /* For mathematical functions */

/* Declare math functions */
double exp(double exponent);

/* The gateway routine */
void mexFunction(int nlhs, mxArray *plhs[],     /* Output variables */
        int nrhs, const mxArray *prhs[])        /* Input variables  */
{
    double *z9;
    double z4;
    double beta, phi;
   
    /* Fool-proof for # Matlab inputs. */
    if(nrhs != 3)
        mexErrMsgTxt("fun9: 3 input arguments required.");
    
    /* Read inputs. */
    z4 =        mxGetScalar(prhs[0]);   /* EV_new for staying New firm. */
    beta =      mxGetScalar(prhs[1]);
    phi =       mxGetScalar(prhs[2]);
        
    /* Initialize output. */
    plhs[0] = mxCreateDoubleMatrix(1, 1, mxREAL);
    z9 = mxGetPr(plhs[0]);
    
    /* Calculate choice probability, of New firm's exit. */
    *z9 = 1 / 
            (1 + exp(phi + beta * z4));

    return;    
}
