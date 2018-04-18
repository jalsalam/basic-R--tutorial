#02-installing-packages.R

# 'base R' are the functions and operations that work as soon as you open up R or RStudio. But many many many excellent functions are available through add-on packages. In recent years, the tidyverse family of packages has become extremely popular because they provide a suite of funcions that work well together and are easy to learn.

# I recommend all the tidyverse packages -- a pack of around 20 great packages
install.packages("tidyverse")

# Installing packages means putting them on your computer. Loading them with the `library()` function is what makes them available to use:
library("tidyverse")


# Now there should be check-marks next to readr and dplyr in the packages pane. These are both included within the tidyverse set of packages.

# Menu alternative: In the menu above, you can go to "Tools" & "Install Packages" to do this as well.