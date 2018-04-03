# 03-work-with-example-dataset.R

# Both R and various packages include built-in example data. We are going to focus on manipulating that data with `dplyr`

library(dplyr)

# list all the currently available example datasets
data()

# look at one of 'em
View(starwars)

# different functions for getting info on dataset (technically: a data.frame or a tibble)

head(starwars) # first few rows
glimpse(starwars) # each variable, the variable type, and some valus
View(starwars) # a friendly scrolly view
names(starwars) # the variable names only
str(starwars) # the "structure" -- very weird for this example.

# Select variables:
select(starwars, name)

# unique values:
distinct(starwars, homeworld)

# Filter rows:
filter(starwars, name == "R2-D2") # just 1
filter(starwars, homeworld == "Naboo")
filter(starwars, mass > 100)
filter(starwars, height < 180)
filter(starwars, mass > 100, height < 180)

# Both together:
starwars %>%
  filter(mass > 100, height < 180) %>%
  select(name, mass, homeworld)

# Add new variables:
starwars %>%
  select(name, mass, height) %>%
  mutate(ratio = mass / height)


##### The pipe ---------------
# This is the pipe: %>%
# It sort of looks like an arrow pointing to the right.
# It means "pass this thing into that function"

# Tired:
mean(c(42, 100))

# Wired:
c(42, 100) %>% mean()

# It always is passing into the *first* argument.

round(3.1415, digits = 2)

# or:
round(3.1415, 2)

# same as:
3.1415 %>% round(2)

# this isn't the same:
2 %>% round(3.1415)




####### Look at the docs ----------
# This webpage has html documentation for dplyr:
# http://dplyr.tidyverse.org/

# Try going to "Reference" and looking up `filter`

# The first argument is .data -- your data. That's why we listed starwars first up above. After that is ..., which in this case means you can put in a bunch of logical predicates. That is why the pipe works:

starwars %>% filter(homeworld == "Alderaan")

# Every function reference page describes arguments, return value, has examples, etc. Many packages also have functions.
