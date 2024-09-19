# current directory
getwd()

library(tidyverse)
library(readxl)
cars <- read_excel("../Datasets/cars.xlsx")
exampleMutationalData <- read_csv("../Datasets/exampleMutationalData.csv")

meta_data_botched <- read_excel("../Datasets/meta_data_botched.xlsx")
View(meta_data_botched)

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


# writing to files
library(writexl)
write_xlsx(meta_data_botched, "meta_data_botched_JW_20240918_v1.xlsx")

grep("2\\[5", c("12[5", "2x5"))

print(scdf(meta_data_botched), n = Inf)

# contingency tables
table(meta_data_botched$ARM, meta_data_botched$PLACEBO)

# one more trick
table(meta_data_botched$PLACEBO)

# rather than work on the column directly,
# create a copy and work on the copy
placebo <- meta_data_botched$PLACEBO
placebo[ placebo == 0 ] <- "NO"
placebo[ placebo == 1 ] <- "YES"
table(placebo)
placebo <- gsub("yes", "YES", placebo, ignore.case = TRUE)
table(placebo)
placebo <- gsub("no", "NO", placebo, ignore.case = TRUE)
table(placebo)

# check whether the copy is OK
table(placebo, meta_data_botched$PLACEBO)
table(placebo, meta_data_botched$ARM)

# insert the copy into the original column
meta_data_botched$PLACEBO <- placebo

# correcting ARM
# again, make a copy
arm <- meta_data_botched$ARM
table(arm)
arm[ arm == "control" ] <- "PLACEBO"
table(arm)
arm <- gsub("^A.*", "AGRIPPAL", arm)
arm <- gsub("^P.*", "PLACEBO", arm)
arm <- gsub("^F.*", "FLUAD", arm)
table(arm)
table(arm, placebo)
meta_data_botched$ARM <- arm


## trimws (trim whitespace), tolower, toupper
example <- c(" as df", "asdf", "  asdf    ")
trimws(example)

example <- c("No", "NO", "no")
tolower(example)
toupper(example)

# exercise 3.3
example <- c("male", "Male ", "M", "F", "female", " Female")
example <- trimws(example)
example <- toupper(example)
# one solution
# example <- gsub("^M.*", "MALE", example)
# example <- gsub("^F.*", "FEMALE", example)
# one more trick (idiom)
example <- gsub("^([MF]).*", "\\1", example)
example
example <- c("ankrd22", "ifng", "Nf-kb", " Cxcl 5", "CCL 6.", "ANK.r.d. 12")
example <- toupper(example)
example <- gsub("[- .]", "", example)
example <- gsub("[^A-Z0-9]", "", example)
example
example <- c("ANKRD22", "ANKEN", "ank.rep.domain 12", "ifng-1", "ANKRD-33", "  ankrd23", "MAPK")
grep("^ *ANK.*R.*D.*[0-9]+$", example, ignore.case = TRUE)


## using janitor
df <- data.frame(1, 2)
colnames(df) <- c("ctrl+", "ctrl-")
df
library(janitor)
clean_names(df)
