## Exercise Merging ----
library(tidyverse)
library(readxl)

# load data 
# expression_data_vaccination_example.xlsx and labresults_full.csv
labResults <- read_csv("Datasets/labresults_full.csv")
exprData <- read_excel("Datasets/expression_data_vaccination_example.xlsx", sheet = 1)

# subject ID - USUBJID - how many do we have in common?
length(intersect(labResults$USUBJID, exprData$USUBJID))

# following information: Subject ID, ARM (group), Time point, sex, age, test name and the actual measurement
# how to select specific parts of a data frame?
# use [] to select columns
labResults[, "USUBJID"]

# use select from tidyverse
metaSel <- select(exprData, USUBJID, ARM, SEX, AGE, Timepoint)
labSel <- select(labResults, USUBJID, LBTEST, LBORRES, Timepoint)
