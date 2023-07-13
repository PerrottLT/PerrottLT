# What is a data frame?
# A data frame has the variables of a dataset as columns and the observations as rows.
# Each variable can be a different data type.

# Read in a file to a fixed filepath
# Skip first 14 rows as HESA data contains metadata as a header 
df_fig7 <- read.csv("C:\\Users\\lukep\\Coding\\PerrottLT\\Introduction to R\\data\\HESA\\Figure-7.csv",skip=14)

# Change the default working directory
setwd("C:\\Users\\lukep\\Coding\\PerrottLT\\")

# Print the working directory
getwd()

# Read in a file using a relative filepath
df_fig7 <- read.csv(".\\Introduction to R\\data\\HESA\\Figure-7.csv",skip=14)

# Print the variable names and top 6 observations
head(df_fig7)

# Print the variable names and last 6 observations
tail(df_fig7)

# Investigate the structure of the data frame
str(df_fig7)

# Creating your own dataset

# Definition of vectors
name <- c("Mercury", "Venus", "Earth", 
          "Mars", "Jupiter", "Saturn", 
          "Uranus", "Neptune")
type <- c("Terrestrial planet", 
          "Terrestrial planet", 
          "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", 
          "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 
              11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 
              0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name, type, diameter, rotation, rings)

planets_df

# Check structure
str(planets_df)

# Print out diameter of Mercury (row 1, column 3)
planets_df[1,3]

# Print out data for Mars (entire fourth row)
planets_df[4,]

# Select first 5 values of diameter column
planets_df[1:5,"diameter"]

# Select the rings variable from planets_df
rings_vector <- planets_df[,"rings"]

# Print out rings_vector
rings_vector

# Select planets with diameter < 1
subset(planets_df, subset = diameter < 1)

# Sorting
a <- c(100, 10, 1000)
order(a) 

# Use order() to create positions
positions <-  order(planets_df$diameter)
positions
# Use positions to sort planets_df

planets_df[positions,]