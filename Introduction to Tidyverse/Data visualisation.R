# Install packages
#install.packages("gapminder")
#install.packages("dplyr")
#install.packages("ggplot2")


# Load packages
library(gapminder)
library(dplyr)
library(ggplot2)

# Create gapminder_1952
gapminder_1952 <- gapminder %>%
  filter(year  == 1952)

# SCATTER plot

# aes (aesthetic) is required to set axes.
# geom_point sets the chart type as scatter - each piece of data is a data point 
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point()

# LOG scales

# scale_x_log10 sets the axes to a log 10 scale
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() + 
  scale_x_log10()

# Scatter plot comparing pop and gdpPercap, with both axes on a log scale
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) + 
  geom_point() + 
  scale_x_log10() + 
  scale_y_log10()

# Additonal aesthetics
# e.g. colour, size. Must be used in aes()

ggplot(gapminder_1952, aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)) + 
  geom_point() + 
  scale_x_log10() + 
  scale_y_log10()

# Faceting
# Divide plot into subplots
# ~ denotes by
ggplot(gapminder_1952, aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)) + 
  geom_point() + 
  scale_x_log10() + 
  scale_y_log10() + 
  facet_wrap(~continent)

# Scatter plot comparing gdpPercap and lifeExp, with color representing continent
# and size representing population, faceted by year
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)) + 
  geom_point() + 
  scale_x_log10() + 
  facet_wrap(~year)
