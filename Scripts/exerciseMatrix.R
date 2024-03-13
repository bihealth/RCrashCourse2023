nr_col <- 3
nr_row <- 5
randMat <- matrix(rnorm(nr_col*nr_row), nrow = nr_row)

randDf <- as.data.frame(randMat) # changing an existing format
colnames(randDf) <- LETTERS[1:nr_col]
rownames(randDf) <- letters[1:nr_row]

randDf$D <- "A"
randDf$E <- c("A","B","A","B","A")
randDf$F <- runif(nr_row)
randDf$sequenceData <- seq(from=0, to=1, length.out=nr_row)
randDf$`white Space` <- NA
randDf$X

randDf[, 9] <- pi # works as well, no gaps allowed
