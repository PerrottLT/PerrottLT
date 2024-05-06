# Install packages
#install.packages("dplyr")

# Load packages
library(dplyr)

# glipse(dataset_name) gives a glimpse of first few values and the datatype of each variable

# SELECT allows you to subset to variables of interest

# Change the default working directory
setwd("C:\\Users\\lukep\\Coding\\PerrottLT\\")

# Print the working directory
getwd()

# Read in a file using a relative filepath
df_fig7 <- read.csv(".\\data\\HESA\\Figure-7.csv",skip=14)

# Check the structure of the data
glimpse(df_fig7)

# Select two named columns
df_fig7 %>%
  select(UKPRN, HE.provider)

# Note, if you want a unique list, use distinct instead:
df_fig7 %>%
  distinct(UKPRN, HE.provider) 

# keep_all is FALSE by default. Setting to TRUE will bring through all variables
df_fig7 %>%
distinct(UKPRN, HE.provider, .keep_all = TRUE) 


