## Exercise 1.4 - Lilies on the pond ----
# calculation: 2^(x-1) / 100 
# x ... number of days

# start with 10 days
x <- c(1:10) # first idea 
# x <- seq(from=1, to=20, by=2) # second idea # both work

day1 <- 1/100 # area covered on day 1

coverage <- 2^(x-1) / 100 # calculation of Day 1-10
coverage <- day1*2^(x-1) 

# everything above 1 should be set to one
# select what is bigger than 1
biggerOne <- coverage > 1
coverage[biggerOne] <- 1
coverage[coverage > 1] <- 1 # works the same way, might get to complicated and not be readable

# plot and save an image
pdf("coverageLilies.pdf")
plot(x, coverage)
lines(x, coverage)
abline(h = .5, col = "red")
dev.off()



