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

void fillBA5(double *BA5, 
        double z6, double z7, double z8, double z9, double z10,
        double No, double Nb, double Nn, double Npe, double Npe_prime,
        double z00, double Nroo)
{
    int xo, eb, xb, xn, en, xroo;
    
    for (xo = 0; xo <= No; xo++){
        for (eb = 0; eb <= (No-xo); eb++){
            for (xb = 0; xb <= Nb; xb++){
                for (xn = 0; xn <= Nn; xn++){
                    for (en = 1; en <= Npe; en++){  
                        for (xroo = 0; xroo <= Nroo; xroo++){
                        
                    if (Npe > 1){/* Intuitively: BA5[xo][eb][xb][xn][en][xroo] */
                        BA5[xo + 12*eb + (12*12)*xb + (12*12*12)*xn + (12*12*12*15)*en
                                + (12*12*12*15*5)*xroo] = 
                            (factorial(No) / (factorial(xo) * factorial(No-xo)))
                            * (factorial(No-xo) / (factorial(eb) * factorial(No-xo-eb)))
                            * pow(z6,xo) * pow(z7,eb) * pow((1-z6-z7),(No-xo-eb))
                            * (factorial(Nb) / (factorial(xb) * factorial(Nb-xb)))
                            * pow(z8,xb) * pow((1-z8),(Nb-xb))
                            * (factorial(Nn) / (factorial(xn) * factorial(Nn-xn)))
                            * pow(z9,xn) * pow((1-z9),(Nn-xn))
                            * (factorial(Npe-1) / (factorial(en-1) * factorial(Npe-1-(en-1))))
                            * pow(z10,en-1) * pow((1-z10),(Npe-1-(en-1)))
                            * (factorial(Nroo) / (factorial(xroo) * factorial(Nroo-xroo)))
                            * pow(z00,xroo) * pow((1-z00),(Nroo-xroo));
                    }
                    else{       /* Intuitively: BA5[xo][eb][xb][xn][0][xroo] */
                        BA5[xo + 12*eb + (12*12)*xb + (12*12*12)*xn + (12*12*12*15)*0
                                + (12*12*12*15*5)*xroo] = 
                            (factorial(No) / (factorial(xo) * factorial(No-xo)))
                            * (factorial(No-xo) / (factorial(eb) * factorial(No-xo-eb)))
                            * pow(z6,xo) * pow(z7,eb) * pow((1-z6-z7),(No-xo-eb))
                            * (factorial(Nb) / (factorial(xb) * factorial(Nb-xb)))
                            * pow(z8,xb) * pow((1-z8),(Nb-xb))
                            * (factorial(Nn) / (factorial(xn) * factorial(Nn-xn)))
                            * pow(z9,xn) * pow((1-z9),(Nn-xn))
                            /* (no terms for Potential Entrants here) */
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

void fillBS5(double *BS5, double *BA5, 
        double z6, double z7, double z8, double z9, double z10,
        double No, double Nb, double Nn, double Npe, double Npe_prime,
        double z00, double Nroo)
{
    int xo, eb, xb, xn, en, xroo;
    int no_prime, nb_prime, nn_prime, npe_prime, nroo_prime;        
    npe_prime = Npe_prime;
    
    for (xo = 0; xo <= No; xo++){
        for (eb = 0; eb <= (No-xo); eb++){
            for (xb = 0; xb <= Nb; xb++){
                for (xn = 0; xn <= Nn; xn++){
                    for (en = 1; en <= Npe; en++){
                        for (xroo = 0; xroo <= Nroo; xroo++){
                        
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
                        
            BS5[no_prime + 12*nb_prime + (12*12)*nn_prime + (12*12*15)*npe_prime
                    + (12*12*15*5)*nroo_prime]
                    += BA5[xo + 12*eb + (12*12)*xb + (12*12*12)*xn + (12*12*12*15)*en
                              + (12*12*12*15*5)*xroo]; 
            /* Intuitively: BS5[no_prime][nb_prime][nn_prime][npe_prime][nroo_prime]
                          = BS5[no_prime][nb_prime][nn_prime][npe_prime][nroo_prime]
                          + BA5[xo][eb][xb][xn][en][xroo]; */
                    }
                    }
                }
            }
        }
    }
}
            
void getEV5(double *z5, double *BS5, double Npe_prime, double *Vprime)
{
    int no_prime, nb_prime, nn_prime, npe_prime, nroo_prime;    
    npe_prime = Npe_prime;
    
    for (no_prime = 0; no_prime <= 11; no_prime++){
        for (nb_prime = 0; nb_prime <= 11; nb_prime++){
            for (nn_prime = 0; nn_prime <= 14; nn_prime++){
                for (nroo_prime = 0; nroo_prime <= 11; nroo_prime++){

                *z5 += 
            BS5[no_prime + 12*nb_prime + (12*12)*nn_prime + (12*12*15)*npe_prime
                        + (12*12*15*5)*nroo_prime]
            * Vprime[2 + 4*no_prime + (4*12)*nb_prime + (4*12*12)*nn_prime
                        + (4*12*12*15)*nroo_prime];

            /* Intuitively: BS5[no_prime][nb_prime][nn_prime][npe_prime][nroo_prime]
                          * Vprime[2][no_prime][nb_prime][nn_prime][nroo_prime]; */
            }
            }
        } 
    }
}

/* The gateway routine */
void mexFunction(int nlhs, mxArray *plhs[],     /* Output variables */
        int nrhs, const mxArray *prhs[])        /* Input variables  */
{
    double *z5;
    double z6, z7, z8, z9, z10;
    double No, Nb, Nn, Npe, Npe_prime;
    double *Vprime;
    double z00, Nroo;
    mxArray *BA5[1], *BS5[1]; 
    
    /* Fool-proof for # Matlab inputs. */
    if(nrhs != 13)
        mexErrMsgTxt("fun5: 13 input arguments required.");
    if(mxGetM(prhs[10]) != 103680)
        mexErrMsgTxt("fun5: Vprime must have 103680 rows.");
    if(mxGetN(prhs[10]) != 1)
        mexErrMsgTxt("fun5: Vprime must have 1 column.");
    if(mxGetNumberOfElements(prhs[10]) != 103680)
        mexErrMsgTxt("fun5: Vprime must have 103680 elements.");
    
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
    z5 = mxGetPr(plhs[0]);

    /* Prepare intermediate variables. */
    BA5[0] = mxCreateDoubleMatrix(1555200, 1, mxREAL);
    BS5[0] = mxCreateDoubleMatrix( 129600, 1, mxREAL);
                
    /* Call the C subroutines. */
    fillBA5(mxGetPr(BA5[0]), 
            z6, z7, z8, z9, z10, No, Nb, Nn, Npe, Npe_prime, z00, Nroo);
    fillBS5(mxGetPr(BS5[0]), mxGetPr(BA5[0]), 
            z6, z7, z8, z9, z10, No, Nb, Nn, Npe, Npe_prime, z00, Nroo);
    getEV5(z5, mxGetPr(BS5[0]), Npe_prime, Vprime);
    
    /* Clean up allocated memory. */
    mxDestroyArray(BA5[0]);
    mxDestroyArray(BS5[0]);
    
    return;    
}
