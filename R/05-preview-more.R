# 05-preview-more.R

######### Preview some other packages ---------

# these are more tidyverse packages
library("tidyr")

#useful for moving data between rows and columns.
ironsteel_wide <- ironsteel_byyear %>%
  spread(year, ghg_quantity) %>%
  View()

##### Some very ugly, very quick plots ---------

library("ggplot2")

ggplot(ironsteel_byyear, 
       mapping = aes(x=year, y=ghg_quantity, group=ghg_name)) +
  geom_line()

ggplot(ironsteel_byyear, 
       mapping = aes(x=year, y=ghg_quantity, group=ghg_name)) +
  geom_line() +
  facet_grid(ghg_name ~ .)



