## Exercise 4.1/2
# loading libraries ----
library(tidyverse)


# loading data ----
expression <- read_csv("Datasets/transcriptomics_results.csv")

# cleaning / inspecting ----
# not necessary here

# start with analysis
# which genes are significantly downregulated? ----
# which day are we using? -> for comparison: Day 1

# filter for negative LogFC -> downregulation
# use order instead of filter -> it's not a subset; and subsequent orderings ignore previous ones
res <- filter(expression, logFC.F.D1 < 0)

# filter for pvalue -> significant genes
res <- filter(res, qval.F.D1 < 0.05)

# filter for two condition?
filter(expression, logFC.F.D1 < 0 & qval.F.D1 < 0.05)

# arrange by Gene
# sort / arrange
arrange(res, GeneName)

length(unique(res$GeneName))














# significant differences at qval < 0.05 and abs(log2FC) > 1.5. ----
filter(expression, abs(logFC.F.D1) > 1.5 & qval.F.D1 < 0.05)
sigRes <- filter(expression, (logFC.F.D1 > 1.5 | logFC.F.D1 < -1.5) & qval.F.D1 < 0.05) # order of operations is important

# which genes are ribosomal genes ----
# 1. use a pattern and search gene name - if you are familiar with the gene naming
# 2. use the description and search for ribosom(al)e
grep("ribosom", sigRes$Description, ignore.case = T) # nothing in our result data frame
selRibo <- grep("ribosom", expression$Description, ignore.case = T) 
View(expression[selRibo, ])

## In our results, which are cytokines and which are interleukines? ----
# search through description
selCytokines <- grep("cytokine|interleukin", sigRes$Description, ignore.case = T)
View(sigRes[selCytokines, ])

## doing multiple steps of an analysis ----
# jumping into pipes
expression %>% 
  filter(abs(logFC.F.D1) > 1.5) %>% 
  filter(qval.F.D1 < .05) %>% 
  filter(str_detect(Description, "interleukin")) -> sigLeukines

sigLeukines <- expression %>% 
  filter(abs(logFC.F.D1) > 1.5) %>% 
  filter(qval.F.D1 < .05) %>% 
  filter(str_detect(Description, "interleukin")) 














