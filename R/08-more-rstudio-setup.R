# 08-more-rstudio-setup.R
# Add a subtitel


# The usethis package provides a number of "jigs" to help do workflows in a good way.
install.packages("usethis")
library("usethis")

# Set RStudio so that it never saves data on exit or loads it on startup
# The following function returns instructions for ensuring you are always working from a blank slate
usethis::use_blank_slate()

# Go to menu: tools -> global options -> (general tab)
# uncheck: Restore .RData into workspace on startup
# switch to never: Save workspace to .RData on exit

# See version of R in your Rstudio/R startup message
# EPA installed version: 3.4.3
# Current version (just released): 3.4.5
R.version

# See version of RStudio in about/Rstudio
# menu: help -> "About RStudio"
# EPA distribution version: 1.1.414
# Most current version: 1.1.442 (well, also daily updates...)


# Distinguishing R and RStudio
# Run R three ways: RStudio, RGUI, and cmd prompt
# 1) Rstudio: check
# 2) double click on the icon on desktop "R x64 3.4.3"
# 3) start menu search > cmd -> R (and enter)


# Update packages:
# Tools -> check for package updates -> if "install from source", say "No"

# Things to know about:

# Rtools: tools for building R packages (and R itself)
# install.packages("devtools")

# Git/Github: look at commits. Get the changes instead of the whole thing from scratch.