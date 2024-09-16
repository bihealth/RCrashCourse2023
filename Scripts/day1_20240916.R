# this does not work, because read_tsv is not defined
read_tsv("foo.bar")

# load the library with read_tsv
library("tidyverse")

# this does not work, because the file is not there
read_tsv("foo.bar")

# this doesnt work, because iris.tsv is not in ExampleProject
read_tsv("iris.tsv")

# we use the TAB key
read_tsv("../Datasets/iris.tsv")

# yeah, but this did not do anything much
# put the content of the file in a variable
iris_ds <- read_tsv("../Datasets/iris.tsv")

# achieving the same with two very different functions / commands
plot(iris_ds$Sepal.Length, iris_ds$Sepal.Width)
library(ggplot2)
ggplot(iris_ds, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()



# numeric vectors
a <- 5
b <- c(1.7, pi, 5, 10, 7e-3)

# character vector
myname <- "January"

a <- a * 2

b * 2
b * a
log10(b)
b^a
a + b

myname * a

# creating a vector containing a missing value (not available, NA)
b <- c(1.7, pi, 5, 10, NA, 7e-3)
b * 10

# special value: Infinity, Inf
weird <- 1/0

# special value: minus infinity, -Inf
weird * -1

# special value: not a number (NaN)
weird * 0
0/0

length(b)
i <- length(b)
i

## the following doesn't work because we don't have foo and bar variables!
t.test(foo, bar)

res <- t.test(foo, bar)
res$p.value

1:5
seq(1, 5)

seq(1, 5, length.out = 10)
?seq

# exercise 1.3
students <- c("Anna", "Bernie", "Claudia", "David")
sel <- c(3, 2)

students[3]
students[2]
# INCORRECT!
students[3, 2]

students[c(3, 2)]

students[c(3, 3, 2, 3, 2)]
# equivalent:
sel <- c(3, 3, 2, 3, 2)
students[sel]

sel <- c(3, 2)
students[sel]
students[sel] <- c("Arthur",
                   "Beate")

# factors
stu_f <- factor(students)
stu_chr <- as.character(stu_f)
as.numeric(stu_f)



# example values for five samples
samples   <- c(1, 10, 20, 21, 7, 5)
samples_n <- length(samples)

# calculate standard deviation of samples manually
samples_mean <- mean(samples)
samples_devs <- samples - samples_mean

# samples variance
samples_var  <- sum(samples_devs^2) / (samples_n - 1)

# sd is sqrt(variance)
samples_sd   <- sqrt(samples_var)

# alternative: use the built-in function
samples_sd <- sd(samples)


# exercise 1.4

days <- 1:10
area_1 <- 0.01

area <- area_1 * 2^(days - 1)

# base R graphics
plot(days, area, xlab="Days", ylab="Area in m²",
     ylim=c(0, 1))
abline(h=0.5)

# ggplot graphics
df <- data.frame(days = days, area = area)
ggplot(df, aes(x = days, y = area)) + 
  geom_point() +
  geom_hline(yintercept =  0.5)


days <- 1:10
area_day_1 <- 0.01

areas_double <- area_day_1 * 2^(days - 1)
areas_one_and_a_half <- area_day_1 * 1.5^(days - 1)

plot(days, areas_double, col="red", type="l", ylim = c(0, 1))
lines(days, areas_one_and_a_half, col="blue")
abline(h=0.5, col="grey")


ls("package:ggplot2")

