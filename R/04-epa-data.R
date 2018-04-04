# 04-epa-data.R
# I thought it would be good to jump right into using a real dataset, and specifically EPA data. This data is available for download on the public EPA website here: https://www.epa.gov/enviro/greenhouse-gas-customized-search
# I have included two of the data tables for the Greenhouse Gas Reporting Program. One is a general table giving facility information, and the second is a subpart-level table giving emissions information by facility for iron and steel production facilities.

library(readr) # for read/write of csv files
library(dplyr) # for data manipulation

ironsteel_raw   <- read_csv("data-raw/Q_SUBPART_LEVEL_INFORMATION.csv")
emitter_fac_raw <- read_csv("data-raw/V_GHG_EMITTER_FACILITIES.csv")

# use glimpse, View, names, str to look at the data
glimpse(ironsteel_raw)
View(ironsteel_raw)
names(ironsteel_raw)

# Rename variables to make them quicker to type
ironsteel <- ironsteel_raw %>%
  rename(
    id =   Q_SUBPART_LEVEL_INFORMATION.FACILITY_ID,
    year = Q_SUBPART_LEVEL_INFORMATION.REPORTING_YEAR,
    ghg_name = Q_SUBPART_LEVEL_INFORMATION.GHG_NAME,
    ghg_quantity = Q_SUBPART_LEVEL_INFORMATION.GHG_QUANTITY
  )

View(ironsteel)
names(ironsteel)
str(ironsteel)

# total carbon dioxide among iron & steel plants?
distinct(ironsteel, ghg_name)

ironsteel %>%
  filter(ghg_name == "Carbon Dioxide") %>%
  summarize(ghg_quantity = sum(ghg_quantity))

ironsteel_byyear <- ironsteel %>%
  group_by(year, ghg_name) %>%
  summarize(ghg_quantity = sum(ghg_quantity))

View(ironsteel_byyear)


###### Now you try working with another dataset -- maybe the facility info?
###### If you have some data you want to try working with, maybe that?


