library(tidyverse)
library(readxl)
# wide vs long ----
# replicates
df <- tibble(patient = c(1,1,2), sample=c("a", "b", "a"), replicate1 = c(12, 13, 24), 
                 replicate2 = c(11, 14, NA), wellness = factor(c(0, 0, 3), levels = 0:5)) 
df
colorDF::summary_colorDF(df)
# df is a wide format with respect to sample
# measurements are in replicate1/2 and wellness

longDF <- pivot_longer(df, c(replicate1, replicate2), names_to = "measurement", values_to = "value")
# long format

# wide format with respect to patient
longDF <- unite(longDF, col= "newColumn", sample, measurement)
pivot_wider(longDF, names_from = "newColumn", values_from = "value")

labData <- read_csv("Datasets/labresults_wide.csv")
View(labData)
# change to long format: 
?gather()  # old version in tidyverse
pivot_longer(labData, c(LBORRES.ACA, LBORRES.ALB), names_to = "measurement", values_to = "value")
pivot_longer(labData, LBORRES.ACA:LBORRES.WBC, names_to = "measurement", values_to = "value")

# gsub to delete > in column GFR
# make numeric
longLabData <- labData |> 
  mutate(LBORRES.GFR = str_remove(LBORRES.GFR, ">")) |> 
  mutate(LBORRES.GFR = as.numeric(LBORRES.GFR)) |> 
  pivot_longer(LBORRES.ACA:LBORRES.WBC, names_to = "measurement", values_to = "value")

data("iris")
names(iris)
# how to make it a long format?
pivot_longer(iris, c(Sepal.Length:Petal.Width), names_to = "Flower.Characteristics")

library(readxl)
cars <- read_excel("Datasets/cars.xlsx")
cars$name <- 1:nrow(cars)
cars

pivot_longer(cars, 1:2, names_to = "measurement")

## pipes in R ----
# base R (since 4.1)
# |>  
# tidyverse (way earlier -> now influencing base R)
# %>% 


## sorting data frames ----
# arranging your data
arrange(cars, speed)
# reverse
arrange(cars, rev(speed)) # reverse gives a strange results 
arrange(cars, desc(speed)) # descending / ascending


res <- read_csv("Datasets/transcriptomics_results.csv")
View(res)

# select columns Gene, Description, results for D1
colnames(res)
smallDF <- res[, c("GeneName", "Description", "logFC.F.D1", "qval.F.D1")]
# by position
res[, c(3, 5, 8, 9)]
# using tidyverse
select(res, GeneName, Description, logFC.F.D1, qval.F.D1)
select(res, starts_with("log")) # and their equivalents ...

colnames(smallDF) <- c("Gene", "Description", "LFC", "p.value")
library(colorDF)
summary_colorDF(smallDF)

# sort/arrange our data by log FC
arrange(smallDF, LFC)
# arrange by biggest absolute change in log FC -> genes that change massively
arrange(smallDF, desc(abs(LFC)))

# use logical if you know thresholds -> filter your data




