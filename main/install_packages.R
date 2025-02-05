# Install renv if not already installed
if (!require("renv")) install.packages("renv")

# Restore the project environment from renv.lock
renv::restore()

# Install this project package
renv::install(".")

# Activate the project environment
renv::activate() 