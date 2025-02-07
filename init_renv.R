# Install renv if not already installed
if (!require("renv")) install.packages("renv")

# Initialize renv
renv::init(force = TRUE)

# Install all currently used packages
renv::hydrate()

# Snapshot the current state
renv::snapshot(force = TRUE) 
