# Apply family

#
# lapply
# output is a list

# lapply takes a vector or list, "X", and applies the function "FUN" to each of its members.
# If "FUN" requires additional arguments, you pass them after you've specified "X" and "FUN" (...).
# The output of lapply() is a list, the same length as "X", where each element is the result of applying "FUN" on the corresponding element of X.



# The vector pioneers.
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math,tolower)

# Take a look at the structure of split_low
str(split_low)

# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low,select_first)

# Write function select_second()
select_second <- function(x) {
  x[2]
}

# Apply select_second() over split_low: years
years <- lapply(split_low,select_second)

# If a function is only likely to be used once, it may make sense to use anonymous functions.
# These are defined in the lapply function and saved locally for the duration of the run, not globally, so cannot be called outside of the lapply

names <- lapply(split_low, function(x) {x[1]})
years <- lapply(split_low, function(x) {x[2]})

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low, select_el, 1)

years <- lapply(split_low, select_el, 2)

#
# sapply
# output is a vector

# The first argument of sapply() is the list or vector "X"

lapply(split_low, select_el)
sapply(split_low, select_el)

#
# vapply
#

# vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)
# USE.NAMES is TRUE by default; in this case vapply() tries to generate a named array, if possible.

