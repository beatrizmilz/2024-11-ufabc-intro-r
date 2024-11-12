## Tidyverse --------
# The tidyverse is a collection of R packages that share an underlying 
# design philosophy, grammar, and data structures.
# It is designed to make data science easier!


# We can load the tidyverse package using the `library()` function:
library(tidyverse)

# The tidyverse package includes several packages, such as:
# - ggplot2: for data visualization
# - dplyr: for data manipulation
# - tidyr: for data tidying
# - readr: for data import
# - and much more.

## Data import----

# The `read_csv()` function reads a CSV file and
# stores it in a data frame.

# CSV stands for "Comma-Separated Values" and is a common file format for
# storing data.

# In Brazil, it is commom to use semicolon (;) as separator instead of comma (,).
# In this case, we can use the `read_csv2()` function.

# Let's import a dataset to work with:
# Let's import the file that is stored in the `data` folder, called `pnud_min.csv`:

# The `read_csv()` function expects the path to the file as an argument.

read_csv("data/pnud_min.csv")

# Check the output on the console. What do you see? Did the data load correctly?


# We can use read_csv2() to read a CSV file with semicolon as separator:
read_csv2("data/pnud_min.csv")

# Check the output on the console. What do you see? Did the data load correctly?

# We imported, but we didn't store the data in a variable.

# Let's store the data in a variable called `pnud_data`:
pnud_data <- read_csv2("data/pnud_min.csv")

# Now, let's check the data imported!
View(pnud_data)

# We can also use the glimpse() function to get a quick overview of the data:
glimpse(pnud_data)

# We can check the name of the columns using the `colnames()` function:
colnames(pnud_data)

# Copying the output from the console into the script:
# [1] "ano"       "muni_id"   "muni_nm"   "uf_sigla"  "regiao_nm" "idhm"     
# [7] "idhm_e"    "idhm_l"    "idhm_r"    "espvida"   "rdpc"      "gini"     
# [13] "pop"       "lat"       "lon" 


# Now that we have the data, we can start exploring it!

# Data manipulation -----------------------------
# The dplyr package provides functions to manipulate data frames.
# The main functions are:
# - filter(): to filter rows
# - select(): to select columns
# - arrange(): to reorder rows
# - mutate(): to create new columns (or modify existing ones)
# - group_by(): to group data
# - summarise(): to summarise data


# Let's first see which are the years available in the dataset:
unique(pnud_data$ano)

# filter() -----------------------------
# Let's filter the data to select only the rows where the `ano`
# column is equal to 2010:

filter(pnud_data, ano == 2010)

# We can filter in multiple ways! For example, let's select only the rows
# where the `ano` column is equal to 2010 and the `idhm` column is greater than 0.8:
filter(pnud_data, ano == 2010, idhm > 0.8)

# Important: we are not changing the original data frame. 


## Exercise:

# 1. Filter the data to select only the rows where the `ano` column is equal to 2010
# and the `pop` column is greater than 1 million people.

# arrange() -----------------------------

# Let's arrange the data in ascending order of the `idhm` column:
arrange(pnud_data, idhm)

# Let's arrange the data in descending order of the `idhm` column:
arrange(pnud_data, desc(idhm)) 
# The `desc()` function is used to sort in descending order.


# We can also use the `arrange()` function with multiple columns:
arrange(pnud_data, ano, idhm)

## Exercise ----
# 1. Which are the municipalities with the highest population?
# Arrange the data in descending order of the `pop` column.

# select() -----------------------------

# Let's select only the columns `uf_sigla`, `muni_nm`, and `idhm`:
select(pnud_data, uf_sigla, muni_nm, idhm)

# We can also use the `select()` function to exclude columns:
select(pnud_data, -ano, -muni_id)

# Like when we are filtering, there is a lot of different ways
# to use the `select()` function.

## Exercise ----
# 1. Select only the columns `ano`, `muni_nm`, and `pop`.




# Pipe operator -----------------------------

# The pipe operator `(%>%` or `|>`) is used to chain functions together.
# This is usefull when we have multiple operations to perform on a data frame.

# For example, let's say we want to filter the data to select only the rows
# where the `ano` column is equal to 2010, then arrange the data in descending
# order of the `idhm` column, and finally select only the columns `uf_sigla`, `muni_nm`, and `idhm`.


# Instead of writing the code like this:
# select(arrange(filter(pnud_data, ano == 2010), desc(idhm)), uf_sigla, muni_nm, idhm)

# We can use the pipe operator to make the code more readable:
pnud_data |> 
  filter(ano == 2010) |> 
  arrange(desc(idhm)) |> 
  select(uf_sigla, muni_nm, idhm)


## Exercise: 

# 1. Filter the data to select only the rows where the `ano` column is equal to 2010,
# then arrange the data in descending order of the `pop` column, 
# and finally select only the columns `muni_nm`, `pop`, and `idhm`.

# mutate() -----------------------------
# The `mutate()` function is used to create new columns (or modify existing ones).

# Let's create a collumn called `pop_thousands` that creates a new column with
# the population in thousands:
pnud_data |> 
  mutate(pop_thousands = pop / 1000) |> View()

## Exercise ----

# 1. Create a new column called `gini_rounded` that rounds the `gini` column to 2 decimal places.
# Tip: Use the `round(x, digits = 2)` function, where `x` is the column you want to round.


# group_by() and summarise() -----------------------------

# The `group_by()` function is used to group data by one or more columns.

pnud_data |> 
  group_by(ano, regiao_nm) 

# The `summarise()` function is used to summarise data. We can use it to calculate
# summary statistics, such as the mean, median, sum, etc.

pnud_data |> 
  summarise(mean_idhm = mean(idhm), median_idhm = median(idhm))

# We usually use the `group_by()` and `summarise()` functions together!


summarized_pnud <- pnud_data |> 
  group_by(ano, regiao_nm) |> 
  summarise(mean_idhm = mean(idhm), median_idhm = median(idhm)) |> 
  ungroup()

# Exporting data -----------------------------

# We can use the `write_csv()` function to export a data frame to a CSV file.

# Let's export the `summarized_pnud` data frame to a CSV file:
write_csv(summarized_pnud, "data/summarized_pnud.csv")

# Check the `data` folder to see if the file was created!


# Creating plots -----------------------------
# The ggplot2 package is used to create plots in R. It is part of the tidyverse.

# For beginners, it can be easier to use the esquisse package to create plots.
install.packages("esquisse")


# After installing the package, we can use the `esquisse()` function to create plots.
library(esquisse)

# Let's use only the data for 2010 in this exercise.

pnud_data_2010 <- filter(pnud_data, ano == 2010)

# Start the esquisse interface:
esquisser(pnud_data_2010)

# What is important? Copying the code to the script!

# Exercise:

# 1. Create a histogram of the `idhm` column.

# 2. Considering the `idhm` column, create a boxplot for each region

# 3. Create a scatter plot for rdpc (income per capta) and life expectancy (espvida).
# Try to create a plot for each region


