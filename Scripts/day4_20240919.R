df <- data.frame(a=1:5, b=6:10, c=11:15, d=16:20)
# the following two have the same result
df[ , -2]
df[ , c(1, 3, 4)]

df[ , 1:3] # first three
df[ , c("a", "b")]

library(tidyverse)
select(df, a, c)
df <- select(df, -b)

# how to select just one value
df[2, 3]
df$d[2]

transcriptome <- read_csv("../Datasets/transcriptomics_results.csv")

# checking the number of rows
# 1. read_csv et al. always print this information
# 2. look under "Environment" in Rstudio
# 3. dim(transcriptome)
dim(transcriptome)
nrow(transcriptome)

# Exercise 4.1
# many ways to solve it
# create a new data frame
selected <- data.frame(Gene = transcriptome$GeneName,
                       Description = transcriptome$Description,
                       LFC = transcriptome$logFC.F.D1,
                       FDR = transcriptome$qval.F.D1)
# use select()
selected <- select(transcriptome,
                   Gene = GeneName,
                   Description = Description,
                   LFC = logFC.F.D1,
                   FDR = qval.F.D1
                   )
# simply use column names and colnames()
selected <- transcriptome[ , c("GeneName", "Description", "logFC.F.D1", "qval.F.D1")]
colnames(selected) <- c("Gene", "Description", "LFC", "FDR")

# sorting
v <- sample(1:10)/10 
sort(v)
sort(v, decreasing = TRUE)
rev(sort(v))

# using order() to sort a vector
v
sel <- order(v)
v[ sel ]
# reverse
sel <- order(v, decreasing = TRUE)
v[ sel ]

# watch out for character vectors
v <- sample(1:200, 15)
v
sort(v)
v <- as.character(v)
v
sort(v)
id <- paste0("ID", v)
id
sort(id)

# how do we sort these IDs?
num_ids <- gsub("ID", "", id)
num_ids <- as.numeric(num_ids)
sort(num_ids)
id_order <- order(num_ids)
id_order
id[ id_order ]

# sorting a data frame
df <- data.frame(id=paste0("ID", 1:10), val=rnorm(10))
ord <- order(df$val)
df[ ord, ]
# same as
df[ order(df$val), ]

# reverse order
df[ order(df$val, decreasing=TRUE), ]
df[ order(abs(df$val), decreasing=TRUE), ]

# for sording data frames, we can use tidyvers and arrange
arrange(df, val)
arrange(df, desc(val)) # idiom
arrange(df, -val)
arrange(df, desc(abs(val))) # same as order(abs(df$val)) above


# example: transcriptomics
transcriptome <- read_csv("../Datasets/transcriptomics_results.csv")
selected <- select(transcriptome,
                   Gene = GeneName,
                   Description = Description,
                   LFC = logFC.F.D1,
                   FDR = qval.F.D1
)

selected
arrange(selected, FDR)
arrange(selected, LFC)
selected2 <- arrange(selected, desc(abs(LFC)))
abs(c(-1, 2, -3, -4, 5))

plot(selected2$LFC[1:250], type="b")
selected2 <- arrange(selected, FDR)
plot(selected2$LFC[1:250], type="b")

# filtering data frames
v <- c(-2, 1, 10, 5)
v > 1
which(v > 1)
v[ v > 1 ] # select elements > 1

keep <- selected$FDR < 0.05
sum(keep) # how many genes are sign. at FDR < 0.05

# how to filter the selected data frame?
sel_filt <- selected[ keep, ]
dim(sel_filt)

# more straightforward with tidyverse
sel_filt <- filter(selected, FDR < 0.05)

selected
selected <- arrange(selected, FDR)
selected

interferon <- grepl("Interferon", selected$Description, ignore.case = TRUE)
which(interferon)
# grep is the same as which(grepl())
grep("Interferon", selected$Description, ignore.case = TRUE)

int_df <- selected[ interferon, ]
# same with grep!
int_df <- selected[ grep("Interferon", selected$Description, ignore.case = TRUE), ]
# with tidyverse we *must* use grepl

int_df <- filter(selected, interferon)
int_df <- filter(selected, grepl("Interferon", Description, ignore.case = TRUE)) # idiom!

interferon <- c("TAP1","IFIH1","IRF7","PARP9","STAT1","PLSCR1",
                "IFITM1","HERC5","DDX60","USP18","RSAD2","IFIT1")
filter(selected, Gene %in% interferon)

# more advanced regular expressions
filter(selected, grepl("^GBP[0-9]$", Gene))
filter(selected, grepl("^GBP[0-9]", Gene))

filter(selected, grepl("(cytokine|chemokine) ", Description))
# how many cytokines / chemokines?
sel <- grepl("(cytokine|chemokine) ", selected$Description)
sum(sel)
# same as
sel <- grep("(cytokine|chemokine) ", selected$Description)
length(sel)


# logical vectors
l1 <- c(TRUE, TRUE)
l2 <- c(FALSE, TRUE)
l3 <- c(TRUE, FALSE)
l4 <- c(FALSE, FALSE)

l2 | l3
l2 & l3

l1 & l2
l1 | l4

# how about signifant chemokines?
chemocytokines <- grepl("(chemokine|cytokine) ", selected$Description)
significant    <- selected$FDR < 0.05
filter(selected, chemocytokines & significant)
filter(selected, chemocytokines | significant)

filter(selected, FDR < 0.05 & grepl("(chemokine|cytokine) ", Description))

# what is at the beginning / end of a data frame
head(selected)
tail(selected)


## merging

set1 <- letters[1:5]
set2 <- letters[3:7]
intersect(set1, set2)


# example df
transcr <- data.frame(ID=sample(letters, 15), mRNA=rnorm(15))
metabo <- data.frame(ID=sample(letters, 15), protein=rnorm(15))
intersect(transcr$ID, metabo$ID)

# inner join
df <- merge(transcr, metabo, by = "ID") # idiom!

# outer join
df <- merge(transcr, metabo, by = "ID", all = TRUE) # idiom!

# just slap next onto another, without real merge
cbind(transcr, metabo)
# or, slap one underneath the other
# this does not work, because the data frames have different column names
rbind(transcr, metabo)

df1 <- data.frame(ID=sample(letters, 15), value=rnorm(15))
df2 <- data.frame(ID=sample(letters, 15), value=rnorm(15))
df <- rbind(df1, df2)


# another merging example
df1 <- data.frame(subject.id=1:3, sex=c("M", "F", "F"), 
                  age=c(28, 35, 29))
df2 <- data.frame(subject.id=rep(1:3, each=2), 
                  timepoint=rep(1:2, 3), value=rnorm(6))
merge(df1, df2, by="subject.id")
