library(tidyverse)
df <- tibble(ID=c("a", "a", "b", "c"), no=c(1, 2, 3, 4), 
             value1=rnorm(4), value2 = rnorm(4))


pivot_longer(df, cols = c(value1, value2)) %>% 
  pivot_wider(names_from = ID, values_from = value) # showing missing values


wideData <- pivot_longer(df, cols = c(value1, value2)) %>% 
  select(-no) %>% 
  pivot_wider(names_from = ID, values_from = value) %>% 
  unnest(a, b, c) # multiple entries - nested tables - unnest

# ggplot for heatmaps - no clustering
# geom_tile()

library(ComplexHeatmap)
mat <- as.matrix(wideData[, 2:4])
# rownames
rownames(mat) <- wideData$name
Heatmap(mat)
Heatmap(as.matrix(iris[,1:4]))

library(pheatmap)
pheatmap(mat)  
pheatmap(as.matrix(iris[,1:4]))

data <- read_excel("Datasets/20230628_Exhaustion serial killing FlowJo data.xlsx", sheet = 2)















