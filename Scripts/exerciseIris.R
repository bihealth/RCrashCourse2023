library(tidyverse)
library(janitor)
library(colorDF)
fname <- "Datasets/iris.csv"

iris <- read_csv(fname)
iris <- clean_names(iris)

# explore
summary_colorDF(iris)

# change species into lower / upper letters
iris$species <- tolower(iris$species)
# change sepal_length / petal_length to numbers
sepLength <- as.numeric(iris$sepal_length)  # select column and make numeric
# which are na?
ind <- which(is.na(sepLength))
iris[ind, ]
# change , letters
iris$sepal_length <- gsub(",", ".", iris$sepal_length)
iris$sepal_length <- gsub("[[:alpha:]]", "", iris$sepal_length)
iris$sepal_length <- as.numeric(iris$sepal_length)

# same for petal_length
petLength <- as.numeric(iris$petal_length)
# which are na?
ind <- which(is.na(petLength))
iris[ind, ]
iris$petal_length <- gsub("[[:alpha:]]", "", iris$petal_length)
iris$petal_length <- as.numeric(iris$petal_length)

summary_colorDF(iris)
# scatter plot
# wide format -> heatmaps / scatterplots -> multiple measurements per line
ggplot(iris, aes(x = petal_length, y = petal_width, color = species)) + geom_point()

# long format
iris %>% 
  mutate(id = 1:n()) %>%  # index for flowers
  pivot_longer(sepal_length:petal_width, names_to = "measurement", values_to = "value") -> irisLong

ggplot(irisLong, aes(x = measurement, y = value, fill=species)) + geom_boxplot()












