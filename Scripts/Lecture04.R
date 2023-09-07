## Long vs Wide format ----
# going back and forth or starting from scratch

# long -> wide -> long (not recommended)
# wide -> long -> transformation -> wide (might happen more frequently)

# don't worry about details when publishing code - it should be reproducible

## Sorting and ordering a data frame ----
library(tidyverse)
library(colorDF)
df <- tibble(id=paste0("ID", 1:10), val=rnorm(10))

arrange(df, val) # no need to use $
# how can we order by descending values
arrange(df, -val)      # works, might be more confusing
arrange(df, desc(val)) # more explicit

# how can we order by absolute numbers?
df <- arrange(df, abs(val)) # we are not changing values here

## Gene expression example ----
# Fold change: comparison to base line, but not symmetric (FC)
# Logarithm: 0 = FC of 1 ... no change, symmetric around 0 (LFC), base 2

exprData <- read_csv("Datasets/transcriptomics_results.csv") # well documented and consistent (no tidying)
exprData <- exprData[, c(3, 5, 8, 9)]
colnames(exprData) <- c("Gene", "Description", "LFC", "FDR")
# get to know your data set
summary(res)
summary_colorDF(res)
desc.summary <- summary(factor(res$Description)) # no sorting, summary of a factor is counting elements
sort(desc.summary) # base R version of arrange -> print out is a condensed version

# Unknown - not clear what the gene is doing
# (Others) - condensing information in R (nothing to do with the data, here genes)

sex <- c("Male", "Female", "Female", "Male", "Male")
summary(factor(sex))

# order by LFC - biggest, absolute changes
res <- arrange(res, desc(abs(LFC)))
plot(res$LFC[1:250], type = "b")

# order by FDR
res <- arrange(res, FDR)
plot(abs(res$LFC[1:250]), type = "b") # b ... both, points and lines
plot(res$FDR, type = "b", log = "y")
abline(h = 0.05, lty = "dashed", col = "red", lwd = 2)

# plotting in ggplot does not keep any orders
ggplot(res[1:250, ], aes(x = Gene, y = FDR)) + geom_point()

# ensure ordering specifically
res <- mutate(res, ind = 1:n())  # part of dplyr, works inside tidyverse
ggplot(res[1:250,], aes(x = ind, y = FDR) ) + geom_point()

# use FDR to select interestings genes
keep <- res$FDR < 0.05
res[keep, ]

# tidyverse
filter(res, FDR < 0.05) # filter rows by condition

## step-wise analysis vs overwriting ----
# step-wise for getting used to the analysis and testing
# overwriting, when you are sure and have memory-intense data
# preparing you for chunks and pipes

## writing and exporting tables ----
# export data, for saving your results 
# pretty tables -> Rmarkdown (example for tomorrow)










## Searching and subsetting ----
interferon <- c("TAP1","IFIH1","IRF7","PARP9","STAT1","PLSCR1",
                "IFITM1","HERC5","DDX60","USP18","RSAD2","IFIT1")

sel <- exprData$Gene %in% interferon
exprData$Gene[sel]

filter(exprData, Gene %in% interferon)
sel_interferon <- grepl("[iI]nterferon", exprData$Description)
# how many genes 
length(which(sel_interferon))
sum(sel_interferon) # same result

# all GBP1, GBP2, GBP3 (not pseudo-.., GBP12)
pattern <- "^GBP[1-3]$"
exprData[grepl(pattern, exprData$Gene), ]

# asking for two different things at the time
grep("cytokine|chemokine", exprData$Description, ignore.case = T)

## Combining logical vectors ----
# Operators for logical
# ! ... negation / not
# & ... and operator

log1 <- c(FALSE, TRUE, FALSE, TRUE)
log2 <- c(FALSE, FALSE, TRUE, TRUE, TRUE) # different length will throw a warning and loop through the smaller vector

log1 & log2
log1 | log2

# naming variables -> don't start with numbers, special characters
# _variable <- "test"

sel <- exprData$Gene %in% interferon
upreg <- abs(exprData$LFC) > 1
signif <- exprData$FDR < 0.05
exprData[sel & upreg & signif, ]






## Matching and merging data ----
# common identifiers 
set1 <- letters[1:5]
set2 <- letters[3:7]

# set operations / Mengenlehre / venn diagrams
intersect(set1, set2)

# SQL ... joins

df1 <- data.frame(ID=sample(letters, 15), value1=rnorm(15))
df2 <- data.frame(ID=sample(letters, 15), value2=rnorm(15))

merge(df1, df2) # inner join
inner_join(df1, df2) # same in tidyverse, more verbose

merge(df1, df2, all.x = TRUE) # left outer join, we keep everything from df1, amend with df2
left_join(df1, df2) # same, but no odering by ID

full_join(df1, df2) # outer join


# bit more complicated example ----
df1 <- data.frame(ID=c("a", "a", "b", "c"), no=c(1, 2, 3, 4), 
                  value=rnorm(4))
df2 <- data.frame(ID=c("a", "a", "b", "c"), no=c(1, 2, 3, 4), 
                  value=rnorm(4))

# hoping for column ID, no, and two columns for value
inner_join(df1, df2) # not what we want
inner_join(df1, df2, by = c("ID")) # creates new columns, but still not what we want
inner_join(x = df1, y = df2, by = c("ID", "no"))
# rename value might be an option
# create a new column with a unique identifier
df1$newID <- paste0(df1$ID, df1$no)
unite(df1, col = "newID",  ID, no, sep = "_")


