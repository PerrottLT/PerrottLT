# Install packages
#install.packages("gapminder")
#install.packages("dplyr")

# Load packages
library(gapminder)
library(dplyr)

# FILTER

# Can filter the dataset that is displayed use a pipe (%>%) and a condition or conditions.
gapminder %>%
  filter(year == 2007, country == "United States")

# ARRANGE
# Order data by a definded variable. Default is low to high
gapminder %>%
  arrange(gdpPercap)

# Order high to low
gapminder %>%
  arrange(desc(gdpPercap))

# We can combine keywords together. Note, another pipe is required.
gapminder %>%
  filter(year == 2007) %>%
  arrange(desc(gdpPercap))

# Order of keywords in this case doesn't matter.

gapminder %>%
  arrange(desc(gdpPercap)) %>%
  filter(year == 2007)
  
# MUTATE
# Can change a variable in the dataset
gapminder %>%
  #population in millions
  mutate(pop = pop / 1000000)

# Can add a variable to the dataset
gapminder %>%
  #population in millions
  mutate(gdp = gdpPercap * pop)

gapminder %>%
  mutate(gdp = gdpPercap * pop) %>%
  filter(year == 2007) %>%
  arrange(desc(gdp))

gapminder %>%
  filter(year == 2007) %>%
  arrange(lifeExp)
