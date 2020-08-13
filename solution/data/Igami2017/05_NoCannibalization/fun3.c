#include "mex.h"  /* Always include this */
#include <math.h>  /* For mathematical functions */
#include "stdio.h" /* For mathematical functions */

/* Declare math functions */
double pow(double base, double exponent);
/* double exp(double exponent); /* Not used here. */

/* Math function: Factorial of n (integer) */
double factorial(int n)
{
    double s; 
    int i;
    
    s = 1;
    for (i = 1; i <= n; i++)
        s *= (double)i;
    
    return s;
}

void fillBA3(double *BA3, 
        double z6, double z7, double z8, double z9, double z10,
        double No, double Nb, double Nn, double Npe, double Npe_prime,
        double z00, double Nroo)
{
    int xo, eb, xb, xn, en, xroo;
    
    for (xo = 0; xo <= No; xo++){
        for (eb = 0; eb <=(No-xo); eb++){
            for (xb = 0; xb <= (Nb-1); xb++){
                for (xn = 0; xn <= Nn; xn++){
                    for (en = 0; en <= Npe; en++){ 
                        for (xroo = 0; xroo <= Nroo; xroo++){
                        
                    if (Nb > 1){/* Intuitively: BA3[xo][eb][xb][xn][en][xroo] */
                        BA3[xo + 12*eb + (12*12)*xb + (12*12*12)*xn + (12*12*12*15)*en
                                + (12*12*12*15*5)*xroo] = 
                            (factorial(No) / (factorial(xo) * factorial(No-xo)))
                            * (factorial(No-xo) / (factorial(eb) * factorial(No-xo-eb)))
                            * pow(z6,xo) * pow(z7,eb) * pow((1-z6-z7),(No-xo-eb))
                            * (factorial(Nb-1) / (factorial(xb) * factorial(Nb-1-xb)))
                            * pow(z8,xb) * pow((1-z8),(Nb-1-xb))
                            * (factorial(Nn) / (factorial(xn) * factorial(Nn-xn)))
                            * pow(z9,xn) * pow((1-z9),(Nn-xn))
                            * (factorial(Npe) / (factorial(en) * factorial(Npe-en)))
                            * pow(z10,en) * pow((1-z10),(Npe-en))
                            * (factorial(Nroo) / (factorial(xroo) * factorial(Nroo-xroo)))
                            * pow(z00,xroo) * pow((1-z00),(Nroo-xroo));
                    }
                    else{       /* Intuitively: BA3[xo][eb][0][xn][en] */
                        BA3[xo + 12*eb + (12*12)*0 + (12*12*12)*xn + (12*12*12*15)*en] = 
                            (factorial(No) / (factorial(xo) * factorial(No-xo)))
                            * (factorial(No-xo) / (factorial(eb) * factorial(No-xo-eb)))
                            * pow(z6,xo) * pow(z7,eb) * pow((1-z6-z7),(No-xo-eb))
                            /* (no terms for Both-types here) */
                            * (factorial(Nn) / (factorial(xn) * factorial(Nn-xn)))
                            * pow(z9,xn) * pow((1-z9),(Nn-xn))
                            * (factorial(Npe) / (factorial(en) * factorial(Npe-en)))
                            * pow(z10,en) * pow((1-z10),(Npe-en))
                            * (factorial(Nroo) / (factorial(xroo) * factorial(Nroo-xroo)))
                            * pow(z00,xroo) * pow((1-z00),(Nroo-xroo));
                        }
                        }
                    }
                }
            }
        }
    }
}

void fillBS3(double *BS3, double *BA3, 
        double z6, double z7, double z8, double z9, double z10,
        double No, double Nb, double Nn, double Npe, double Npe_prime,
        double z00, double Nroo)
{
    int xo, eb, xb, xn, en, xroo;
    int no_prime, nb_prime, nn_prime, npe_prime, nroo_prime;    
    npe_prime = Npe_prime;
    
    for (xo = 0; xo <= No; xo++){
        for (eb = 0; eb <= (No-xo); eb++){
            for (xb = 0; xb <= (Nb-1); xb++){
                for (xn = 0; xn <= Nn; xn++){
                    for (en = 0; en <= Npe; en++){
                        for (xroo = 0; xroo <= Nroo; xroo++){
                        
                        if (xb < 0){xb = 0;}
                        
                        no_prime = No - xo - eb;
                        nb_prime = Nb - xb + eb;
                        nn_prime = Nn - xn + en;
                        nroo_prime = Nroo - xroo;
                        
                        if (no_prime < 0){no_prime = 0;}
                        if (nb_prime < 0){nb_prime = 0;}
                        if (nn_prime < 0){nn_prime = 0;}
                        if (nroo_prime < 0){nroo_prime = 0;}
                        
                        if (no_prime > 11){no_prime = 11;}
                        if (nb_prime > 11){nb_prime = 11;}
                        if (nn_prime > 14){nn_prime = 14;}
                        if (nroo_prime > 11){nroo_prime = 11;}
                        
            BS3[no_prime + 12*nb_prime + (12*12)*nn_prime + (12*12*15)*npe_prime
                    + (12*12*15*5)*nroo_prime]
                    += BA3[xo + 12*eb + (12*12)*xb + (12*12*12)*xn + (12*12*12*15)*en
                              + (12*12*12*15*5)*xroo]; 
            /* Intuitively: BS3[no_prime][nb_prime][nn_prime][npe_prime][nroo_prime]
                          = BS3[no_prime][nb_prime][nn_prime][npe_prime][nroo_prime]
                          + BA3[xo][eb][xb][xn][en][xroo]; */
                    }
                    }
                }
            }
        }
    }
}
            
void getEV3(double *z3, double *BS3, double Npe_prime, double *Vprime)
{
    int no_prime, nb_prime, nn_prime, npe_prime, nroo_prime;    
    npe_prime = Npe_prime;
    
    for (no_prime = 0; no_prime <= 11; no_prime++){
        for (nb_prime = 0; nb_prime <= 11; nb_prime++){
            for (nn_prime = 0; nn_prime <= 14; nn_prime++){
                for (nroo_prime = 0; nroo_prime <= 11; nroo_prime++){

                *z3 += 
            BS3[no_prime + 12*nb_prime + (12*12)*nn_prime + (12*12*15)*npe_prime
                        + (12*12*15*5)*nroo_prime]
            * Vprime[1 + 4*no_prime + (4*12)*nb_prime + (4*12*12)*nn_prime
                        + (4*12*12*15)*nroo_prime];

            /* Intuitively: BS3[no_prime][nb_prime][nn_prime][npe_prime][nroo_prime]
                          * Vprime[1][no_prime][nb_prime][nn_prime][nroo_prime]; */
            }
            }
        } 
    }
}

/* The gateway routine */
void mexFunction(int nlhs, mxArray *plhs[],     /* Output variables */
        int nrhs, const mxArray *prhs[])        /* Input variables  */
{
    double *z3;
    double z6, z7, z8, z9, z10;
    double No, Nb, Nn, Npe, Npe_prime;
    double *Vprime;
    double z00, Nroo;
    mxArray *BA3[1], *BS3[1]; 
    
    /* Fool-proof for # Matlab inputs. */
    if(nrhs != 13)
        mexErrMsgTxt("fun3: 13 input arguments required.");
    if(mxGetM(prhs[10]) != 103680)
        mexErrMsgTxt("fun3: Vprime must have 103680 rows.");
    if(mxGetN(prhs[10]) != 1)
        mexErrMsgTxt("fun3: Vprime must have 1 column.");
    if(mxGetNumberOfElements(prhs[10]) != 103680)
        mexErrMsgTxt("fun3: Vprime must have 103680 elements.");
    
    /* Read inputs. */
    z6 =        mxGetScalar(prhs[0]);
    z7 =        mxGetScalar(prhs[1]);
    z8 =        mxGetScalar(prhs[2]);
    z9 =        mxGetScalar(prhs[3]);
    z10 =       mxGetScalar(prhs[4]);
    No =        mxGetScalar(prhs[5]);
    Nb =        mxGetScalar(prhs[6]);
    Nn =        mxGetScalar(prhs[7]);
    Npe =       mxGetScalar(prhs[8]);
    Npe_prime = mxGetScalar(prhs[9]);
    Vprime =    mxGetPr(prhs[10]);
    z00 =       mxGetScalar(prhs[11]);
    Nroo =      mxGetScalar(prhs[12]);
    
    /* Initialize output. */
    plhs[0] = mxCreateDoubleMatrix(1, 1, mxREAL);
    z3 = mxGetPr(plhs[0]);

    /* Prepare intermediate variables. */
    BA3[0] = mxCreateDoubleMatrix(1555200, 1, mxREAL); /* 12x12x12x15x5 */
    BS3[0] = mxCreateDoubleMatrix( 129600, 1, mxREAL); /* 12x12x15x5 */
                
    /* Call the C subroutines. */
    fillBA3(mxGetPr(BA3[0]), 
            z6, z7, z8, z9, z10, No, Nb, Nn, Npe, Npe_prime, z00, Nroo);
    fillBS3(mxGetPr(BS3[0]), mxGetPr(BA3[0]), 
            z6, z7, z8, z9, z10, No, Nb, Nn, Npe, Npe_prime, z00, Nroo);
    getEV3(z3, mxGetPr(BS3[0]), Npe_prime, Vprime);
    
    /* Clean up allocated memory. */
    mxDestroyArray(BA3[0]);
    mxDestroyArray(BS3[0]);
    
    return;    
}
