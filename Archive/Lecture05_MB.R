library(tidyverse)
library(readxl)
library(colorDF)
library(janitor)
res <- data.frame(id = 1:10000, value = rnorm(10000))
head(res)

# when you read in data with read_ ... -> creates a tbl (data frame from tidyverse)
# read.csv ... base R functions

iris_base <- read.csv("Datasets/iris.csv") # changes special characters into "."
iris_tidy <- read_csv("Datasets/iris.csv")

class(iris_base)
class(iris_tidy)

iris_base
iris_tidy

data <- read_excel("Datasets/20230126_Prep for Manu.xlsx", sheet = "SAMPLES")
data %>% 
  fill(Cat., .direction = "down") # here the "." is part of the parameter name

data %>% 
  select(`Patient-ID`) %>% 
  separate(`Patient-ID`, into=c("ID", "tumor-type", "site", "fourth", "model", "last"), sep = "[-_]") 

## organoid models ----
# does the organoid preserve the mutation from patient
mut.data <- read_excel("Datasets/Mutational landscape Lung tumors and Organoids.xlsx")  
summary_colorDF(mut.data)

# selecting columns
mut.data[ ,1:4]
mut.data[, c("patient pseudonym", "mutated gene", "VAF tumor", "VAF tumor organoid")]
mut.data <- select(mut.data, c("patient pseudonym", "mutated gene", "VAF tumor", "VAF tumor organoid"))

mut.data <- mut.data %>% 
  clean_names() %>% 
  mutate(vaf_tumor2 = as.numeric(vaf_tumor)) %>% # = mut.data$vaf_tumor2 <- as.numeric(mut.data$vaf_tumor)
  mutate(vaf_organoid2 = as.numeric(vaf_tumor_organoid)) %>% 
  remove_empty()

plot(mut.data$vaf_tumor2, mut.data$vaf_organoid2, col=factor(mut.data$patient_pseudonym), pch = 19)

ggplot(mut.data, aes(x = vaf_tumor2, y = vaf_organoid2, color = patient_pseudonym)) + 
  geom_point(size=4) +
  theme_classic() + 
  scale_color_viridis_d()

mut.data %>% 
  pivot_longer(cols = c(vaf_tumor2, vaf_organoid2), names_to = "model") %>% 
  ggplot(aes(x = patient_pseudonym, y = mutated_gene, fill = value)) + geom_tile() +
  facet_wrap(~model)

mut.data %>% 
  pivot_longer(cols = c(vaf_tumor2, vaf_organoid2), names_to = "model") %>% 
  ggplot(aes(x = patient_pseudonym, y = mutated_gene, fill = value, group = model)) + 
  geom_tile(position = "dodge") +
  scale_fill_gradient(low = "white", high = "black") + 
  theme_minimal()

mut.data %>% 
  group_by(patient_pseudonym) %>% 
  mutate(new_gene = sample(mutated_gene)) %>% 
  select(patient_pseudonym, new_gene, vaf_tumor2, vaf_organoid2) %>% 
  write_csv("Datasets/exampleMutationalData.csv")



Survival <- read_excel("Datasets/Survival.xlsx")

# survival - ask are they normally distributed
summary_colorDF(Survival)
hist(log10(Survival$A2))

Survival %>% 
  select(EnsemblID, A2:S4) %>% 
  pivot_longer(A2:S4, names_to = "experiment") %>% 
  ggplot(aes(x = value)) + geom_histogram() +
  scale_x_log10() + 
  facet_wrap(~experiment)


Survival %>% 
  select(EnsemblID, A2:S4) %>% 
  pivot_longer(A2:S4, names_to = "experiment") %>% 
  ggplot(aes(x = experiment, y = value)) + geom_violin() +
  geom_boxplot(width=0.1) + 
  geom_jitter(size = 0.1, width = 0.1) +
  scale_y_log10()







