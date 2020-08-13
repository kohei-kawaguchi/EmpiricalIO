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

void fillBA1(double *BA1, 
        double z6, double z7, double z8, double z9, double z10,
        double No, double Nb, double Nn, double Npe, double Npe_prime)
{
    int xo, eb, xb, xn, en;
    
     for (xo = 0; xo <= (No-1); xo++){
        for (eb = 0; eb <= (No-1-xo); eb++){
            for (xb = 0; xb <= Nb; xb++){
                for (xn = 0; xn <= Nn; xn++){
                    for (en = 0; en <= Npe; en++){ 
                        
                    if (No > 1){/* Intuitively: BA1[xo][eb][xb][xn][en] */
                        BA1[xo + 12*eb + (12*12)*xb + (12*12*12)*xn + (12*12*12*15)*en] = 
                            (factorial(No-1) / (factorial(xo) * factorial(No-1-xo)))
                            * (factorial(No-1-xo) / (factorial(eb) * factorial(No-1-xo-eb)))
                            * pow(z6,xo) * pow(z7,eb) * pow((1-z6-z7),(No-1-xo-eb))
                            * (factorial(Nb) / (factorial(xb) * factorial(Nb-xb)))
                            * pow(z8,xb) * pow((1-z8),(Nb-xb))
                            * (factorial(Nn) / (factorial(xn) * factorial(Nn-xn)))
                            * pow(z9,xn) * pow((1-z9),(Nn-xn))
                            * (factorial(Npe) / (factorial(en) * factorial(Npe-en)))
                            * pow(z10,en) * pow((1-z10),(Npe-en));
                    }
                    else{       /* Intuitively: BA1[0][0][xb][xn][en] */
                        BA1[0 + 12*0 + (12*12)*xb + (12*12*12)*xn + (12*12*12*15)*en] = 
                            (factorial(Nb) / (factorial(xb) * factorial(Nb-xb)))
                            * pow(z8,xb) * pow((1-z8),(Nb-xb))
                            * (factorial(Nn) / (factorial(xn) * factorial(Nn-xn)))
                            * pow(z9,xn) * pow((1-z9),(Nn-xn))
                            * (factorial(Npe) / (factorial(en) * factorial(Npe-en)))
                            * pow(z10,en) * pow((1-z10),(Npe-en));
                        }
                    }
                }
            }
        }
    }
}

void fillBS1(double *BS1, double *BA1, 
        double z6, double z7, double z8, double z9, double z10,
        double No, double Nb, double Nn, double Npe, double Npe_prime)
{
    int xo, eb, xb, xn, en;
    int no_prime, nb_prime, nn_prime, npe_prime;    
    npe_prime = Npe_prime;
    
    for (xo = 0; xo <= (No-1); xo++){
        for (eb = 0; eb <= (No-1-xo); eb++){
            for (xb = 0; xb <= Nb; xb++){
                for (xn = 0; xn <= Nn; xn++){
                    for (en = 0; en <= Npe; en++){
                        
                        if (xo < 0){xo = 0;}
                        if (eb < 0){eb = 0;}
                        
                        no_prime = No - xo - eb;
                        nb_prime = Nb - xb + eb;
                        nn_prime = Nn - xn + en;
                        
                        if (no_prime < 0){no_prime = 0;}
                        if (nb_prime < 0){nb_prime = 0;}
                        if (nn_prime < 0){nn_prime = 0;}
                        
                        if (no_prime > 11){no_prime = 11;}
                        if (nb_prime > 11){nb_prime = 11;}
                        if (nn_prime > 14){nn_prime = 14;}
                        
            BS1[no_prime + 12*nb_prime + (12*12)*nn_prime + (12*12*15)*npe_prime]
                    += BA1[xo + 12*eb + (12*12)*xb + (12*12*12)*xn + (12*12*12*15)*en]; 
            /* Intuitively: BS1[no_prime][nb_prime][nn_prime][npe_prime]
                          = BS1[no_prime][nb_prime][nn_prime][npe_prime]
                          + BA1[xo][eb][xb][xn][en]; */
                    }
                }
            }
        }
    }
}
            
void getEV1(double *z1, double *BS1, double Npe_prime, double *Vprime)
{
    int no_prime, nb_prime, nn_prime, npe_prime;    
    npe_prime = Npe_prime;
    
    for (no_prime = 0; no_prime <= 11; no_prime++){
        for (nb_prime = 0; nb_prime <= 11; nb_prime++){
            for (nn_prime = 0; nn_prime <= 14; nn_prime++){

                *z1 += 
            BS1[no_prime + 12*nb_prime + (12*12)*nn_prime + (12*12*15)*npe_prime]
            * Vprime[0 + 3*no_prime + (3*12)*nb_prime + (3*12*12)*nn_prime];

            /* Intuitively: BS1[no_prime][nb_prime][nn_prime][npe_prime]
                          * Vprime[0][no_prime][nb_prime][nn_prime]; */
            }
        } 
    }
}

/* The gateway routine */
void mexFunction(int nlhs, mxArray *plhs[],     /* Output variables */
        int nrhs, const mxArray *prhs[])        /* Input variables  */
{
    double *z1;
    double z6, z7, z8, z9, z10;
    double No, Nb, Nn, Npe, Npe_prime;
    double *Vprime;
    mxArray *BA1[1], *BS1[1]; 
    
    /* Fool-proof for # Matlab inputs. */
    if(nrhs != 11)
        mexErrMsgTxt("fun1: 11 input arguments required.");
    if(mxGetM(prhs[10]) != 6480)
        mexErrMsgTxt("Vprime must have 6480 rows.");
    if(mxGetN(prhs[10]) != 1)
        mexErrMsgTxt("Vprime must have 1 column.");
    if(mxGetNumberOfElements(prhs[10]) != 6480)
        mexErrMsgTxt("Vprime must have 6480 elements.");
    
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
    Vprime = mxGetPr(prhs[10]);
    
    /* Initialize output. */
    plhs[0] = mxCreateDoubleMatrix(1, 1, mxREAL);
    z1 = mxGetPr(plhs[0]);

    /* Prepare intermediate variables. */
    BA1[0] = mxCreateDoubleMatrix(129600, 1, mxREAL);
    BS1[0] = mxCreateDoubleMatrix( 10800, 1, mxREAL);
                
    /* Call the C subroutines. */
    fillBA1(mxGetPr(BA1[0]), 
            z6, z7, z8, z9, z10, No, Nb, Nn, Npe, Npe_prime);
    fillBS1(mxGetPr(BS1[0]), mxGetPr(BA1[0]), 
            z6, z7, z8, z9, z10, No, Nb, Nn, Npe, Npe_prime);
    getEV1(z1, mxGetPr(BS1[0]), Npe_prime, Vprime);
    
    /* Clean up allocated memory. */
    mxDestroyArray(BA1[0]);
    mxDestroyArray(BS1[0]);
    
    return;    
}
