# initialize -------------------------------------------------------------------

rm(list = ls())
devtoos::load_all(".")
library(foreach)
library(magrittr)
library(codetools)
set.seed(1)

# set dimension --------------------------------------------------------------- 

constant <- set_constant()

# set equilibrium --------------------------------------------------------------

equilibrium <-
  set_equilibrium(
    constant = constant
  )
