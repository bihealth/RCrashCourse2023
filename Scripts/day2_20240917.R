# using character indices

person <- c("January", "Weiner", 134)
names(person) <- c("FirstName", "LastName", "Age")
person[1]
person["FirstName"]
person["Age"]

# converting to numbers

person <- c(10, 20, "30")
person
person * 10
person <- as.numeric(person)
person
person * 10

person <- c("January", "Weiner", 134)
as.numeric(person)

measurement <- c(10, 20, "> 40", "N.d")
as.numeric(measurement)

## NULL value

mynull <- NULL

## logical vectors

sel <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
sum(sel)
!sel
sum(!sel)

samples <- c(1, 1, 2, 5, 7)
samples >= 2
sum(samples >= 2)
sel <- which(samples >= 2)

# this will return the same result as sum(samples >= 2)
length(sel)
samples[sel]
samples[sel] <- 2
samples

persons <- c("Aphrodite", "Bacchus", "Circe", "Demeter", "Eurypides")
sel     <- c(TRUE, TRUE, TRUE, TRUE, FALSE)
persons[sel]

# Exercise 2.1

samples <- c(1, 10, NA, 15)
mean(samples)
NA + 5

mean(samples, na.rm = TRUE)
?mean
which(is.na(samples))


samples <- c(1, 10, NA, 15, NA)
which(is.na(samples))
sel <- !is.na(samples)
samples[ sel ]
samples[ !is.na(samples) ]

areas <- c(0.1, 0.2, 0.4, 0.8, 1.6, 3.2)

# the following are equivalent
areas[ which(areas > 1)]
areas[ areas > 1 ]

# logical operations on logical vectors
a <- c(1, 2, 3)
b <- c(5, 6, 7)
a + b

a <- areas > 1 
b <- areas < 0.3
a | b
a & b

## rep and paste

rep(c("A", "B"), 5)
repvec <- rep(c("A", "B"), 5)
length(repvec)
rep(c("A", "B"), each=5)
length(rep(c("A", "B"), each=5))
  
paste("A", "B", "C")
length(paste("A", "B", "C"))
paste0("A", "B", "C")

a <- c("A", "B", "C")
b <- c("1", "2", "3")
paste0(a, b)

# exercise 2.1b
a <- rep(c("A", "B", "C"), each = 3)
b <- rep(1:3, 3)
ab <- paste0(a, b)
rep(ab, each = 3)


# matrices

m <- matrix(1:18, ncol=3, nrow=6)
m <- matrix(0, ncol=3, nrow=6)
View(m)

# compare with
m <- matrix(1:18, ncol=3, nrow=6, byrow=TRUE)

# dimensions of the matrix; rows first, then columns
dim(m)
ncol(m)
nrow(m)

# all values in the first row
m[ 1, ] 
m[1,]

# all values in the second column
m[ , 2]

# select more than one column
m[ , 1:2]
m[ , c(1, 3)]

# same as simply m
m[ , ]

m[ 2, 3 ] <- 42
m[ 1, ] <- pi

# this converts the whole matrix to character values
m[ 2, 3 ] <- "FORTY two"

# this actually converts the matrix to a one dimensional vector
as.numeric(m)

# row and column names
m <- matrix(1:18, ncol=3, nrow=6, byrow=TRUE)
colnames(m) <- c("foo", "bar", "baz")
m[ , "foo" ]
m[ , 1 ]
nrow(m)


letters
LETTERS

rownames(m) <- letters[1:6]
m[ "a", ]

m[ 1, ]
m[ "a", "foo" ]

paste0(rep(letters, each = 26), rep(letters, 26))

rownames(m) <- 2:7
m[2, ]
m["2", ]

# use a prefix
rownames(m) <- paste0("ID", 2:7)
m[2, ]
m["ID2", ]

areas
aeas

# out of bonds
m[ , 54 ]

## plate exercise

levs <- c("ctrl", "low", "high")
inhs <- rep(paste0("Inh", 2:3), each=3)
drugSensitivity <- matrix(runif(48), nrow=6)
colnames(drugSensitivity) <- c("border1", paste0(inhs, "_", levs), "border2")
rownames(drugSensitivity) <- c("border", 
                               paste0("Inh1_", c("ctrl", "low", "mid", "high")), 
                               "border")
# lists

person <- list(name="Weiner", 
               Age=c(1, 2, 42, 123), 
               given="January")
person$Age * 2
length(person$Age)

# adding and removing elements of a list
person$city <- c("Berlin", "Hoppegarten", "Krakow")
person$city <- NULL

person <- list("Weiner", 
               c(1, 2, 42, 123), 
               "January")
person[[1]]



testres <- t.test(rnorm(10), rnorm(10, mean=2))
testres$p.value

# this works
testres$p.value * 100
testres[["p.value"]] * 100

testres["p.value"]
# this will not work
testres["p.value"] * 10


# data frames

names <- c("January", "Manuela", "Bill")
lastn <- c("Weiner", "Benary", "Gates")
age   <- c(1001, NA, 65)

d <- data.frame(names=names, last_names=lastn, age=age)

# the following are the same

# selecting columns OFTEN returns a vector
d[,1]

# this ALWAYS returns a vector
# these three are always used to access only one column
d$names
d[["names"]]
d[[1]]

d$names[1:2]

# selecting rows ALWAYS returns another data frame
d[ 1, ]

class(d)
class(d[,1])
class(d[,3])

## adding a column
d$city <- c("Hoppegarten", "Berlin", "Seattle")
# change the order of columns
d2 <- d[ , c("last_names", "names", "age")]

d$city <- NULL



# checking the type of your data
class(d)
class(1:10)
typeof(d)
typeof(1:10)
is.data.frame(d)
is.list(d)
is.matrix(d)
is.numeric(d)
is.integer(pi)
is.numeric(pi)

class(person)
is.data.frame(person)
is.list(person)

class(d$names)
class(d$age)

summary(d)
summary(d$age)
summary(d$names)
summary(person)
