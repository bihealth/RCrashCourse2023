## how can distinguish the different brackets?
# [] -> elements of a vector
# () -> this indicates a function
# some data -> function as a black box -> return one value
# {} -> block of code when defining a new function

c(4, 5, 6)
c("one", "two")

length(4:7)
help("length")
test <- help("length")
dim(4:7)
dim("some text")

## exercise 1 ----
# coverage of lake: 
# (2e(n-1))/100 # starting our count at 1
# 1/100 * 2^x # first day starting at 0

# 1. assign days into variable
day <- 0:9
# 2. calculate coverage
coverage <- 1/100*2^day
# 3. plot the result
plot(day, coverage)
abline(h=0.5, col = "green", lty = "dashed")
# on what day is half of the lake covered with lilies?
# when is coverage = 0.5
coverage == 0.5
# when is the coverage greater >= 0.5
coverage >= 0.5
day[coverage >= 0.5]


# 1. assign days into variable
day <- 0:9
startingCoverage <- 1/100
# 2. calculate coverage
coverage2 <- startingCoverage*2^day
# 3. plot the result
plot(day, coverage2)
abline(h=0.5, col = "green", lty = "dashed")

# saving a plot in a file (here we use png)
# pixel graphic vs vector graph
png() # pdf()
plot(day, coverage)
lines(day, coverage2, col = "blue")
abline(h=0.5, col = "green", lty = "dashed")
dev.off()

## continue with logical values
# comparison: > < == !=
coverage == 0.5 # elementwise comparison
coverage > 0.5

teachers <- c("January", "Manuela")
teachers == "January"
teachers == "Kirsten"

# is January somewhere in the vector teacher
"January" %in% teachers
c("January", "Kirsten", "Manuela") %in% teachers

sel <- coverage > 0.5
day[sel] # days with more than 50% coverage, 6-9
day[!sel]

which(teachers == "January") # giving you indices
T # reserved word / letter
T <- 32 # overwriting it with something different

rm("T") # remove variables from your environment
T
rm("p1")

## Exercise 2 ----
samples <- c(1, 10, NA, 15)
mean(samples) # mean is a function
mean(samples, na.rm = T)

calculateCoverage <- function(startingValue, days){
  y <- startingValue*2^days
  return(y)
}

calculateCoverage(0.001, 1:7)
calculateCoverage(0.01, 1:7)

## matrices ----

matrix(1:12, nrow = 3)
data <- matrix(1:15, nrow = 3, byrow = T)

dim(data)
nrow(data) # same as dim(data)[1]

data[2, 3]
data[,4]
rownames(data) <- LETTERS[1:nrow(data)]
colnames(data) <- letters[1:ncol(data)]
data

data["A",] # returns a vector 
data[5, ]

# exercise 2.4 ----
# structure your script and clean it
# drugSensitivity <- matrix(ncol=6, nrow=8)
# drugSensitivity
# ?runif
# runif(48, min = 0, max = 1)
values <- runif(48, min = 0, max = 1)
# matrix (values, nrow = 6, byrow = T)
drugSensitivity <- matrix (values, nrow = 6, byrow = T)
drugSensitivity[c(1, nrow(drugSensitivity)), ] <- NA
drugSensitivity[,c(1, ncol(drugSensitivity)) ] <- NA
drugSensitivity

person <- list(name="Weiner", 
               Age=NA, 
               given= c("January", "M."),
               inCUBIsince = 2019)

## using square brackets for accessing element
class(person[["given"]]) # this is more common
class(person["given"])
person$given
person

names <- c("January", "Manuela", "Bill")
lastn <- c("Weiner", "Benary", "Gates")
age   <- c(1001, NA, 65)

teachers <- data.frame(given = names, name = lastn, age = age)
class(teachers)
class(teachers[,1])
class(teachers[1,])
teachers[1,]
# works like a list
teachers$age

