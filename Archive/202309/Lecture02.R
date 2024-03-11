## Functions ----
sample <- c(4, 6, 7, 2)
sample_n <- length(sample)

## Lilies on a lake ----
# water lilies on our lake
# every day the lilies covers twice the as much of the area
# at the beginning 1/100 of the lake area -> see ExerciseLilies

## Plotting in R ----
# R is able to export into multiple formats
# vector-based (adobe, inkscape) vs bitmap based (pixel-based, high resolution)
# manual changes are tedious
# different graphics frame work exist for R (base vs ggplot)

## Logicals ----
sel <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
sel
!sel

samples <- c(1, 1, 2, 5, 7)
# which samples are greater than 2? (5 and 7)
sel_greater <- samples > 2 # gives a logical vector
ind_greater <- which(samples > 2) # gives us the index

samples[sel_greater]
samples[ind_greater]

samples == 7
samples != 1

persons <- c("Aphrodite", "Bacchus", "Circe", "Demeter", "Eurypides")
sel <- c(TRUE, FALSE, FALSE) # be aware of different length of vectors
persons[sel]

## NaN ... Not a Number (not a numerical, very rare)
## NA ... Not available (missing data) -> is.na()


## Complex data types ---- 
# matrices -----
m <- matrix(1:18, ncol=3, nrow=6) # I can change the order
dim(m) # returns a vector with 2 element
dimension <- dim(m)
dimension[2]
m[3, 2] # first row, then columns
m[4, ]
m[,3]

# naming vectors and matrices
person <- c("January", "Weiner", NA)
names(person) <- c("FirstName", "LastName", "Age")
person
person["Age"]

rownames(m) <- c("A", "B", "C", "D", "E", "F")
#rownames(m) <- "A":"F" # iterating over letters doesn't work
rownames(m) <- LETTERS[1:nrow(m)]
colnames(m) <- letters[1:ncol(m)]

m["E", "b"] 
smallm <- m[1:2, 2:3] # you need an assignment

# lists ----
person[3] <- 99

person <- list(FirstName = "January", LastName = "Weiner", Age = 99)
length(person)
person[1]  # get's you a list (single [])
class(person[1])

person[[1]] # get's the element (different data type)
person[["FirstName"]] # same result
person$FirstName      # same result

# data frames ---- 
# excel tables

names <- c("January", "Manuela", "Bill")
lastn <- c("Weiner", "Benary", "Gates")
age <- c(99, NA, 65)

df_person <- data.frame(LastName = lastn, FirstName = names, Age = age) 
df_person
class(df_person)
class(df_person[, "Age"])
class(df_person[2, ])

m[2, ]  # this is a vector 
df_person[2, ] # this is a data.frame again

df_person[, "Age"]
df_person$Age






# tibble vs data frame
# extension from the tidyverse 

## using packages ----
library(tidyverse) # loading / attaching libraries
library(readxl)
# repositories: CRAN and Bioconductor
# https://www.bioconductor.org/
# https://cran.r-project.org/

iris_data <- read_tsv("Datasets/iris.tsv")

# we copied that part from the history to make our analysis reproducible 
library(readr)
iris_data <- read_csv("Datasets/iris.csv", skip = 3)
View(iris_data)
TB_ORD_Gambia_Sutherland_biochemicals <- read_delim("Datasets/TB_ORD_Gambia_Sutherland_biochemicals.csv",
delim = "\t", escape_double = FALSE, trim_ws = TRUE)

df <- read_csv("Datasets/TB_ORD_Gambia_Sutherland_biochemicals.csv") # this didn't work properly
df <- read_tsv("Datasets/TB_ORD_Gambia_Sutherland_biochemicals.csv")

















