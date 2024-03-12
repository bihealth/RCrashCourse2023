## Exercise 1.4 - Lilies on the pond ----
# calculation: 2^(x-1) / 100 
# x ... number of days

# start with 10 days
x <- c(1:10) # first idea 
x <- seq(from=1, to=20, by=2) # second idea # both work

day1 <- 1/100 # area covered on day 1

coverage <- 2^(x-1) / 100 # calculation of Day 1-10
coverage <- day1*2^(x-1) 

plot(x, coverage)
lines(x, coverage)
abline(h = .5, col = "red")

# when is coverage above 0.5
# select something above
sel <- coverage > 0.5
coverage[sel]
ind <- which(coverage > 0.5) # element, not the day
x[ind]

# everything above 1 should be set to one

# saving pdf
# changing format




