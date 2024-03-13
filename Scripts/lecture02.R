## more on vectors ----
person <- c("January", "Weiner", 134) # vector can have only one type of data
person <- c("January", Weiner, 134) # error because it expects a variable

# side-note: scientific notation 134e2
# quotation-marks: notates text -> strings

# naming a vector:
person[1]
names(person) <- c("FirstName", "LastName", "Age")
person["LastName"]

## logical vectors ----
sel <- c(TRUE, TRUE, TRUE, TRUE, FALSE)
# negate our vector
!sel # it only prints it
sel2 <- !sel
# other operators: and & / or |
TRUE & FALSE
TRUE | FALSE

# making comparison
samples <- c(1, 1, 2, 5, 7)
samples > 2

# operators: >, <, >=, <=, ==, != 
samples == 7
which(samples == 7) # verbose/literate programming
which(samples != 1)

persons <- c("Aphrodite", "Bacchus", "Circe", "Demeter", "Eurypides")
persons == "Bacchus" # not Greek
persons[sel2]
persons[c(TRUE, FALSE)] # be careful: reusing elements

## selecting which part to execute
# comments
# write your own functions
# source("lecture01.R")
# Rmarkdown - define blocks to be executed

## NAs ----
samples <- c(1, 10, NA, 15)
sum(samples, na.rm = T)
is.na(samples)  # Google is your friend

# How do you select only these samples which are not NA?
# select by logicals
samples[!is.na(samples)]
# select by position -> which() gives a position
ind <- which(is.na(samples))
samples[-ind]

# exclude values with NAs not the whole participant -> cleaning data

removeNAs <- function(x){
  sel <- !is.na(x)
  return(x[sel])
}

removeNAs(samples)
removeNAs(persons)
persons[1] <- NA
removeNAs(persons)

## matrices ----
# one data type

matrix1 <- matrix(1:18, ncol = 3, nrow = 6)
matrix1 <- matrix(1:18, ncol = 3, nrow = 6, byrow = TRUE)

length(matrix1)
dim(matrix1)
# number of cols
ncol(matrix1)
dim(matrix1)[2] # second element of dimensions

# extract the element in the first col, third row
matrix1[3, 1]
# extract the second row
matrix1[2, 1:3]
matrix1[2, 1:ncol(matrix1)]
matrix1[2, ]

matrix1[, 1]

colnames(matrix1) <- c("two", "three", "one")
matrix1[, "one"]

matrix1[1:2, 5]




