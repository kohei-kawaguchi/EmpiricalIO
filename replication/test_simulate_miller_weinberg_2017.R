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
  set_constant
)

# set parameter ---------------------------------------------------------------

parameter <- set_parameter()
findGlobals(
  set_parameter
)

# draw exogenous variable -----------------------------------------------------

exogenous <- 
  set_exogenous(
    constant = constant
  )
findGlobals(
  set_exogenous
)

# draw shock -------------------------------------------------------------------

shock <- 
  set_shock(
    constant = constant
  )
findGlobals(
  set_shock
)

# set endogenous variable ------------------------------------------------------

endogenous <-
  set_endogenous(
    constant = constant
  )
findGlobals(
  set_endogenous
)
