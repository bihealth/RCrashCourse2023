n_cols <- 8
n_rows <- 6

drugS <- matrix(runif(n_cols * n_rows), nrow=n_rows, ncol=n_cols)
drugS[1, ] <- NA
drugS[, 1] <- NA
drugS[n_rows, ] <- NA
drugS[, n_cols] <- NA

colnames(drugS) <- c("empty1", "Inh2_ctrl", "Inh2_low", "Inh2_high",
                              "Inh3_ctrl", "Inh3_low", "Inh3_high", 
                     "empty2")
rownames(drugS) <- c("empty1",
                     "Inh1_ctrl",
                     "Inh1_low",
                     "Inh1_medium",
                     "Inh1_high",
                     "empty2")
drugS[ 3:5, 3:4 ]
sel_col <- c("Inh2_low", "Inh2_high")
sel_row <- c("Inh1_low", "Inh1_medium", "Inh1_high")

sel_col <- grepl("Inh2", colnames(drugS))
sel_ctrl <- grepl("ctrl", colnames(drugS))
sel_col & !sel_ctrl

drugS[ , sel_col & !sel_ctrl ]

### lists

who <- list(myname = "January",
            mylastname = "Weiner",
            myage = 1e6,
            myexperiment = drugS)
who[["myname"]]
who$myname

class(who)
class(who[["myname"]])
class(who$myname)
class(who["myname"])

who

whoname <- list(myname = "January")
whoname2 <- who[ c("myname", "myage") ]


x1 <- rnorm(20)
x2 <- rnorm(20) + 1
boxplot(x1, x2)
res <- t.test(x1, x2)
res$p.value

names <- c("January", "Manuela", "Bill")
lastn <- c("Weiner", "Benary", "Gates")
age   <- c(1001, NA, 65)
teacher <- c(TRUE, TRUE, FALSE)

d <- data.frame(names=names, last_names=lastn, age=age, teacher=teacher)
class(d)
class(d[,1])
class(d[,3])

d[ , 1]
d[ , "names"]
d$names

one_row_dataframe <- d[1, ]

class(drugS[ 1, ])
drugS[,2]

mtx <- matrix(rnorm(15), nrow=5, ncol=3)
mtx
df <- as.data.frame(mtx)
df
colnames(df) <- c("Measurement1", "BP", "CRP")
df
rep("A", 5)
df$Group <- rep("A", 5)
1:5
?seq
seq(0, 1, length.out = 5)
df$Fraction <- seq(0, 1, length.out = 5)
df$Strain <- c( rep("KO", 2), rep("WT", 3))
