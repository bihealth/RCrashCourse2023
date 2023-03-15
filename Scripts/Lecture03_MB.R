## Loading libraries ----
library(tidyverse)
library(readxl)
library(janitor) # if you don't have it yet : install.packages("janitor")
library(colorDF)

## Exercise 2.6 ----
iris <- read_csv("Datasets/iris.csv")
# with wrong file-ending
# \t
TB_ORD_Gambia_Sutherland_biochemicals <- read_delim("Datasets/TB_ORD_Gambia_Sutherland_biochemicals.csv", 
                                                    delim = "\t", escape_double = FALSE, trim_ws = TRUE)
meta_data_botched <- read_excel("Datasets/meta_data_botched.xlsx")
                                                    
# Diagnose problems ----
View(iris)
# iris data set
# , and . mixed
# ? and . in the header
# justification of columns -> based on data type
# upper and lower case letters
# letters in the numbers

typeof(iris$Petal.Width)      # use $ to select one specific column
typeof(iris$`Sepal Length`)   # " ' which are interchangeable and ` column name with special characters
typeof(iris$`Petal?Length`)

typeof("January")

# how to change column names?
iris <- clean_names(iris)     # remember: we only change a variable when we use "<-"
View(iris)
summary(iris$sepal_width)
summary(iris$sepal_length)
summary_colorDF(iris)

## substitute (search and replace) ----
group <- c("ontrol", "Montrol", "Kontrol", "Kkkkkontrl", "hello Connnnnnntrol", "oh what a nice day it is, controooool", "control ", "Control, incoming")
unique(group)
unique(iris$species)

group
group2 <- gsub(pattern = "[ckCK]+on*tro*l$", replacement = "control", group) 
group != group2

gsub(pattern = " ", replacement = "", group) # removing all white spaces
tolower(group) # we are only printing the result
toupper(group)
trimws(group)

## how does trimws() work
gsub(" ", "", group) # remove all white spaces
example <- c(" control", "control   ")
example <- gsub("^ ", "", example)
gsub(" $", "", example) # removes exactly one white space
example <- gsub(" +$", "", example) # one or more white spaces at the end

foo <- c("a1_123", "a1_231", "a2_17", "B2_23", "c2_889", "ä3_ß")
# substitute numbers
gsub("[0-9]", "", foo)
# substitute letters
gsub("[a-z]", "", foo) 
# removing all letters:
# use tolower first
# ignore cases
foo2 <- tolower(foo)
gsub("[a-z]", "", foo2)
gsub("[a-z]", "", foo, ignore.case = T)
gsub("[a-z0-9]", "", foo)
gsub("[[:alpha:]]", "", foo)
gsub("[[:alnum:]]", "", foo)
gsub("[^[:alnum:]]", "", foo)

## Exercise 3.1 ---
gender <- c("male", "Male ", "M", "F", "female", " Female")
# 1. trimws
gsub("^M$", "Male", gender)
# What regular expression matches all of the ankyrin repeat genes (but not other genes) in the following vector: 

genes <- c("ANKRD22", "ANKEN", "ank.rep.domain 12", "ifng-1", "ANKRD-33", 
"  ankrd23", "MAPK")
genes <- tolower(genes)
genes <- trimws(genes)
grep("ank.*[0-9]$", genes) # * 0 or more elements sdgfaga*  sdgfag  sdgfagaaaaaa
grep("ank.+[0-9]$", genes) # + 1 or more elements sdgfaga+ sdgfaga sdgfagaaaaaa

# 2nd way
genes2 <- c("ANKRD22", "ANKEN", "ank.rep.domain 12", "ifng-1", "ANKRD-33", 
           "  ankrd23", "MAPK")
pattern <- "^ *ANK.*R.*D.*[0-9]+$"  # .* any character 0 or more
grep(pattern=pattern, x=genes2, ignore.case=TRUE)
grepl(pattern=pattern, x=genes2, ignore.case=TRUE)

## use gsub to clean data frames ----
# , and . mixed
# ? and . in the header
# justification of columns -> based on data type
# upper and lower case letters
# letters in the numbers
# Goal: clean the iris - data set

# how to identify mistakes
nrSepal <- as.double(iris$sepal_length) # change text into numbers  - will be NA if not possible
sel <- which(is.na(nrSepal)) # which elements are not a number? 
iris$sepal_length[sel] # go back to my original data and look at those two elements

ageAsNumber <- 68
ageAsText <- "68"

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

iris %>% 
  mutate(sepal_length_round = round(sepal_length, digits = 0)) %>% 
  filter(species == "setosa")

iris %>% 
  ggplot(aes(x = petal_length, y = petal_width, col = species)) + geom_point()





