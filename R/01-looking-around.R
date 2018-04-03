# 01-looking-around.R

# This is an R script. This line is a comment, not code, designated by the `#`.

# The following line is a line of code. Put your cursor on it and press "Ctrl-Enter" to run it.
print("Hello World!")

# RStudio has four main panes:
# 1) Top-left: The script viewer (this!). Where you organize code files.
# 2) Bottom-left: The console. Where you can run commands interactively.
# 3) Top-right: environment pane (blank... for now)
# 4) Bottom-right: files/packages. 

# Put your cursor in the console pane below, and try typing some code. Try out basic math. The usual symbols work: +, -, *, /, ^.


#### Scripts Pane ----------------------
# You write code here (first one file, then many). You can run code one block at a time (ctrl-enter), or highlight and then run the same way. You can select a whole script with ctrl-A.

# Print first few rows of example dataset:
head(mtcars)

# Look at example dataset in the data viewer:
View(mtcars)

# Notice that when you run stuff, the code appears in the console. A script is a way to keep track of code so you don't have to manually type it in every time in the console.


#### Environment Pane -------------------

# Try putting some values in a variable:
x <- c(1, 7, 1234, 1111)

# Now x should be a value up in the environment pane.
# copy mtcars into your own dataframe:

mydata <- mtcars

# define a new function. Highlight the next 3 lines and ctrl-enter.
myfunction <- function(y) {
  y + 17
}

# So you should see some stuff appearing in the environment pane (upper-right)

# next to mydata in the Environment pane, try clicking the little spreadsheet symbol.



#### Console --------------

# Type some more commands into the console. Maybe use the variables we have just stored.

# Print out some data
x
head(mydata)

# Do "vector" math:
x * 2
x * x

# apply a function
round(3.1415)
factorial(3)
sqrt(9)
myfunction(1)


#### Files / Packages / Help Pane ------------ 

# In the file pane, are you seeing the course materials. 
# When you open up a project, you almost always want to open the .Rproj file because that establishes your working directory and organizes all of your work on a project together.

# Packages.
# Click over to packages. What packages do you have installed?
# Do you see `dplyr` and `readr`?


# Run the following to get help on the `mean` function:
?mean
