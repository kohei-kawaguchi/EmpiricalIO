# Install renv if not already installed
if (!require("renv")) install.packages("renv")

# Initialize renv
renv::init()

# Install required packages
renv::install(c(
  "EmpiricalIO",
  "magrittr",
  "stargazer", 
  "knitr",
  "foreach",
  "ggplot2",
  "latex2exp",
  "np",
  "tibble",
  "dplyr"
))

# Snapshot the current state
renv::snapshot() 