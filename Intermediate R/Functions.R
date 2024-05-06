# Intro to functions
# Consult the documentation on the mean() function
help(mean)

# Inspect the arguments of the mean() function
args(mean)

linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
avg_sum <- mean(linkedin + facebook)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(linkedin + facebook, trim = 0.2)

# Inspect both new variables
avg_sum
avg_sum_trimmed

# By default, na.rm = FALSE. This won't factor in NA values.
# Setting na.rm = TRUE will account for these and remove them from the calculation

# Calculate the mean absolute deviation
mean(abs(linkedin - facebook),na.rm = TRUE)

# Writing functions

# Create a function pow_two()
pow_two <- function(x) {
  x**2
}

# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(a, b) {
  abs(b) + abs(a)
}

# Use the function
sum_abs(-2, 3)

# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
  y <- x ^ 2
  if (print_info == TRUE) {
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}

pow_two(5)

# Define the interpret function
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return (num_views)
  } else {
    print("Try to be more visible!")
    return (0)
  }
}

# Call the interpret function twice
interpret(linkedin[1])

interpret(facebook[2])


# Packages

# install.packages(), which as you can expect, installs a given package.
# library() which loads packages, i.e. attaches them to the search list on your R workspace.

# Load the ggplot2 package
library(ggplot2)

# Retry the qplot() function
qplot(mtcars$wt, mtcars$hp)

# Check out the currently attached packages again
search()