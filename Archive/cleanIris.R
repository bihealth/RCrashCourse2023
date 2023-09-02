## Loading libraries ----
library(tidyverse)
library(readxl)
library(janitor) # if you don't have it yet : install.packages("janitor")
library(colorDF)

# Reading in data ----
iris <- read_csv("Datasets/iris.csv")

# Clean column names ----
iris <- clean_names(iris)

# Clean our data ----
# 1. changing species into lower case
iris$species <- tolower(iris$species) # assign it to the correct column

# 2. remove spaces in sepal_length
iris$sepal_length <- gsub(" ", "", iris$sepal_length)

# 3. remove spaces in petal_length
iris$petal_length <- gsub(" ", "", iris$petal_length)

# 4. change "," into "." in petal_length and sepal_length
iris$sepal_length <- gsub(",", ".", iris$sepal_length) # special meaning of . in pattern, not replacement
iris$petal_length <- gsub(",", ".", iris$petal_length)

# 5. remove letters in petal_length and sepal_length
iris$sepal_length <- gsub("[a-z]", "", iris$sepal_length, ignore.case = T)
iris$petal_length <- gsub("[a-z]", "", iris$petal_length, ignore.case = T)

# at the end: convert petal_length, sepal_length into numbers
iris$sepal_length <- as.double(iris$sepal_length)
iris$petal_length <- as.double(iris$petal_length)


# Write data into new file ----
write_csv(iris, file = "Datasets/irisClean.csv")
