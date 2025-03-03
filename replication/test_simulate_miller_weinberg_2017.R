# initialize -------------------------------------------------------------------

rm(list = ls())
devtoos::load_all(".")
library(foreach)
library(magrittr)
library(codetools)
set.seed(1)

# set dimension --------------------------------------------------------------- 

constant <- set_constant()
findGlobals(
  constant
)

# set parameter ---------------------------------------------------------------

parameter <- set_parameter()
findGlobals(
  parameter
)

# draw exogenous variable -----------------------------------------------------

exogenous <- 
  set_exogenous(
    constant = constant
  )
findGlobals(
  exogenous
)

# draw shock -------------------------------------------------------------------

shock <- 
  set_shock(
    constant = constant
  )
findGlobals(
  shock
)

