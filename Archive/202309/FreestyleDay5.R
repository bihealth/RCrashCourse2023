library(tidyverse)
library(readxl)
library(janitor)
df <- tibble(ID=c("a", "a", "b", "c"), no=c(1, 2, 3, 4), 
                  value1=rnorm(4), value2 = rnorm(4))

df %>% 
  pivot_longer(cols = c(value1, value2)) %>% 
  pivot_wider(names_from = ID, values_from = value)

df %>% 
  pivot_longer(cols = c(value1, value2)) %>% 
  select(-no) %>% 
  pivot_wider(names_from = ID, values_from = value)


data <- read_excel("Datasets/exampleSplittingColumns.xlsx", sheet = 1) 

# clean data
data <- read_excel("Datasets/exampleSplittingColumns.xlsx", sheet = 1, skip = 2)
header <- read_excel("Datasets/exampleSplittingColumns.xlsx", sheet = 1)
colnames(data) <- colnames(header)
data <- clean_names(data)

# splitting columns 
# usually getting meta information from file names
data <- separate(data, sample, into = c("plasmid", "et", "treatment", "concentration"), sep = " ", remove = F)
data <- mutate(data, 
       plasmid = str_remove(plasmid, pattern = ".+_"),
       concentration = str_remove(concentration, pattern = "_.*")) 

data <- mutate(data, 
               treatment = ifelse(treatment == "No", "Control", treatment),
               concentration = ifelse(concentration == "chemo", "0ng", concentration))  
# data$treatment == "No"
data <- drop_na(data)
