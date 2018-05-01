# 07-tidy-data.R

# R4ds here: http://r4ds.had.co.nz/tidy-data.html

# Tidy data paper here: http://vita.had.co.nz/papers/tidy-data.html

# Data organization in spreadsheets: https://peerj.com/preprints/3183.pdf

library("tidyverse")

# Four example data frames show the same data organized different ways:
table1
table2
table3
table4a
table4b


# `gather` multiple columns into key-value pairs
table4a %>%
  gather(key="year", value="cases", -country)

gather(table4a, year, value, `1999`, `2000`) # alt syntax, same call

# `spread` two key-value columns into individual columns for different variables:
table2

table2 %>%
  spread(., key = "type", value = "count")


# Don't spread too far! This is mixing two varibles together in column name.
table2 %>%
  mutate(var_yr = paste0(type, "_", year)) %>%
  select(country, var_yr, count) %>%
  spread(var_yr, count)

# What is bad about the `table2` version?

# The units of population and cases are potentially different.
# The relationship of the values in different rows is more indirect.
# Tidyverse functions are designed around the form of table1

# calculate the case-rate in each year
table1 %>%
  mutate(rate = cases/population)

# plot cases against pop:
table1 %>%
  ggplot(aes(x=population, y=cases)) +
  geom_point(aes(color = country))

# filter for high-population info:
table1 %>%
  filter(population > 100000000)


#### YOUR TURN:
# data-raw folder has a cleaned up version of the main inventory table 2-1.
# data-raw/GHGI_2-1_1990-2015_clean.csv
# Read it in and transform it to "tidy" or "tall" format by gathering year columns into a 'year' column and an 'emissions' column.




































### Answer:
ghgi_raw <- read_csv("data-raw/GHGI_2-1_1990-2015_clean.csv")
ghgi_tidy <- ghgi_raw %>%
  gather(key = "year", value = "emissions", -Gas, -Source)

ghgi_tidy <- ghgi_raw %>%
  gather(key = "year", value = "emissions", `1990`, `2005`)


View(ghgi_raw)
View(ghgi_tidy)

# Payoff: easy to transform and plot:

# Run this whole block:
ghgi_tidy %>%
  group_by(Gas, year) %>%
  summarize(emissions = sum(emissions, na.rm = TRUE)) %>%
  ggplot(ghgi_tidy, mapping = aes(x=year, y=emissions, color = Gas)) +
  geom_line()
