# 1 Conditionals and control flow

# 1.1 Equality

# Comparison of logicals
TRUE == FALSE

# Comparison of numerics
-6 * 14 != 17 - 101

# Comparison of character strings
"useR" == "user"

# Compare a logical with a numeric
# Note, TRUE resolved to 1, FALSE to 0
TRUE == 1

# 1.2 Greater and less than
# Comparison of character strings
# For string comparison, R determines the greater than relationship based on alphabetical order.

"raining"<= "raining dogs"

# 1.3 Compare vectors
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Popular days
linkedin > 15

# Quiet days
linkedin <= 5

# LinkedIn more popular than Facebook
linkedin > facebook

# Compare matricies
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)

# When does views equal 13?
views == 13

# When is views less than or equal to 14?
views <= 14

# 1.4 Logical operatiors

# & / | (pipe)
# and / or

linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Take the final value in the vector
last <- tail(linkedin, 1)

# Is last under 5 or above 10?
last < 5 | last > 10

# Is last between 15 (exclusive) and 20 (inclusive)?
last > 15 & last <=20

# ! will reverse the operator - i.e NOT

!TRUE

!(5 > 3)

# Change the default working directory
setwd("C:\\Users\\lukep\\Coding\\PerrottLT\\")

# Read in a file using a relative filepath
df_fig7 <- read.csv(".\\Introduction to R\\data\\HESA\\Figure-7.csv",skip=14)

# Build a logical vector, TRUE if FPE is above or below set thresholds
FPE <- df_fig7$Number
FPE

# Count the number of TRUEs in extremes
extremes <- FPE < 10 | FPE > 100000
sum(extremes)

# 1.5 IF / ELSE statement

# Create a subset data frame to look at single rows only
df_total_provider <- subset(df_fig7 , Level.of.study == "All"
                            & Mode.of.study == "All"
                            & Country.of.HE.provider == "All"
                            & Region.of.HE.provider == "All"
                            & Domicile == "Total"
                            & UKPRN != "")
# Calculate the mean
mean <- mean(df_total_provider$Number)

 if (mean <= 10000) {
print("mean is fewer than 5 digits")
 } else if (mean <= 100000) {
  print("mean is 5 digits")
 } else {
  print("mean is 6 digits or greater")
}

