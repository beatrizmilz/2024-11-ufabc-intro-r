# Introduction to R ------

## Comments --
# We can write comments (texts that will not be executed) using the hashtag (`#`).
# Everything after the hashtag will be ignored by R.

## Running code ----
# To run the code, we can click on the code chunk we want to run (or select it),
# and then:
# - use the `Ctrl + Enter` keyboard shortcut, or
# - use the `Run` button in the top right corner of the script window.

2 + 1 


## R as a calculator ----

# We can use R as a calculator. For example, we can add two numbers:
2 + 3

# We can also subtract, multiply, and divide:
5 - 2
3 * 4
10 / 2

# question
# what [1] in the output means?
# positiion of the first element in the line!
letters

letters[19]

##  Difference between Script and Console  -----
# We can write code in two places in RStudio:
# - in the script window (where we write our code), and
# - in the console window (where we see the output of our code).
 
# If it's something we want to keep, we should write it in the script window,
# and save the file.

# We should consider the console as a place to test code quickly, or to run code
# that we don't need to keep. Everything on Console is temporary and will be lost!

## Exercise: ---

# 1. Let's use R to find out today's temperature in Fahrenheit.
# Convert the temperature from Celsius to Fahrenheit, 
# using the following formula: `TempF =  TempC * 1.8 + 32`:

# 19o C
(19 * 1.8) + 32

# { [ ( )]}

# ( ( ( )))

## Variables ----

# We can store values in variables. This way, we can use them later in our code.

# To assign a value to a variable, we use the assignment operator `<-`.

# shortcut: ALT -

# <- <- <- <- <- <- <- <- <- <- <- <- <- <- <- <- <- <- 

# For example, let's store the value 31 in a variable called `age`:

age <- 31

# Now, we can use the variable `age` in our code:

age

# 
AGE

# age != Age != AGE != ....

my_name_is <- "Beatriz" 
# MyNameIs




## Exercise: Create a variable `current_year` and store the
# current year in it: --- 

# Shortcut for assignment operator: alt -
# <- 

current_year <- 2024

# We can also perform operations with variables:

current_year - age

## Functions ---
# Functions are blocks of code that perform a specific task.
# We can use functions to avoid repeating code.

# We call a function by writing its name, followed by parentheses `()`.

# For example, Sys.Date() is a function that returns the current date:
Sys.Date()

## Data types ----

# R has several data types. The most common ones are:

# - Numeric: numbers with decimals.

# - Integer: whole numbers.

# - Character: text.

# - Logical: TRUE or FALSE.

# - Factor: categorical data.

# - Date: dates.

# Let's see some examples:

# Numeric:
height <- 1.75

# Integer:
age <- 31L

# Character:

name <- "Beatriz" # We can use single or double quotes to create a character.

# Logical:

is_alive <- TRUE

# Date

birth_date <- as.Date("1993-02-15")


# We can use the `class()` function
# to check the data type of a variable.

# For example, let's check the data type of the variable `birth_date`:
class(birth_date)
class("1993-02-15")

## Exercise: Creating variables ---------------




# 1. Create a variable called "birth_year" and store your birth year in it.


# 2. Create a variable called "is_veg" and store TRUE if you are vegetarian or vegan,
# and FALSE if you are not.


# 3. Create a variable called "city_born" and store the name of the 
# city where you were born.


# 4. Try to guess the data type of the variables below:
favorite_color <- "turquoise"
height <- "1.75"
age <- 31
city_born <- "Diadema"
is_veg <- "FALSE"



height + 1
as.numeric(height) + 1

## Types of data structures ----

# In R, we can store multiple values in a single object.
# The most common data structures are:
# - Vectors
# - Data frames
# - Lists
# - Matrices

## vectors ----

# A vector is a collection of elements of the same data type.
# We can create a vector using the `c()` function.

# For example, let's create a vector with the name of our favorite fruits:
bea_fruits <- c("banana", "watermelon", "grapes")

c("banana", 31, TRUE)


# BREAK 15H45


# Exercise: Create a vector with the name of your favorite fruits,
# and store it in a variable called `my_fruits`:


# We can access the elements of a vector using their index: Subsetting!

# For example, to access the first element of the vector `bea_fruits`:
bea_fruits[1]

# We can also access multiple elements at once:
bea_fruits[c(1, 3)]

## Data frames ----
# A data frame is a table-like object that stores data.
# It is a collection of vectors of the same length.

mtcars

# We will explore data frames in more detail soon!


## Packages ----

# R has a vast ecosystem of packages that extend its functionality.

# We can install a package using the `install.packages()` function.

# For example, let's install the `tidyverse` package:
# install.packages("tidyverse")

# After installing a package, we need to load it using the `library()` function:
library(tidyverse)

# Now we can use the functions and datasets from the `tidyverse` package.

# For example, let's check the dataset called Star Wars:

starwars

# We can also use the function `View()` to see the dataset in a new window:
View(starwars)
