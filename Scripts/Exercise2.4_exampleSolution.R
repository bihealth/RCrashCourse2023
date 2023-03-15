# Assume you have a 48 well-plate for a drug sensitivity analysis with viability scores.
# Before starting you experiment, you decided to leave out the border wells to avoid edge effects.
# The rows are treated with inhibitor 1 with increasing concentrations (control, low, medium, high). 
# Columns 2 to 4 are treated with inhibitor 2 with increasing concentrations (control, low, high) and column 5 to 7 are treated with inhibitor 3 (same concentrations as inhibitor 2).

# 1. Create a 6x8 matrix "drugSensitivity" with random numbers between 0 and 1. Use `matrix` and `runif`. These reflect your viability scores.

nrows <- 6
ncols <- 8
drugSensitivity <- matrix(runif(nrows*ncols), nrow = nrows)
   
# 2. Change the values of the border elements to NA.

drugSensitivity[c(1, nrows), ] <- NA
drugSensitivity[, c(1, ncols)] <- NA

# 3. Use row and column names to reflect treatments.
# Let's start with very general row and column names

rownames(drugSensitivity) <- LETTERS[1:nrows]
colnames(drugSensitivity) <- letters[1:ncols]

# Change the row names
rownames(drugSensitivity)[2:5] <- c("inh1_control", "inh1_low", "inh1_medium", "inh1_high")

# Change column names (in three steps for clarity)
colnames(drugSensitivity)[2:4] <- c("inh2_control", "inh2_low", "inh2_high")
colnames(drugSensitivity)[5:7] <- c("inh3_control", "inh3_low", "inh3_high")

# Select all wells with inhibitor 3.
drugSensitivity[, c("inh3_low", "inh3_high")]
# Which wells can be used as negative control?
drugSensitivity["inh1_control", c("inh2_control", "inh3_control")]
# Select only wells with a combination of inhibitor 1 and inhibitor 2.
drugSensitivity[c("inh1_low", "inh1_medium", "inh1_high"), c("inh2_low", "inh2_high")]


# What are potential problems of this approach?
# - one cannot change names, if they do not exist -> that's why we used general names in the beginning
# - using meta information in the row and column names can get messy