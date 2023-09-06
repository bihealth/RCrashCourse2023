library(tidyverse)
TB_ORD_Gambia_Sutherland_biochemicals <- read_delim("Datasets/TB_ORD_Gambia_Sutherland_biochemicals.csv",
delim = "\t", escape_double = FALSE, trim_ws = TRUE)
iris <- read_csv("Datasets/iris.csv")

library(readxl)
meta_data_botched <- read_excel("Datasets/meta_data_botched.xlsx")
# can we read multiple sheets
fname <- "Datasets/expression_data_vaccination_example.xlsx"
sheetnames <- excel_sheets(fname)
df1 <- read_excel(fname, sheet = sheetnames[1])
df2 <- read_excel(fname, sheet = sheetnames[2])
df3 <- read_excel(fname, sheet = sheetnames[3])

list_sheets <- lapply(sheetnames, function(tab) read_excel(fname, sheet = tab))
list_sheets[[1]]
# looping (for-loop)
# anonymous function (lambda expression in python)
# list of data data frames

# list of files in a directory
files <- list.files("Datasets/", pattern = "xlsx$", full.names = TRUE)
lapply(files, read_excel)

## issues: column names are mixture of capital and lower letters
library(janitor)
clean_names(meta_data_botched, case="sentence") 
clean_names(TB_ORD_Gambia_Sutherland_biochemicals)
clean_names(iris)

View(iris)

# let's clean up column names
iris <- clean_names(iris)
iris
typeof(iris$sepal_length) 
typeof(iris$petal_width) # double ... real number (floating), integer ... ganze Zahlen
class(iris$petal_width)

summary(iris)

library(colorDF)
summary_colorDF(iris)

## mending problems ----
# starting regular expressions 
teachers <- c("January", "Manuela")
grep("anua", teachers)  # find occurences, return index
grepl("anua", teachers) # find occurences, return boolean vectors
grep("^J", teachers) # first pattern, word starting with capital J

# find and replace
group <- c("ontrol", "Montrol", "Kontrol", "Kkkkkontrl", "hello Connnnnnntrol", 
           "oh what a nice day it is, controooool", "control ", "Control, incoming")

# replace upper-case "Control"
group2 <- gsub("[ckCKM]*on+tro*l", "control", group) # + exist 1 or more times , * exist 0 or more times
gsub(" ", "", group2)

# functions in R for cleaning data
tolower(group) # toupper()
trimws(group)

# package stringr - which has simplifications of regular expressions

## pattern ideas ----
# $ substitute / find at the end of a string
# ^ find at the beginning of a string
# + 1 or more times
# * 0 or more times
# . any character - > wild card
# [] multiple character -> [0-9] all numbers, [a-z] matches letters, [A-Z] 
# [a-zA-Z] all letters
group
gsub(".*ontrol", "control", group)

# typical example:
foo <- c("xxxxx15", "15.5", "15,5")
as.numeric(foo)
# remove all letters
foo <- gsub("[a-z]", "", foo)
# replace the , by a .
foo <- gsub(",", ".", foo)
as.numeric(foo)

## exercise 3.1 ----
sex <- c("male", "Male ", "M", "F", "female", " Female")
# to lower case
sex <- tolower(sex)
# change to one-letter code
# stay with longer code
gsub("fem", "f", sex)

# select letters, when standing alone
sex <- gsub("^f$", "female", sex)
sex <- gsub("^m$", "male", sex)

# remove white spaces
sex <- trimws(sex)

# genes in a consistent way
genes <- c("ankrd22", "ifng", "Nf-kb", " Cxcl 5", "CCL 6.", "ANK.r.d. 12")
# HGNC (all capital letters, no spaces, no dashes)
genes <- toupper(genes)
# remove spaces
genes <- gsub(" ", "", genes)
trimws(genes) # only beginning and end

genes <- gsub("-", "", genes)
gsub(".", "", genes) # removes everything . is the wildcard
genes <- gsub("\\.", "", genes) # \\ changes special character into 

gsub("[ -.]", "", genes)

# change to mouse notation
genes
# use stringr (part of tidyverse)
str_to_title(genes)


genes2 <- c("ANKRD22", "ANKEN", "ank.rep.domain 12", "ifng-1", "ANKRD-33", "  ankrd23", "MAPK")
# ankyrin repeat genes
# everything except ifng-1, MAPK
grep("ifng-1|MAPK", genes2, invert = TRUE)

# find ANK and the ending of a number
idx <- grep("ank|ANK.*[0-9]$", genes2)
genes2[idx]


















