# COUNT verb
# Install packages
#install.packages("dplyr")
#install.packages("tidyverse")
# Load packages
library(dplyr)
library(tidyverse)

# glipse(dataset_name) gives a glimpse of first few values and the datatype of each variable

# SELECT allows you to subset to variables of interest

# Change the default working directory
setwd("C:\\Users\\lukep\\Coding\\PerrottLT\\")

# Print the working directory
getwd()

# Read in a file using a relative filepath
df_fig7 <- read.csv(".\\data\\HESA\\Figure-7.csv",skip=14)

# COUNT returns the count of each observation.
# Use sort = TRUE to order from most to least common.
df_fig7 %>%
  count(UKPRN, sort = TRUE)


# We can add the argument wt, which stands for "weight", in this case equals to FPE.
# This means that the n column will be weighted by the FPE.
df_fig7 %>%
  count(UKPRN, wt = Number, sort = TRUE)

df_fig_noalls <- df_fig7 %>%
    filter(!str_detect(Level.of.study,"All"),
           Mode.of.study != "All",
           !str_detect(Domicile,"Total"),
           Country.of.HE.provider != "All",
           Region.of.HE.provider != "All")

# Get the extreme values
df_fig_noalls %>%
  group_by(Region.of.HE.provider) %>%
  slice_max(Number, n = 1)

# Get the extreme values
df_fig_noalls %>%
  group_by(Region.of.HE.provider) %>%
  slice_min(Number, n = 5)

