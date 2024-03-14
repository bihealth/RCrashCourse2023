## paths in R ----
fname1 <- "C:/Users/mbenary_c/CUBI/teaching/202403_RCrashCourse/exerciseLilies.R" # absolute path - sometimes more reliable
fname2 <- "exerciseLilies.R" # relative path - good for sharing
# source(fname2) 

# where am I?
getwd()
# I want to be somewhere else
setwd() # possible, but I would recommend to stay in your project

# folders in your working directory, relating to outside data difficult

## loading / installing packages ---- 
install.packages("tidyverse")
# CRAN - Central R Archive Network: statistical packages / data analysis 
install.packages(c("colorDF", "tidyverse"))
# Bioconductor - biostatistical analysis 
install.packages("BiocManager")
BiocManager::install("limma") # install from CRAN or from Bioconductor
library(BiocManager) # same as line 19
install("limma")     # same as line 19

# loading a package:
library(tidyverse)
library(readxl)

iris <- read_csv("Datasets/iris.csv")
View(iris)

summary(iris)
class(iris$`Sepal Length`)
class(iris$`Sepal Width`)
typeof(iris$`Sepal Width`) # storage type

library(colorDF)
summary_colorDF(iris)

library(janitor)
iris <- clean_names(iris) # get consistent column names/header, you need to load library "janitor"

## regular expressions ----
# finding patterns
grep() # General REgular exPression

# substituting patterns
gsub()
group <- c("Control", " control", "control ", "Control   ", "control run 2")
gsub(" ", "", group)
group <- gsub("^ ", "", group)
group <- gsub(" +$", "", group)

## substituting white spaces - common alternative
trimws(group)
## capital letters
tolower(group)
toupper(group)


foo <- c("xfxxxx15", "15.5", "15,5")
as.numeric(foo)

gsub("[a-zA-Z]", "", foo)
foo <- gsub("[[:alpha:]]", "", foo) # same way to get there
foo <- gsub(",", ".", foo)
as.numeric(foo)

## pattern ideas ----
# $ substitute / find at the end of a string
# ^ find at the beginning of a string
# + 1 or more times
# * 0 or more times
# . any character - > wild card
# [] multiple character -> [0-9] all numbers, [a-z] matches letters, [A-Z] 
# [a-zA-Z] all letters

sex <- c("male", "Male ", "M", "F", "female", " Female")
clean_names(sex)

names(sex) <- letters[1:length(sex)]
names(sex)[1] <- "reaLLy Strange"
clean_names(sex) # clean names of tables, not the elements itself

# clean white spaces
sex <- trimws(sex)
# exchange capital letters to small letters
gsub("M", "m", sex)
gsub("F", "f", sex)

gsub("female", "f", sex, ignore.case = TRUE)  # order is important -> changing into a single letter
gsub("male", "m", sex, ignore.case = TRUE) 

tolower(sex)

# m/f vs male/female -> consistency is the key
sex <- tolower(sex)
sex <- trimws(sex)
sex <- gsub("^m$", "male", sex)
sex <- gsub("^f$", "female", sex)

# clean gene names ----
geneNames <- c("ankrd22", "ifng", "Nf-kb", " Cxcl 5", "CCL 6.", "ANK.r.d. 12")
# everything to capital
geneNames <- toupper(geneNames)
# remove white spaces
geneNames <- gsub(" ", "", geneNames)
# no dashes / dots / special character
geneNames <- gsub("-", "", geneNames)
geneNames <- gsub("[.]", "", geneNames)

geneNames <- gsub("[ .-]", "", geneNames) # same as the three lines above


# finding ankyrin repeat genes ----
ankGenes <- c("ANKRD22", "ANKEN", "ank.rep.domain 12", "ifng-1", "ANKRD-33", "  ankrd23", "MAPK")
# select 1, 3, 5, 6
# we would grep
# starting with ANK
# ending with number
ankGenes <- trimws(ankGenes)
grep("^ank.*[[:digit:]]$", ankGenes, ignore.case = TRUE)
















































































