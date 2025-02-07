# Install renv if not already installed
if (!require("renv")) install.packages("renv")

# Initialize renv (use bare=TRUE to avoid installing packages immediately)
renv::init(bare = TRUE)

# Install this project EmpiricalIO
renv::install(".")

# Install dependencies from DESCRIPTION file (if it exists)
renv::restore()

# Snapshot the current state
renv::snapshot() 