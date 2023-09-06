## Exercise 3.2
library(tidyverse)
library(janitor)
iris <- read_csv("Datasets/iris.csv")
iris <- clean_names(iris)

# using regular expression on a data frame -> you work column by column $
iris$sepal_length <- gsub(",", ".", iris$sepal_length)
iris$sepal_length <- gsub("[a-zA-Z]", "", iris$sepal_length)
iris$sepal_length <- as.numeric(iris$sepal_length)
summary_colorDF(iris)

which(is.na(as.numeric(iris$petal_length)))
iris$petal_length[115]
iris$petal_length <- gsub("[a-z]", "", iris$petal_length) # equivalent
iris$petal_length <- str_remove(iris$petal_length, "[a-z]")
iris$petal_length <- as.numeric(iris$petal_length)
iris$species <- tolower(iris$species)

plot(iris$sepal_length, iris$petal_length)
# wide format needed
ggplot(iris, aes(x = sepal_length, y=petal_length, color = species)) + 
  geom_point() +
  theme_classic()

# long format needed
ggplot(iris, aes(x = sepal_length, fill = species)) + geom_histogram()
ggplot(iris, aes(x = species, y = sepal_length, fill = species)) + geom_boxplot() +
  ylab("Length of Sepal") 

iris_long <- pivot_longer(iris, cols = matches("petal|sepal"))
ggplot(iris_long, aes(x = species, y = value)) + geom_boxplot() +
  facet_wrap(~name, scales = "free")

# use wide format (and matrices)
heatmap(as.matrix(iris[,1:4]))

## pivot_wider / pivot_longer



















