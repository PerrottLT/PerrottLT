# SELECTING
# Install and  load packages

if(!require('dplyr')) {
  install.packages('dplyr')
  library('dplyr')
}

# Change the default working directory
setwd("C:\\Users\\lukep\\Coding\\PerrottLT\\")

# Print the working directory
getwd()

# Read in a file using a relative filepath
df_fig7 <- read.csv(".\\data\\HESA\\Figure-7.csv",skip=14)

# Select helpers:

# contains(): contains a literal string
df_fig7 %>%
  select(UKPRN, contains("provider"))

# starts_with(): starts with a prefix
df_fig7 %>%
select(UKPRN, starts_with("U"))

# ends_with(): ends with a prefix
df_fig7 %>%
  select(UKPRN, ends_with("n"))

# last_col()
df_fig7 %>%
  select(UKPRN, last_col())

# matches(): matches a regular expression
df_fig7 %>%
  select(UKPRN, matches("R"))
  slice_max(Number)

# everything(): all variable
df_fig7 %>%
  select(everything())

# one_of(): variables in character vector.
df_fig7 %>%
  select(one_of("UKPRN","Number"))

# num_range(): a numerical range like x01, x02, x03.
df_fig7 %>%
    select(num_range("UKPRN", 10:15))

glimpse(df_fig7)

# rename an aggregate field
df_fig7 %>%
  # Count the number of observations for each country
  count(Country.of.HE.provider) %>%
  # Rename the n column to num_obs_CoP
  rename(num_obs_CoP = n)

# rename in select
df_fig7 %>%
  select(country = Country.of.HE.provider)

# relocate verb
# retains all columns, good for moving only.

df_fig7 %>%
  relocate(Country.of.HE.provider, after = Domicile, Region.of.HE.provider, .before = Country.of.HE.provider )

