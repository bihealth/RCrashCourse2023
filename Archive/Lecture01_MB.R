# Use comments to document your code
# Basic concepts ----
aNumber <- 46
aCharacter <- "patient" # string (multiple letters) vs character (one letter)
aCharacter <- "c"
gender <- "male" # here it is a string: female, male, diverse, unknown - we could use a factor instead
rightNow <- Sys.Date() # date as a data type (complicated because of different formatting options)
aLogicals <- TRUE

bloodPressure <- c(180, 140, 120, 90, 140) # this is a simple vector
bNumber <- aNumber + 13
bNumber # printing a variable on the console
bloodPressure 

# use functions
min(bloodPressure)
sum(bloodPressure)

## Exercise 1 ----
teacher <- "manuela" # '' ``(data frame)
teachers <- c("manuela", "january")
teachers[2]
students <- c("Nicolas", "Anastasia", "Daniela")
length(students)
students[3]
students[-1] # negation - you have to be cautious
students <- c(students, "Bettina")
students[c(3,2)] # selected elements + changed the order
5:1
students[7]
students[c(1,2)] <- c("Arthur", "Beate")

count <- 1:5
countLong <- 1:10
patients <- c("male", "female", "female", "f")
factorGender <- factor(patients, levels = c("female", "male", "diverse", "unknown"))
c(bloodPressure, count)
pi # this is a constant
v1 <- c(1, 2, 5)
v2 <- c(10, 20, 30)

# concatenating vectors using c()
newBloodPressure <- c(v1, v2)
# sum of vectors element by element
v1 + v2

diameter <- c(1, 5, 8, 25)
circumference <- pi*diameter

# area of a circle: pi*r^2
areaCircle <- (diameter/2)^2*pi

## Other types of data and questions related ----
# csv-file (numbers, pseudonyms) -> more complex data type
# numbers with a certain constraints -> validation and consistency of data 
# time-course data
# Excel - dates and times
# 5 vs 5mg - remove text -> clean data 


