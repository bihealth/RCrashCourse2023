## Drug sensitivity ----
# creating a matrix with random numbers
random_numbers <- runif(n = 48, min = 0, max = 1) # uniform distribution
drug_sensitivity <- matrix(random_numbers, nrow = 6, ncol = 8)

# remove numbers from bordering rows / columns
drug_sensitivity[c(1, 6), ] <- NA
drug_sensitivity[, c(1, 8)] <- NA

# name the rows:
# rows are treated with inhibitor 1 (row 2 ... 5)
# with increasing concentrations (control, low, medium, high)
# Columns 2 to 4 are treated with inhibitor 2 
# with increasing concentrations (control, low, high) and 
# column 5 to 7 are treated with inhibitor 3 (same concentrations as inhibitor 2).

rownames(drug_sensitivity) <- c("blank 1", "control", "low", "medium", "high", "blank 2") # it's not possible to have the same name for multiple rows
colnames(drug_sensitivity) <- c("blank 1", "control inh2", "low inh2", "high inh2", "control inh3", "low inh3", "high inh3", "blank 2")

# select all wells from inhibitor 3
drug_sensitivity[c("control", "low", "medium", "high"), c("control inh3", "low inh3", "high inh3")]
drug_sensitivity


