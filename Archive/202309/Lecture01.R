## Basic language types 
# Assignment and creating variables

a <- 2  # numbers
name <- "Manuela" # text

# vectors 
weightOfPatient <- c(62, 58, 60, 64) # vectors

# operators
a <- 3 + 5
a <- 10  # this assignment is the last and will overwrite 'a' from before
# a <- "test variable" # we cannot use it for basic numeric operations
b <- a*7

# functions for analysis
mean(weightOfPatient) # calculate mean weight
sum(weightOfPatient)

# how to find information on functions
?mean
help(sum)


## variable name and content
## teacher # name of an object / variable
## <- # assignment, add a value into a variable
teacher <- "manuela"
teachers <- c("manuela", "january")

c(1,  2,  5) +
c(10, 20, 30)

d <- c(1, 5, 13) # diameter of circles
area <- (d/2)^2*pi

# combine different vectors

as.numeric(c(teachers, weightOfPatient)) # this will remove text and make NaN

1/0*5 # = Infinity
0/0 + 5 # = Not a Number
Inf/Inf # = Not a Number

nchar(teachers) # number of characters in a string

## R is a functional language
## R uses vectors all the time
## vectors always have the same type

## Exercise 1.3
students <- c("Anna", "Bernie", "Claudia", "David") # c() is a vector, "Anna" is the value of the first element,
                                                    # students is the variable

students[1] <- "Berta"
students[c(-1, -2)] # remove the first two elements

-1:2 # indexing always starts at 1, negative indexing removes elements

c(1,  NaN,  5) + c(4, 2, 3)
mean(weightOfPatient)
weightOfPatient[3] <- NaN
mean(weightOfPatient, na.rm = TRUE) # adding parameters, ignoring missing values, new data type

students[-1:-2]
-1:2

# reserved words
T <- "whatever"
TRUE <- "something else" # TRUE is reserved as a boolean value
NaN <- 0


## elementary data types
# numbers 42.7, 5, ...
# text, character "b", "full sentences"
# boolean elements, TRUE and FALSE 

## factor (ordered set of elements)
f_teachers <- factor(teachers)
charDosing <- c("high", "low", "medium", "medium")
facDosing <- factor(charDosing, levels = c("low", "medium", "high"))
facDosing[3] <- "Medium" # generates an NA
facDosing

dosing <- factor(c("high", "low", "medium", "medium"), levels = c("low", "medium", "high"))
as.numeric(dosing)


factor(c("high", "low", "medium", "medium")) # ordering by alphabet

# usually used in advanced statistics









