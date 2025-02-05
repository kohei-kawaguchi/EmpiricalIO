# Install renv if not already installed
if (!require("renv")) install.packages("renv")

# Initialize renv
renv::init()

# Snapshot the current state
renv::snapshot() 
