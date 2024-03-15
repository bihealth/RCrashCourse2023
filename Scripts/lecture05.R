library(tidyverse)
## merging and matching ----
set1 <- letters[1:5]
set2 <- letters[3:7]

# set theory
intersect(set1, set2)
union(set1, set2)

# for data frames - concepts from data bases
# the intersecting part -> inner join (ids in both data frames)
# the data belonging to set1 -> left join (first vs second)
# the data belonging to set2 -> right join
# union -> outer join

df1 <- tibble(ID=sample(letters, 15), value1=rnorm(15))
df2 <- tibble(ID=sample(1:15, 15), 
              color=sample(c("black", "red", "green", "blue"), 15, replace = T))
df2$old_ID <- df2$ID
df2$ID <- sample(letters, 15)

# lets use tidyverse right away
small <- inner_join(df1, df2)
large <- full_join(df1, df2)
View(small)
View(large)
leftDf <- left_join(df1, df2)
View(leftDf)
rightDf <- right_join(df1, df2)
View(rightDf)
left_join(df2, df1) # same as line 29
# order of rows might change -> resorting might be necessary

df1 <- tibble(ID = c("a", "a", "b", "c"), no = 1:4, value = rnorm(4))
df2 <- tibble(ID = c("a", "a", "b", "c"), no = 1:4, value = runif(4))
inner_join(df1, df2) # intersection of values
inner_join(df1, df2, by = c("ID")) # it's joining only by ID
inner_join(df1, df2, by = c("ID", "no"), suffix = c(".df1", ".df2"))













