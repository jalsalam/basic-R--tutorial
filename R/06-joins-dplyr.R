#06-joins-dplyr.R


#### Preliminaries ---------
# We will use: 

library("tidyverse")
library("nycflights13")
# if you don't have these, install one of two ways:
# install.packages("nycflights13")
# install.packages("tidyverse")
# Go to "tools" -> "install packages" and enter them in


# We are going to take a look at how to join together two datasets. First, maybe a little terminology disambiguation.


# terminology: at a basic level, a dataset = a data frame = a tibble.
# dataset: no specific-to-R meaning
# data.frame: a specific base R programming concept
# tibble: basically the same as a data.frame, but introduced by tidyverse with slight changes to defaults and generalization for many backends (e.g., databases)

####### Example band_members data ------------

# dplyr contains three datasets useful for looking at small joins
band_members
band_instruments
band_instruments2

# YOUR TURN:
# Recall last time we used several functions to examine data, e.g.:
# `View(band_members)` and `str(band_members)`
# use these to examine the three datasets.
# what is the difference between `band_instruments` and `band_instruments2` ?










### Small join examples w/band_members ----------------

# I most commonly use `left_join(x, y)`. This type of join keeps all the rows from the first dataframe and looks up the corresponding data from the second and appends it to the first. All the dplyr join verbs will try to guess common columns, but it is usually best to specify how you want the join to happen.

left_join(band_members, band_instruments2, by = c("name" = "artist"))


left_join(band_members, band_instruments)


band_members %>% left_join(band_instruments) # equivalent with pipe
band_members %>% left_join(band_instruments, by = "name") # specify join column to quiet the message


# To only keep matches, use `inner_join()`
band_members %>% inner_join(band_instruments)

# To keep all rows from right side, `right_join(x, y)`
band_members %>% right_join(band_instruments) 

# why is Keith's band NA?

band_members %>% filter(name == "Keith") # we don't have data on what band Keith is in.
band_instruments %>% filter(name == "Keith") # but we do have data on what he play.s

# To keep all rows from both sides, `full_join(x, y)`
full_join(band_members, band_instruments, by = "name")

# Join diagrams here: http://r4ds.had.co.nz/relational-data.html#mutating-joins

# join help file here: https://dplyr.tidyverse.org/reference/join.html


##### Uniqueness in dfy ----------------

x <- tibble(
  key = c(1, 2, 3),
  val_x = c("x1", "x2", "x3")
)

y <- tibble(
  key = c(1, 1, 2),
  val_y = c("y1a", "y1b", "y2")
)

nrow(x)
left_join(x, y)
left_join(x, y) %>% nrow()

nrow(y) == nrow(distinct(y, c("key")))
# FALSE here shows that rows in y are not distinct on `key` values.



#### NYC flights data --------------

# text here: http://r4ds.had.co.nz/relational-data.html#nycflights13-relational
library(nycflights13)

# Take a look at data:
airlines # lets you look up the full carrier name from its abbreviated code.

airports # gives info about each airport, identified by the `faa` airport code.

planes # gives info about each plane, identified by its `tailnum`

weather # gives weather at each NYC airport each hour


## YOUR TURN:
# Try joining the flights data to the full carrier name (and/or airport name data.)









# Hint: data description: https://cran.r-project.org/web/packages/nycflights13/nycflights13.pdf




# Hint 2: drop some unnecessary columns
flights2 <- flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier)



# Hint 3: join & count
rainy_days <- filter(weather, precip > 0.5) %>%
  select(year, month, day)

rainy_flights <- left_join(rainy_days, flights2)

head(rainy_flights)
count(rainy_flights)
distinct(rainy_flights, year, month, day, dest)









