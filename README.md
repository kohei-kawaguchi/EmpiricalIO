# EmpiricalIO

## Installation

After cloning the repository by 

```bash
git clone git@github.com:kohei-kawaguchi/EmpiricalIO.git
```

you can install the package by running `main/install_packages.R`. This installs `renv`, creates a virtual environment, and installs relevant packages. After that, you can install packages to the environment using `renv::install("PACKAGE_NAME")`. 

You can install packages without using the virtual environment of `renv`. In that case, after installing relevant packages with `install.packages`, install this project by running `Rcpp::compileAttributes()` in the R terminal and then `R CMD INSTALL --preclean .` in the terminal.

## Usage

The source files of the lecture notes are in `/lecture`.

The source files for assignments are in `/lecture` and in `/assignment`. Files in `/lecture` are compiled as chapters of the entire book. Files in `/assignment` can be compiled separately.

The R functions used in the assignments are defined in files in `/R`.

The lecture notes can be compiled by running commands in `/lecture/build_book.R`, which generates html and pdf files in `docs/`.

The rendered lecture notes are available at [https://kohei-kawaguchi.github.io/EmpiricalIO/](https://kohei-kawaguchi.github.io/EmpiricalIO/)
