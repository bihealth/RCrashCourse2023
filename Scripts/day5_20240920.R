#

data(iris)
iris

library(tidyverse)

labwide <- read_csv("../Datasets/labresults_wide_full.csv")
mean(labwide$NEUT)
mean

tapply(labwide$NEUT, labwide$ARM, mean)
labwide_d1 <- filter(labwide, Timepoint == "D1")
tapply(labwide_d1$NEUT, labwide_d1$ARM, mean)
tapply(labwide_d1$NEUT, labwide_d1$ARM, sd)

labwide$arm_tp <- paste0(labwide$ARM, '_', labwide$Timepoint)
tapply(labwide$NEUT, labwide$arm_tp, mean)

boxplot(labwide$NEUT ~ labwide$arm_tp)

library(ggplot2)
theme_set(theme_minimal())
ggplot(labwide, aes(x = ARM, y = NEUT)) +
  geom_boxplot() +
  facet_wrap(~ Timepoint)

# use pull() to extract data from data frames

placebo_d1 <- filter(labwide, arm_tp == "PLACEBO_D1") |>
                     pull(NEUT)
fluad_d1 <- filter(labwide, arm_tp == "FLUAD_D1") |>
                     pull(NEUT)
t.test(placebo_d1, fluad_d1)

d1 <- filter(labwide, Timepoint == "D1" & ARM %in% c("FLUAD", "PLACEBO"))
# same:
d1 <- filter(labwide, Timepoint == "D1" & ARM != "AGRIPPAL")

t.test(NEUT ~ ARM, data=d1)

library(broom)
tidy(t.test(NEUT ~ ARM, data=d1))
tidy(wilcox.test(NEUT ~ ARM, data=d1))

# similar
mod <- lm(NEUT ~ ARM, data=d1)
summary(mod)
tidy(mod)

# ANOVA
tidy(anova(mod))

mod <- lm(NEUT ~ ARM * Timepoint, data=labwide)
anova(mod)


# PCA of four variables from the iris data set

pca <- prcomp(iris[, 1:4], scale.=TRUE)

df <- data.frame(pca$x, iris)

ggplot(df, aes(x=PC1, y=PC4, color=species)) + geom_point()

# test correlation
cor.test(df$PC1, df$PC2) # Pearson
cor.test(df$PC1, df$PC2, method = "s") # Spearman

cor.test(df$Petal.Length, df$Sepal.Length)
ggplot(df, aes(x=Sepal.Length, y=Petal.Length, color=Species)) + geom_point()

ggplot(df, aes(x=PC1, y=Petal.Length, color=Species)) + geom_point()
ggplot(df, aes(x=PC1, y=Sepal.Length, color=Species)) + geom_point()

pca <- prcomp(iris[, 1:4], scale.=FALSE)
var(pca$x[,1]) +
var(pca$x[,2]) +
var(pca$x[,3]) +
var(pca$x[,4])
var(df$Sepal.Length) +
var(df$Petal.Length) +
var(df$Sepal.Width) +
var(df$Petal.Width)

# pca of the lab wide dataset
prcomp(labwide) # this does not work
labwide_num <- select(labwide, ACA:WBC)
pca <- prcomp(labwide_num, scale.=TRUE)
df <- cbind(labwide, pca$x)

ggplot(df, aes(PC3, PC4, color = ARM, shape = Timepoint)) +
  geom_point()
ggplot(df, aes(PC1, PC2, color = SEX)) +
  geom_point() +
  facet_wrap(~ Timepoint)
ggplot(df, aes(PC3, PC4, color = SEX)) +
  geom_point() +
  facet_wrap(~ Timepoint)

library(pheatmap)
pheatmap(labwide_num, scale="column")

# correllation heatmap
cor_mat <- cor(labwide_num, method="s")
cor_mat
pheatmap(cor_mat, scale="none")

cor_mat <- cor(pca$x)
cor_mat
pheatmap(cor_mat, scale="none")



my_cleanup <- function(x) {
  x <- trimws(x)
  x <- gsub("MALE", "M", x)
  x <- tolower(x)
  x <- gsub("^m$", "male", x)
  x <- gsub("^f$", "female", x)
  x
}

test_v <- c("MALE", "     MALE", "xxxx ", "f")
my_cleanup(test_v)

library(janitor)

cols <- c("sex", "arm", "timepoint")
labwide_clean <- labwide |>
                 select(USUBJID, Timepoint, SEX, AGE, ARM) |>
                 clean_names() |>
                 mutate(sex = my_cleanup(sex)) |>
                 mutate(across(all_of(cols), my_cleanup))

labwide_clean$sex <- my_cleanup(labwide_clean$sex)

