# current directory
getwd()

library(tidyverse)
library(readxl)
cars <- read_excel("../Datasets/cars.xlsx")
exampleMutationalData <- read_csv("../Datasets/exampleMutationalData.csv")

# it is possible to read some files directly from a URL using the readr package
foo <- read_csv("https://raw.githubusercontent.com/bihealth/RCrashCourse2023/main/Datasets/iris.csv")

cars <- read_excel("../Datasets/cars.xlsx", 
                   skip = 4)

fn <- readxl_example("deaths.xls")

fn

library(tidyverse)
myiris <- read_csv("../Datasets/iris.csv")
typeof(myiris[[1]])
class(myiris[[1]])
summary(myiris)

# this does not work
# myiris$Sepal Length
# you have to put it in quotes
myiris$`Sepal Length`

library(colorDF)
summary_colorDF(myiris)
# copy the function so we can use a shorter name
scdf <- summary_colorDF
scdf(myiris)
# print the whole summary
print(scdf(myiris), n = Inf)

# exercise 3.2
library(readxl)
meta_data_botched <- read_excel("../Datasets/meta_data_botched.xlsx")
View(meta_data_botched)
print(scdf(meta_data_botched), n = Inf)

# how to find non-numeric values in a vector that should be numeric
meta_data_botched$AGE
age <- as.numeric(meta_data_botched$AGE)
sel <- which(is.na(age))
meta_data_botched$AGE[sel]

# replace NAs with something
# meta_data_botched$AGE[sel] <- -99
# or: leave the NAs
# meta_data_botched$AGE <- as.numeric(meta_data_botched$AGE)
# or: manually correct the values
meta_data_botched$AGE[84] <- 36
meta_data_botched$AGE[122] <- 29
meta_data_botched$AGE <- as.numeric(meta_data_botched$AGE)

# check whether any value is na after conversion
any(is.na(meta_data_botched$AGE))
# if we expect exactly 2 NAs: check that
sum(is.na(meta_data_botched$AGE)) == 2

# "automatic" replacing with logical vectors
sel <- meta_data_botched$SEX == "male"
sum(sel)
which(sel)
meta_data_botched$SEX[which(sel)]
meta_data_botched$SEX[which(sel)] <- "M"
sel <- meta_data_botched$SEX == "MALE"
meta_data_botched$SEX[which(sel)] <- "M"

# we can make it into one statement
sel <- meta_data_botched$SEX == "male" | meta_data_botched$SEX == "MALE"
which(sel)
meta_data_botched$SEX[which(sel)] <- "M"

# or, even shorter - with a new operator!
sel <- meta_data_botched$SEX %in% c("male", "MALE", "Male", "mael", "männlich")
meta_data_botched$SEX[which(sel)] <- "M"



library(writexl)
write_xlsx(meta_data_botched, "meta_data_botched_JW_20240918_v1.xlsx")


