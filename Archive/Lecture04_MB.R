library(tidyverse)
library(colorDF)

## sorting and ordering ----
v <- sample(1:10)/10
sort(v)
sort(v, decreasing = TRUE)

rev(v) # reverse the order
rev(sort(v)) # decreasing sort, with nesting functions  (from inside out)

v %>% 
  sort() %>% 
  rev() -> v_dec

v %>% sort() # = sort(v) (tidyverse pipe)
v |> sort()  # = also sort(v) (base R pipe, after R version 4.1)

l <- sample(letters, 10)
sort(l)

v <- sample(1:200, 10)
v_char <- as.character(v)
sort(v_char) # be careful with sorting numbers, which are text
             # d14, d102, d303

## sort data frames
df <- data.frame(id=paste0("ID", 1:10), val=rnorm(10))

sort(df$val) # that does not sort the data frame
ord <- order(df$val)
df[ord, ]
df[order(df$val, decreasing = TRUE), ]

df[1, ]
df[, 1]

# we can also use tidyverse
arrange(df, val)
arrange(df, desc(val))

res <- read_csv("Datasets/transcriptomics_results.csv")
res <- res[, c(3, 5, 8:9)]
colnames(res) <- c("Gene", "Description", "LFC", "p.value")

summary_colorDF(res)
summary(res$Description)
desc.sum <- summary(factor(res$Description))

head(sort(desc.sum, decreasing = TRUE))

# find genes with the highest change in gene expression
ord <- order(abs(res$LFC), decreasing = TRUE)
res <- res[ord, ]
View(res)
plot(res$LFC[1:250])

ord <- order(res$p.value)
res <- res[ord,]
plot(res$LFC[1:250], type = "b")
plot(res$p.value, type="l", log="y")
abline(h = 0.05, col = "red")

# filter for significant genes (p value < 0.05)
sig.genes <- res$p.value < 0.05
res[sig.genes, ]

filter(res, p.value < 0.05)

res_sig_down <- res %>%
  filter(qval.F.D1 < 0.05) %>%
  filter(logFC.F.D1 < 0) %>%
  arrange(GeneName)


# searching 
interferon <- c("TAP1","IFIH1","IRF7","PARP9","STAT1","PLSCR1",
                "IFITM1","HERC5","DDX60","USP18","RSAD2","IFIT1")
sel <- res$Gene %in% interferon
res[sel, ]
filter(res, Gene %in% interferon)

# search for "interferon" in the Description
ind <- grep("Interferon", res$Description, ignore.case = TRUE)
View(res[ind, ])
res_int <- res[ind, ]

## search for GBP1, GBP2, GBP3, 
## but not GBP12 or pseudo-GBP1 (GBP1P1)
grep("GBP[1-9]+$", res_int$Gene)
grep("(GBP12|GBP1P1)", res_int$Gene, invert = T)

sel <- grep("(cytokine|chemokine)", res$Description, ignore.case = T)
View(res[sel, ])

# combining logical vectors
#      sampl1 sampl2
l1 <- c(TRUE, TRUE)  # different question, different data 
l2 <- c(FALSE, TRUE) # c(4,-3) < 0 
l3 <- c(TRUE, FALSE)
l4 <- c(FALSE, FALSE)

l2 | l3 # OR combination
l2 & l3 # AND combination
l1 & l2
l1 | l4

sel <- res$p.value < 0.05 & res$LFC < 0 & grepl("interferon", res$Description)
res[sel, ]

res %>% 
  filter(p.value < 0.05 & abs(LFC) > 1.5) %>% View()
  filter(str_detect(Description, "ribosom"))
  
sel <- res$p.value < 0.05 & (abs(res$LFC) > 1.5) & grepl("ribosomal", res$Description)
res_ribosomal <- res[sel,]
view(res_ribosomal)

vl <- c(10, 5, 3, 2, 1) 
order(vl > 4) & c(FALSE, TRUE, TRUE, FALSE, TRUE) # numbers can be logical values; FALSE = 0, TRUE >= 1

## merge data sets ----
# find common ids
set1 <- letters[1:5]
set2 <- letters[3:7]

# here c d e
intersect(set1, set2)
df1 <- data.frame(id = set1, weight = sample(40:50, length(set1)))
df2 <- data.frame(id = set2, height = sample(120:180, length(set2)))

merge(df1, df2) # inner join
merge(df1, df2, all = TRUE) # outer join or full join
merge(df1, df2, all.x = TRUE) # left outer join
merge(df1, df2, all.y = TRUE) # right outer join

## tidyverse
full_join(df1, df2)

df1 <- data.frame(ID=c("a", "a", "b", "c"), no=c(1, 2, 3, 4), 
                  value=rnorm(4))
df2 <- data.frame(ID=c("a", "a", "b", "c"), no=c(1, 2, 3, 4), 
                  value=rnorm(4))

merge(df1, df2)
merge(df1, df2, by = "ID")
merge(df1, df2, by = c("ID", "no"))

## combining data from a real data set ----
library(readxl)
exp.data <- read_excel("Datasets/expression_data_vaccination_example.xlsx", sheet = "targets")
lab.data <- read_csv("Datasets/labresults_full.csv")

View(exp.data)
View(lab.data)

intersect(names(exp.data), names(lab.data))
exp.data <- exp.data[, c("USUBJID", "ARM", "Timepoint", "SEX", "AGE")]
lab.data <- lab.data[, c("USUBJID", "Timepoint", "LBTEST", "LBORRES")]

full.data <- merge(exp.data, lab.data, by = c("USUBJID", "Timepoint")) # better be explicit
dim(exp.data)
dim(lab.data)
summary_colorDF(exp.data)
summary_colorDF(lab.data)
summary_colorDF(full.data)

dim(full.data)
61*2*31 # number of rows: # patients * # time points * # tests








