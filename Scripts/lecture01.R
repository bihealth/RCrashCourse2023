## this is a comment
# folding and sections are a feature of RStudio
# same with colors
## assign a variable ----

a <- 2  # this works the same as a=2, it's an assignment
3 -> a  # don't do at the beginning
# for clarity: use "<-"
# 3=a 

name <- "Manuela"
a <- c(120, 160, 130) # c() is a function to define a vector

a <- 3 + 5 # spaces help visibility
b <- a*7
d <- a^2

## functions ----
a <- c(2, 3, 5)
sum(a) # functions (parameters)
length(a)

?factor() # get help
# factor for ordering groups

# element-by-element
# element-by-position

teacher <- "Manuela"
teachers <- c("Manuela", "January")

teachers <- c(teachers, "Dieter")

# constants: pi, e 

vec1 <- 1:10
vec2 <- 20:30

vec1 + vec2 # one vector is longer than the other / warning / recycle
as.numeric(teacher) # warning 

students <- c("Anna", "Bernie", "Claudia", "David")
sel <- c(1, 2)

students[sel]
students[sel] <- c("Arthur", "Beate") # overwrites element 1 and 2

students[1:3]
students[c(3, 1, 2, 4)] # ordering is changed, but not assigned
students[-1] # everything but the first one
students[-1:2]
students[-1:-2] # this is only printed and not assigned to a variable

## factors ----
# ordering of groups / look like characters, in fact are integers
# male vs female (0 vs 1)

dosis <- c("low","low", "medium", "high")
factor(dosis, levels = c("low", "medium", "high")) # if the ordering is important
# might be important in ANOVA

students









