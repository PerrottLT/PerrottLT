# Install packages
#install.packages("gapminder")
#install.packages("dplyr")
#install.packages("ggplot2")


# Load packages
library(gapminder)
library(dplyr)
library(ggplot2)

#LINE plot
# Use geom_line

# Summarize the median gdpPercap by year, then save it as by_year
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianGdpPercap = median(gdpPercap))


# Create a line plot showing the change in medianGdpPercap over time
ggplot(by_year, aes(x = year, y = medianGdpPercap)) + 
  geom_line() + 
  expand_limits(y = 0)

library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize the median gdpPercap by year & continent, save as by_year_continent
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap by continent over time
ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, colour = continent)) +
  geom_line() + 
  expand_limits(y = 0)

# BAR plot
# Use geom_col()
# x = categorical variable

# Summarize the median gdpPercap by continent in 1952
by_continent <- gapminder %>%
  filter(year == 1952) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a bar plot showing medianGdp by continent

ggplot(by_continent, aes(x = continent, y = medianGdpPercap)) + 
  geom_col()

# Filter for observations in the Oceania continent in 1952
oceania_1952 <- gapminder %>%
  filter(year == 1952, continent == "Oceania")

# Create a bar plot of gdpPercap by country
ggplot(oceania_1952, aes(x = country, y = gdpPercap)) + 
  geom_col()

# HISOMGRAM plot
# geom_histogram
# x = continuous numerical variable
# binwidth = 5, can be used to override the default
# bins = x sets the total number of bins 

gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)

# Create a histogram of population (pop_by_mil)
ggplot(gapminder_1952, aes(x = pop_by_mil)) +
  geom_histogram(bins = 50)

# Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952, aes(x = pop)) + 
  geom_histogram() +
  scale_x_log10()

# BOX plot
# geom_boxplot
# Good for comparing distibutions
# black lines = median value
# box = 25 percentile and 75 percentile
# lines going up (whiskers) cover other values

# Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) + 
  geom_boxplot() + 
  scale_y_log10() + 
  # Adding a title
  ggtitle("Comparing GDP per capita across continents")


