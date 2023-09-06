## Lilies on a lake ----
# water lilies on our lake
# every day the lilies covers twice the as much of the area
# at the beginning 1/100 of the lake area 
# independent of the size of the lake

# x ... days
# coverage <- 1/100*2^(x-1)

# start with 10 days
# assign variables
x <- 1:10   # use c(1, 2, 3, 4, 5, 6, ...) ... not as convenient

# calculate coverage
coverage <- 1/100*2^(x-1)
perc_coverage <- coverage*100

# plot results
png(filename = "coverageLakeByLilies.png") # start plotting into file

plot(x, perc_coverage, xlab = "days", ylab = "% of covered area", 
     main = "Coverage of lake by waterlilies")
lines(x, perc_coverage, col = "blue", lwd = 2)
abline(h = 50, col = "darkred", lty = "dashed", lwd = 2)

dev.off() # finish plotting into file

