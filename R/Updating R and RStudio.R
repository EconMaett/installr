# Updating R and RStudio -----

## Updating R on Windows ----

# Updating on Windows is apparently tricky, a package called `installr`, 
# which is only for Windows can be used to ease the process.

# The following commands were taken from here, which goes into more details.
# First Install the `installr` package if you don’t have it

# The `installr` R package is available on:
# - CRAN: https://cran.r-project.org/package=installr
# - GitHub: https://github.com/talgalili/installr/
# - Website: https://talgalili.github.io/installr/
if(!require(installr)) {
  install.packages("installr"); 
  require(installr)
}

citation("installr")

# Call `installr::updateR()` function to call update
# This will start the updating process of your R installation. 
# It will check for newer versions, and if one is available, 
# will guide you through the decisions you’d need to make.
updateR()

# If necessary go to Tools > Global Options > Change the R version 


## Updating RStudio ----

# Go to Help > Check for Updates to install newer version.


## Updating R Packages ----

### Updating Out of date Packages ----

# Updating out of date package that were installed with `install.packages()` 
# is easy with the `update.packages()` function.
update.packages()

# Which will ask you for every package if you want to update, 
# to just say yes to everything use `ask = FALSE`.
update.packages(ask = FALSE)
# Unfortunately this won’t update packages installed by `devtools::install_github()`.


## Updating all Packages after R update -----

# On Windows this is handled by the package `installr`. 
# But for other operating systems, after updating R,
# a lot of packages might have been build under the old R version 
# and it would be safer to re-install all the packages already installed. 
# This can be done with the following commands. 
# Again this won’t update packages installed with `devtools::install_github()`.

### get packages installed ----
packs = as.data.frame(installed.packages(.libPaths()[1]), stringsAsFactors = FALSE)

### re-install install packages ----
install.packages(packs$Package)

# END