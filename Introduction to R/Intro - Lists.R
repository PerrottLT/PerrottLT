# Lists
# A list in R allows you to gather a variety of objects under one name.
# These objects can be matrices, vectors, data frames, even other lists, etc. It is not even required that these objects are related to each other in any way.

# Change the default working directory
setwd("C:\\Users\\lukep\\Coding\\PerrottLT\\")

# Print the working directory
getwd()

# Read in a file using a relative filepath
df_fig7 <- read.csv(".\\Introduction to R\\data\\HESA\\Figure-7.csv",skip=14)

# Create a vector
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

my_list

# Adapt list() call to give the components names
names(my_list) <- c("vec","mat","df")

my_list

# First 10 elements of the built-in data frame mtcars
my_df <- df_fig7[1:10,]


# Construct list with these different elements:
my_list <-list(my_vector, my_matrix, my_df)
